-- Greg Stitt
-- University of Florida
-- Nan Mu, Xin Li project
library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;
use work.math_custom.all;
use ieee.numeric_std.all;
use work.config_pkg.all;
use work.user_pkg.all;

entity user_app is
    port (
        clk : in std_logic;
        rst : in std_logic;

        -- Memory-map interface
        mmap_wr_en   : in  std_logic;
        mmap_wr_addr : in  std_logic_vector(MMAP_ADDR_RANGE);
        mmap_wr_data : in  std_logic_vector(MMAP_DATA_RANGE);
        mmap_rd_en   : in  std_logic;
        mmap_rd_addr : in  std_logic_vector(MMAP_ADDR_RANGE);
        mmap_rd_data : out std_logic_vector(MMAP_DATA_RANGE);

        -- DMA read interface for RAM 0
        ram0_rd_rd_en : out std_logic;
        ram0_rd_go    : out std_logic;
        ram0_rd_valid : in  std_logic;
        ram0_rd_data  : in  std_logic_vector(RAM0_RD_DATA_RANGE);
        ram0_rd_addr  : out std_logic_vector(RAM0_ADDR_RANGE);
        ram0_rd_size  : out std_logic_vector(RAM0_RD_SIZE_RANGE);
        ram0_rd_done  : in  std_logic;

        debug_ram0_rd_count      : in std_logic_vector(RAM0_RD_SIZE_RANGE);
        debug_ram0_rd_start_addr : in std_logic_vector(RAM0_ADDR_RANGE);
        debug_ram0_rd_addr       : in std_logic_vector(RAM0_ADDR_RANGE);
        debug_ram0_rd_size       : in std_logic_vector(C_RAM0_ADDR_WIDTH downto 0);
        debug_ram0_rd_prog_full  : in std_logic;
        debug_ram0_rd_empty      : in std_logic;

        -- DMA write interface for RAM 1 
        ram1_wr_ready : in  std_logic;
        ram1_wr_go    : out std_logic;
        ram1_wr_valid : out std_logic;
        ram1_wr_data  : out std_logic_vector(RAM1_WR_DATA_RANGE);
        ram1_wr_addr  : out std_logic_vector(RAM1_ADDR_RANGE);
        ram1_wr_size  : out std_logic_vector(RAM1_WR_SIZE_RANGE);
        ram1_wr_done  : in  std_logic
        );
end user_app;

architecture default of user_app is

    signal go   : std_logic;
    signal size : std_logic_vector(RAM0_RD_SIZE_RANGE);
    signal done : std_logic;
    --self added
    signal kernel_data : std_logic_vector(KERNEL_WIDTH_RANGE);
    signal kernel_window : window(0 to C_KERNEL_SIZE - 1);
    signal kernel_empty  : std_logic;
    signal kernel_full   : std_logic;
    signal kernel_wr_en  : std_logic;
    signal kernel_rd_en  : std_logic;
    signal signal_window : window(0 to C_KERNEL_SIZE - 1);
    signal signal_full   : std_logic;
    signal signal_empty  : std_logic;
    signal signal_rd_en  : std_logic;
    signal signal_wr_en  : std_logic;
    signal pipeline_en   : std_logic;
    signal convolve_out  : std_logic_vector(C_CONVOLVE_WIDTH-1 downto 0);
    signal clear         : std_logic;
    
begin
                                                            
   -- start design for project
    U_MEM : entity work.memory_map
        port map (
            clk        => clk,
            rst        => rst,
            wr_en      => mmap_wr_en,
            wr_addr    => mmap_wr_addr,
            wr_data    => mmap_wr_data,
            rd_en      => mmap_rd_en,
            rd_addr    => mmap_rd_addr,
            rd_data    => mmap_rd_data,

            -- Circuit interface from software        
            go         => go,
            clear    => clear,     
                  
            signal_size  => size,
            kernel_data  => kernel_data,
            kernel_load  => kernel_wr_en,
            kernel_ready => ram1_wr_ready,
            done         => done
            );
    
    U_KERNEL_BUFFER : entity work.smart_buffer(kernel_buffer_arch)
        generic map (
            num_inputs  => C_KERNEL_SIZE,
            input_width => C_KERNEL_WIDTH
        )
        port map (
            clk       => clk,
            rst       => rst,
            wr_en     => kernel_wr_en,
            rd_en     => kernel_rd_en,
            full      => kernel_full,
            empty     => kernel_empty,
            clear     => clear,
            input     => kernel_data,
            output    => kernel_window
        );
    
    U_SIGNAL_BUFFER : entity work.smart_buffer(signal_buffer_arch)
        generic map (
            num_inputs  => C_KERNEL_SIZE,
            input_width => C_SIGNAL_WIDTH
        )
        port map (
            clk       => clk,
            rst       => rst,
            wr_en     => signal_wr_en,
            rd_en     => signal_rd_en,
            full      => signal_full,
            empty     => signal_empty,
            clear     => clear,
            input     => ram0_rd_data,
            output    => signal_window
        );

    U_CONVOLVE : entity work.mult_add_tree(unsigned_arch)
        generic map (
            num_inputs   => C_KERNEL_SIZE,
            input1_width => C_SIGNAL_WIDTH,
            input2_width => C_KERNEL_WIDTH
            )
        port map (
            clk    => clk,
            rst    => rst,
            en     => C_1,
            pipeline_en     => pipeline_en,
            input1 => signal_window,
            input2 => kernel_window,
            output => convolve_out
            );

    U_DELAY : entity work.delay
        generic map (
            CYCLES => C_CONVOLVE_DELAY,               
            WIDTH  => 1,
            RESET_VALUE => "0")
        port map (
            clk       => clk,
            rst       => rst,
            en        => C_1,
            input(0)  => pipeline_en,
            output(0) => ram1_wr_valid);

    -- RAM0 control.
    process(clk, rst)
    begin
        if (rst = '1') then

        elsif (rising_edge(clk)) then

            pipeline_en <= ram1_wr_ready and not kernel_empty and not signal_empty;

        end if;
    end process;
    ram0_rd_go    <= go;
    ram0_rd_rd_en <= ram0_rd_valid and ram1_wr_ready and not signal_full;
    --ram0_rd_rd_en <= ram0_rd_valid and ram1_wr_ready;
    -- padded input signal size
    ram0_rd_size <= std_logic_vector(unsigned(size) + (C_KERNEL_SIZE - 1) * 2);
    ram0_rd_addr <= std_logic_vector(to_unsigned(0, ram0_rd_addr'length));
    -- RAM1 control.
    ram1_wr_go    <= go;
    --ram1_wr_size  <= size;
    -- padded output signal size
    ram1_wr_size <= std_logic_vector(unsigned(size) + C_KERNEL_SIZE - 1);

    ram1_wr_addr <= std_logic_vector(to_unsigned(0, ram1_wr_addr'length));
    done <= ram1_wr_done;
    signal_wr_en <= ram0_rd_valid and not signal_full;
    --signal_wr_en <= ram0_rd_valid;
    --self added
    kernel_rd_en <= ram1_wr_ready and not kernel_empty;

    signal_rd_en <= ram1_wr_ready and not signal_empty;



    ram1_wr_data <= (others => '1') 
    when unsigned(convolve_out(C_CONVOLVE_WIDTH-1 downto C_RAM1_WR_DATA_WIDTH)) > 0 
    else convolve_out(C_RAM1_WR_DATA_WIDTH-1 downto 0);
end default;
