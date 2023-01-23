-- Nan Mu, Xin Li project
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config_pkg.all;
use work.user_pkg.all;

entity fifo_counter is
    port (
        clk          : in std_logic;
        rst          : in std_logic;
        go           : in std_logic;
        fifo_rd_en   : in std_logic;
        size         : in std_logic_vector (16 downto 0);
        -- debug info
        dram_rd_counter : out std_logic_vector(16 downto 0);

        fifo_rd_done : out std_logic
    );
end fifo_counter ;

architecture ARCH of fifo_counter is
    type state_t is (START, COMPUTE, COMPLETE);
    signal state_r : state_t;
    signal n_r : unsigned(size'range);
begin
    process(clk, rst)
    begin
        if(rst = '1') then
            fifo_rd_done <= '0';
            state_r <= START;
        elsif(rising_edge(clk)) then
            case(state_r) is
                when START =>
                    n_r <= unsigned(size);
                    if(go = '1') then
                        fifo_rd_done <= '0';
                        state_r <= COMPUTE;
                    end if;
                when COMPUTE =>
                    if(fifo_rd_en = '1') then
                        n_r <= n_r - 1;
                        if(n_r <= 1) then
                            state_r <= START;
                            fifo_rd_done <= '1';
                        end if;
                    end if;
                when others => null;
            end case;
        end if;
    end process;
    dram_rd_counter <= std_logic_vector(unsigned(size) - n_r);

end ARCH;