-- Greg Stitt
-- University of Florida
-- EEL 5721/4720 Reconfigurable Computing
--
-- File: wrapper_tb.vhd
--
-- This testbench simulates the dram_test application from the wrapper entity
-- so that it can access the emulated DRAMs.
--
-- IMPORTANT: This is not provided as a thorough testbench. It is up to you
-- to extend it to test your own design.
-- Nan Mu, Xin Li, project
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use work.config_pkg.all;
use work.user_pkg.all;

entity wrapper_tb is
end wrapper_tb;

architecture behavior of wrapper_tb is

    constant TEST_SIZE  : integer := 256;
    constant MAX_CYCLES : integer := TEST_SIZE*100;

    constant MAX_MMAP_READ_CYCLES : integer := 100;


    constant CLK0_HALF_PERIOD : time := 5 ns;

    signal clks : std_logic_vector(NUM_CLKS_RANGE) := (others => '0');
    signal rst  : std_logic                        := '1';

    signal mmap_wr_en   : std_logic                         := '0';
    signal mmap_wr_addr : std_logic_vector(MMAP_ADDR_RANGE) := (others => '0');
    signal mmap_wr_data : std_logic_vector(MMAP_DATA_RANGE) := (others => '0');

    signal mmap_rd_en         : std_logic                         := '0';
    signal mmap_rd_addr       : std_logic_vector(MMAP_ADDR_RANGE) := (others => '0');
    signal mmap_rd_data       : std_logic_vector(MMAP_DATA_RANGE);
    signal mmap_rd_data_valid : std_logic;

    type signal_array_t is array(0 to C_MAX_SIGNAL_SIZE-1) of std_logic_vector(15 downto 0);
    signal padded_signal : signal_array_t := (others => (others => '0'));

    type kernel_array_t is array(0 to C_KERNEL_SIZE-1) of std_logic_vector(31 downto 0);
    signal kernel : kernel_array_t := (others => (others => '0'));

    signal sim_done : std_logic := '0';

    constant C_MMAP_CYCLES : positive := 1;

    -- function to check if the outputs is correct
    function checkOutput (
        i : integer)
        return integer is

    begin
        return i+1;
    end checkOutput;


    procedure clearMMAP (signal mmap_rd_en : out std_logic;
                         signal mmap_wr_en : out std_logic) is
    begin
        mmap_rd_en <= '0';
        mmap_wr_en <= '0';
    end clearMMAP;


    -- Read from the memory map and wait until the data is marked as valid.
    -- The result is available in mmap_rd_data upon completion.
    procedure mmap_read(constant addr       : in  std_logic_vector(MMAP_ADDR_RANGE);
                        constant MAX_CYCLES : in  natural;
                        signal mmap_rd_addr : out std_logic_vector(MMAP_ADDR_RANGE);
                        signal mmap_rd_en   : out std_logic
                        ) is

        variable count : integer := 0;

    begin

        mmap_rd_addr <= addr;
        mmap_rd_en   <= '1';
        wait until (rising_edge(clks(0)));
        mmap_rd_en   <= '0';

        while (mmap_rd_data_valid = '0' and count < MAX_CYCLES) loop
            count := count + 1;
            wait until (rising_edge(clks(0)));
        end loop;

        if (count = MAX_CYCLES) then
            report "ERROR: MMAP read timeout.";
        end if;

    end procedure;


    -- Run convolve
    -- size is the unpadded signal size in 16-bit elements.
    procedure run_test(constant test_name :    string;
                       constant size      : in natural;

                       signal mmap_wr_addr : out std_logic_vector(MMAP_ADDR_RANGE);
                       signal mmap_wr_data : out std_logic_vector(MMAP_DATA_RANGE);
                       signal mmap_wr_en   : out std_logic;
                       signal mmap_rd_addr : out std_logic_vector(MMAP_ADDR_RANGE);
                       signal mmap_rd_en   : out std_logic;

                       signal padded_signal : inout signal_array_t;
                       signal kernel : inout kernel_array_t
                       ) is

        variable count  : integer   := 0;
        variable errors : integer   := 0;
        variable done   : std_logic := '0';

        constant MAX_DONE_CYCLES : integer := size * 20;

        constant PADDED_SIGNAL_SIZE : integer := size + 2*(C_KERNEL_SIZE-1);
        constant DRAM_WORDS         : integer := PADDED_SIGNAL_SIZE / 2 + PADDED_SIGNAL_SIZE mod 2;
        --self added
        constant OUTPUT_SIZE        : integer := size + C_KERNEL_SIZE-1;
        constant OUTPUT_DRAM_WORDS  : integer := OUTPUT_SIZE / 2 + OUTPUT_SIZE mod 2;
        variable convolve_result    : window(0 to OUTPUT_SIZE - 1) := (others => (others => '0'));
        variable temp               : std_logic_vector(15 downto 0);
        variable product            : std_logic_vector(47 downto 0);
        variable cut_product        : std_logic_vector(15 downto 0);
        variable convolve_sum       : std_logic_vector(15 downto 0);
        variable low_read           : std_logic_vector(15 downto 0);
        variable high_read          : std_logic_vector(15 downto 0);
    begin

        -- Create the padded signal.
        for i in 0 to C_KERNEL_SIZE-2 loop
            padded_signal(i) <= (others => '0');
        end loop;

        for i in 0 to size-1 loop
            padded_signal(i+C_KERNEL_SIZE-1) <= std_logic_vector(to_unsigned(1, 16));
        end loop;

        for i in 0 to C_KERNEL_SIZE-2 loop
            padded_signal(i+size+C_KERNEL_SIZE-1) <= (others => '0');
        end loop;

        -- Define the kernel. kernel value from 1 to kernel size
        for i in 0 to C_KERNEL_SIZE-1 loop
            kernel(i) <= std_logic_vector(to_unsigned(i+1, 32));
        end loop;

        -- Define the kernel. kernel value is all 1
        -- for i in 0 to C_KERNEL_SIZE-1 loop
        --     kernel(i) <= std_logic_vector(to_unsigned(1, 32));
        -- end loop;

        mmap_wr_addr <= (others => '1');
        mmap_wr_en   <= '1';
        mmap_wr_data <= std_logic_vector(to_unsigned(0, C_MMAP_DATA_WIDTH));
        wait until rising_edge(clks(0));
        clearMMAP(mmap_rd_en, mmap_wr_en);

        -- Write the padded signal to RAM.
        for i in 0 to DRAM_WORDS-1 loop
            mmap_wr_addr <= std_logic_vector(to_unsigned(i, C_MMAP_ADDR_WIDTH));
            mmap_wr_en   <= '1';

            -- Pack two 16-bit inputs.
            --mmap_wr_data <= std_logic_vector(to_unsigned(padded_signal(2*i+1), C_MMAP_DATA_WIDTH/2) & to_unsigned(padded_signal(2*i), C_MMAP_DATA_WIDTH/2));
            mmap_wr_data <= padded_signal(2*i+1) & padded_signal(2*i);

            wait until rising_edge(clks(0));
        end loop;
        clearMMAP(mmap_rd_en, mmap_wr_en);

        for i in 0 to 3 loop
            wait until rising_edge(clks(0));
        end loop;

        -- Enable user mode to access user_app memory map
        mmap_wr_addr <= (others => '1');
        mmap_wr_en   <= '1';
        mmap_wr_data <= std_logic_vector(to_unsigned(1, C_MMAP_DATA_WIDTH));
        wait until rising_edge(clks(0));
        clearMMAP(mmap_rd_en, mmap_wr_en);

        -- self added Clear the buffers
        mmap_wr_addr <= C_CLEAR_ADDR;
        mmap_wr_en   <= '1';
        mmap_wr_data <= std_logic_vector(to_unsigned(1, C_MMAP_DATA_WIDTH));
        wait until rising_edge(clks(0));
        clearMMAP(mmap_rd_en, mmap_wr_en);

        -- Transfer the kernel
        for i in 0 to C_KERNEL_SIZE-1 loop
            mmap_wr_addr <= C_KERNEL_DATA_ADDR;
            mmap_wr_en   <= '1';
            mmap_wr_data <= kernel(i);
            wait until rising_edge(clks(0));
            clearMMAP(mmap_rd_en, mmap_wr_en);
        end loop;

        -- Specify the starting write address
        mmap_wr_addr <= C_SIGNAL_SIZE_ADDR;
        mmap_wr_en   <= '1';
        mmap_wr_data <= std_logic_vector(to_unsigned(size, C_MMAP_DATA_WIDTH));
        wait until rising_edge(clks(0));
        clearMMAP(mmap_rd_en, mmap_wr_en);


        -- Start user_app
        mmap_wr_addr <= C_GO_ADDR;
        mmap_wr_en   <= '1';
        mmap_wr_data <= std_logic_vector(to_unsigned(1, C_MMAP_DATA_WIDTH));
        wait until rising_edge(clks(0));
        clearMMAP(mmap_rd_en, mmap_wr_en);

        -- Since the user clock domain is slower, we need to give some time for
        -- done to be cleared from previous runs.
        -- self edit change 9 to 60 because after kersize lager, 
        -- need more cycle to write kernel to memory and then insert GO, user app go and rd done too closer
        for i in 0 to 60 loop
            wait until (rising_edge(clks(0)));
        end loop;

        done  := '0';
        count := 0;

        -- Wait for done to be asserted.
        while done = '0' and count < MAX_DONE_CYCLES loop

            mmap_read(C_DONE_ADDR, MAX_MMAP_READ_CYCLES, mmap_rd_addr, mmap_rd_en);
            done  := mmap_rd_data(0);
            count := count + 1;
        end loop;

        if (done /= '1') then
            errors := errors + 1;
            report "ERROR: Done signal not asserted before timeout.";
        end if;

       -- self added, testbench calculate convolustion results for this test
       for i in 0 to OUTPUT_SIZE - 1 loop
        -- convolve_sum := std_logic_vector(to_unsigned(0, 16));
            for j in 0 to C_KERNEL_SIZE-1 loop
                -- temp := padded_signal(i + j);
                product := std_logic_vector(unsigned(padded_signal(i + j)) * unsigned(kernel(C_KERNEL_SIZE - 1 - j)));
                if(unsigned(product(47 downto 16)) > 0) then
                    cut_product := (others => '1');
                else
                    cut_product := product(15 downto 0);
                end if;
                convolve_sum := std_logic_vector(unsigned(convolve_result(i)) + unsigned(cut_product));
                convolve_result(i) := convolve_sum;
            end loop;
            -- report "Result for convolve " & integer'image(i) &
            -- " is " & integer'image(to_integer(unsigned(convolve_result(i))));
        end loop;

        -- Disable user mode to access DRAM.
        mmap_wr_addr <= (others => '1');
        mmap_wr_en   <= '1';
        mmap_wr_data <= std_logic_vector(to_unsigned(0, C_MMAP_DATA_WIDTH));
        wait until rising_edge(clks(0));
        clearMMAP(mmap_rd_en, mmap_wr_en);



        -- Read outputs from output memory
        for i in 0 to OUTPUT_DRAM_WORDS-1 loop

            mmap_read(std_logic_vector(to_unsigned(i, C_MMAP_ADDR_WIDTH)), MAX_MMAP_READ_CYCLES, mmap_rd_addr, mmap_rd_en);
            -- check if output match testbench calculated result
            low_read := mmap_rd_data(15 downto 0);
            high_read := mmap_rd_data(31 downto 16);

            if(unsigned(low_read) /= unsigned(convolve_result(i*2))) then
                errors := errors + 1;
                report "Result for " & integer'image(i*2) &
                " is incorrect. The output is " &
                integer'image(to_integer(unsigned(low_read))) &
                " but should be " & integer'image(to_integer(unsigned(convolve_result(i*2))));
            -- else
            --     report "User_app Result for " & integer'image(i*2) &
            --     " match TB convolve_result. User_app output is " &
            --     integer'image(to_integer(unsigned(low_read))) &
            --     ", TB result is " & integer'image(to_integer(unsigned(convolve_result(i*2))));
            end if;
            if((i*2 + 1) < OUTPUT_SIZE) then
                if(unsigned(high_read) /= unsigned(convolve_result(i*2 + 1))) then
                    errors := errors + 1;
                    report "Result for " & integer'image(i*2+1) &
                    " is incorrect. The output is " &
                    integer'image(to_integer(unsigned(high_read))) &
                    " but should be " & integer'image(to_integer(unsigned(convolve_result(i*2 + 1))));
                -- else
                --     report "User_app Result for " & integer'image(i*2 + 1) &
                --     " match tb convolve result. User_app output is " &
                --     integer'image(to_integer(unsigned(high_read))) &
                --     " tb result is " & integer'image(to_integer(unsigned(convolve_result(i*2 + 1))));
                end if;
            end if;
        -- if (unsigned(mmap_rd_data) /= checkOutput(i)) then
        --     errors := errors + 1;
        --     report "Result for " & integer'image(i) &
        --         " is incorrect. The output is " &
        --         integer'image(to_integer(unsigned(mmap_rd_data))) &
        --         " but should be " & integer'image(checkOutput(i));
        -- end if;
        end loop;

        --report test_name & " completed. Total Errors: " & integer'image(errors);
        report test_name & " completed. " & "size: " & integer'image(size) & ", Total Errors: " & integer'image(errors);
        --report test_name & " completed.";
    end procedure;

begin

    UUT : entity work.wrapper
        port map (
            clks               => clks,
            rst                => rst,
            mmap_wr_en         => mmap_wr_en,
            mmap_wr_addr       => mmap_wr_addr,
            mmap_wr_data       => mmap_wr_data,
            mmap_rd_en         => mmap_rd_en,
            mmap_rd_addr       => mmap_rd_addr,
            mmap_rd_data       => mmap_rd_data,
            mmap_rd_data_valid => mmap_rd_data_valid);

    -- Toggle clocks
    clks(0) <= not clks(0) after 5 ns when sim_done = '0' else clks(0);
    clks(1) <= not clks(1) after 7 ns when sim_done = '0' else clks(1);

    -- Main testbench code.
    process
    begin
        -- Reset circuit  
        rst <= '1';
        clearMMAP(mmap_rd_en, mmap_wr_en);
        for i in 0 to 20 loop
            wait until rising_edge(clks(0));
        end loop;

        -- Clear reset
        rst <= '0';
        for i in 0 to 20 loop
            wait until rising_edge(clks(0));
        end loop;

        -- Here are some sample tests that you can use.
        -- TODO: add whatever tests you think you need to debug.
        -- Hint: if a test is failing on the board, recreate it here.
        run_test("Test0", 10, mmap_wr_addr, mmap_wr_data, mmap_wr_en, mmap_rd_addr, mmap_rd_en, padded_signal, kernel);
        
        run_test("Test1", 1000, mmap_wr_addr, mmap_wr_data, mmap_wr_en, mmap_rd_addr, mmap_rd_en, padded_signal, kernel);

        run_test("Test2", 301, mmap_wr_addr, mmap_wr_data, mmap_wr_en, mmap_rd_addr, mmap_rd_en, padded_signal, kernel);
        run_test("Test3", 10000, mmap_wr_addr, mmap_wr_data, mmap_wr_en, mmap_rd_addr, mmap_rd_en, padded_signal, kernel);
        run_test("Test4", 5000, mmap_wr_addr, mmap_wr_data, mmap_wr_en, mmap_rd_addr, mmap_rd_en, padded_signal, kernel);
        run_test("Test5", 860, mmap_wr_addr, mmap_wr_data, mmap_wr_en, mmap_rd_addr, mmap_rd_en, padded_signal, kernel);
        run_test("Test6", 77, mmap_wr_addr, mmap_wr_data, mmap_wr_en, mmap_rd_addr, mmap_rd_en, padded_signal, kernel);
        report "SIMULATION FINISHED.";
        sim_done <= '1';
        wait;

    end process;
end behavior;
