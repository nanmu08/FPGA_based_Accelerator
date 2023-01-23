-- Nan Mu, Xin Li, project
-- entity for single-buffer used for pipeline in user app
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use work.config_pkg.all;
use work.user_pkg.all;

entity smart_buffer is
    generic (
        num_inputs : positive := C_KERNEL_SIZE;
        input_width: positive := C_SIGNAL_WIDTH
    );
    port (
        clk       : in  std_logic;
        rst       : in  std_logic;
        wr_en     : in  std_logic;
        rd_en     : in  std_logic;
        full      : out std_logic;
        empty     : out std_logic;
        clear     : in std_logic;
        input     : in std_logic_vector(input_width - 1 downto 0);
        output    : out window(0 to num_inputs - 1)
    );
end smart_buffer;

architecture signal_buffer_arch of smart_buffer is
    signal buffer_data : window(0 to num_inputs - 1);
    signal buffer_full, buffer_empty : std_logic;
    signal count_r : unsigned(7 downto 0);
begin
    process(clk, rst)
    variable count : unsigned(7 downto 0);
    begin
        if (rst = '1') then
            for i in 0 to num_inputs-1 loop
                --output(i) <= (others => '0');
                buffer_data(i) <= (others => '0');
                
            end loop;
            --buffer_full <= '0';
            --buffer_empty <= '1';
            count_r <= (others => '0');
            count := to_unsigned(0, 8);
        elsif (rising_edge(clk)) then
            --work for clear buffer??
            if(clear = '1') then
                for i in 0 to num_inputs-1 loop
                    --output(i) <= (others => '0');
                    buffer_data(i) <= (others => '0');
                end loop;
                --buffer_full <= '0';
                --buffer_empty <= '1';
                count := to_unsigned(0, 8);
                count_r <= (others => '0');
            end if;
            
            if (rd_en = '1') then
                output <= buffer_data;
                count := count - 1;
            end if;
            if (wr_en = '1') then
               buffer_data(0) <= input;
               for i in 0 to num_inputs - 2 loop
                   buffer_data(i+1) <= buffer_data(i);
                end loop;
                count := count + 1;
            end if;
            -- if (count < num_inputs) then
            --     empty <= '1';
            --     full <= '0';
            -- else
            --     empty <= '0';
            --     if(rd_en = '1') then
            --         full <= '0';
            --     else
            --         full <= '1';
            --     end if;
            -- end if;
            count_r <= count;

        end if;
    end process;

    -- conbinational process set empty and full signal
    process(count_r, rd_en)
    begin
        buffer_empty <= '0';
        buffer_full  <= '0';
        if (count_r < num_inputs) then
            buffer_empty <= '1';
        end if;
        if((count_r >= num_inputs) and (rd_en = '0')) then
            buffer_full <= '1';
        end if;
    end process;
    empty <= buffer_empty;
    full <= buffer_full;
    
end signal_buffer_arch;

architecture kernel_buffer_arch of smart_buffer is
    --signal buffer_data : window(0 to num_inputs - 1);
    signal buffer_data : window(num_inputs - 1 downto 0);
    signal buffer_full, buffer_empty : std_logic;
    
begin
    process(clk, rst)
    variable count : unsigned(7 downto 0);
    begin
        if (rst = '1') then
            for i in 0 to num_inputs-1 loop
                output(i) <= (others => '0');
                buffer_data(i) <= (others => '0');
            end loop;
            full <= '0';
            empty <= '1';
            count := to_unsigned(0, 8);
        elsif (rising_edge(clk)) then
            if(clear = '1') then
                for i in 0 to num_inputs-1 loop
                    output(i) <= (others => '0');
                    buffer_data(i) <= (others => '0');
                end loop;
                full <= '0';
                empty <= '1';
                count := to_unsigned(0, 8);
            end if;
            if (wr_en = '1') then
               buffer_data(0) <= input;
               for i in 0 to num_inputs - 2 loop
                   buffer_data(i+1) <= buffer_data(i);
                end loop;
                count := count + 1;
            end if;
            if (rd_en = '1') then
                output <= buffer_data;
                
            end if;
            if (count < num_inputs) then
                empty <= '1';
                full <= '0';
            else
                empty <= '0';
                full <= '1';
            end if;
        end if;
    end process;
    --full <= buffer_full;
    --empty <= buffer_empty;
end kernel_buffer_arch;