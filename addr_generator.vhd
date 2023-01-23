--Nan Mu, Xin Li, project

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config_pkg.all;
use work.user_pkg.all;

entity addr_generator is
    port (
        clk         : in  std_logic;
        rst         : in  std_logic;
        go          : in std_logic;
        dram_ready  : in std_logic;
        size        : in std_logic_vector(16 downto 0);
        stall       : in std_logic;
        start_addr  : in  std_logic_vector(14 downto 0);
        done        : out  std_logic;
        rd_en       : out std_logic;
        addr_to_DRAM : out std_logic_vector(14 downto 0)
    );
end addr_generator;

architecture ARCH of addr_generator is
    type state_t is (START, IF_EN, COMPUTE, IF_STALL, COMPLETE);
    signal state_r : state_t;
    signal n_r : unsigned(size'range);
    signal next_addr : std_logic_vector(addr_to_DRAM'range);
begin
    process(clk, rst)
    begin
        if(rst = '1') then
            state_r <= START;
            done <= '0';
            addr_to_DRAM  <= (others => '0');
            next_addr <= (others => '0');
            rd_en <= '0';
        elsif(clk'event and clk = '1') then
            case (state_r) is
                when START =>
                    n_r <= unsigned(size);
                    --next_addr <= std_logic_vector(unsigned(start_addr) + 1);
                    next_addr <= start_addr;
                    --addr_to_DRAM <= start_addr;
                    rd_en <= '0';
                    if(go = '1') then
                        done <= '0';
                        state_r <= IF_EN;
                    end if;
                when IF_EN =>
                    if(dram_ready = '1') then
                        state_r <= COMPUTE;
                    end if;
                when COMPUTE =>
                    if(dram_ready = '1') then
                        if(stall = '0') then
                            rd_en <= '1';
                            addr_to_DRAM <= next_addr;
                            next_addr <= std_logic_vector(unsigned(next_addr) + 1);
                            n_r <= n_r -1;
                            if(n_r <= 1) then
                                state_r <= COMPLETE;
                            end if;
                        else
                            rd_en <= '0';
                        end if;
                    end if;
                when COMPLETE =>
                    done <= '1';
                    rd_en <= '0';
                    state_r <= START;
                when others => null;
            end case;
        end if;
    end process;
    
end ARCH;