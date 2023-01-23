--Nan Mu, Xin Li, project

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config_pkg.all;
use work.user_pkg.all;

entity handshake_dram_rd is
    port (
        clk_src   : in  std_logic;
        clk_dest  : in  std_logic;
        rst_src   : in  std_logic;
        rst_dest  : in  std_logic;
        go        : in  std_logic;
        --delay_ack : in  std_logic;
        rcv       : out std_logic;
        ack       : out std_logic
        );
end handshake_dram_rd;

architecture ARCH of handshake_dram_rd is
    type state_type is (S_READY, S_WAIT_FOR_ACK, S_RESET_ACK);
    type state_type2 is (S_READY, S_SEND_ACK, S_RESET_ACK);
    signal state_src  : state_type;
    signal state_dest : state_type2;

    signal send_src_r : std_logic;
    signal ack_dest_r : std_logic;
    --add send and ack sync
    type reg_array_t is array (0 to 1) of std_logic;
    signal send_sync, ack_sync : reg_array_t;
begin
    -- dram_rd interface send go
    process(clk_src, rst_src)
    begin
        if (rst_src = '1') then
            state_src  <= S_READY;
            send_src_r <= '0';
            ack        <= '0';
            
            ack_sync(0) <= '0';
            ack_sync(1) <= '0';
        elsif (rising_edge(clk_src)) then
            ack <= '0';
            ack_sync(0) <= ack_dest_r;
            ack_sync(1) <= ack_sync(0);
            case state_src is
                when S_READY =>
                    if (go = '1') then
                        send_src_r <= '1';
                        state_src  <= S_WAIT_FOR_ACK;
                    end if;

                when S_WAIT_FOR_ACK =>
                   
                    if (ack_sync(1) = '1') then
                        send_src_r <= '0';
                        state_src  <= S_RESET_ACK;
                    end if;

                when S_RESET_ACK =>
                    
                    if (ack_sync(1) = '0') then
                        ack       <= '1';
                        state_src <= S_READY;
                    end if;

                when others => null;
            end case;
        end if;
    end process;

    -- addr_generator safe to receive go
    process(clk_dest, rst_dest)
    begin
        if (rst_dest = '1') then
            state_dest <= S_READY;
            ack_dest_r <= '0';
            rcv        <= '0';
            
            send_sync(0) <= '0';
            send_sync(1) <= '0';
        elsif (rising_edge(clk_dest)) then

            rcv <= '0';
            send_sync(0) <= send_src_r;
            send_sync(1) <= send_sync(0);

            case state_dest is
                when S_READY =>
                    -- if source is sending data, assert rcv (received)
                    if (send_sync(1) = '1') then
                        rcv        <= '1';
                        state_dest <= S_SEND_ACK;
                    end if;

                when S_SEND_ACK =>
                    -- send ack to src
                        ack_dest_r <= '1';
                        state_dest <= S_RESET_ACK;
                    
                when S_RESET_ACK =>
                    if (send_sync(1) = '0') then
                        ack_dest_r <= '0';
                        state_dest <= S_READY;
                    end if;

                when others => null;
            end case;
        end if;
    end process;
end ARCH;
