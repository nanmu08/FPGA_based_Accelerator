--Nan Mu, Xin Li, project

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config_pkg.all;
use work.user_pkg.all;

entity dram_rd is
    port (
        dram_clk             : in  std_logic;
        user_clk             : in  std_logic;
        dram_rst             : in  std_logic;
        user_rst             : in  std_logic;
        go                   : in  std_logic;
        rd_en                : in  std_logic;
        stall                : in  std_logic;
        start_addr           : in  std_logic_vector (14 downto 0);
        size                 : in  std_logic_vector (16 downto 0);
        valid                : out std_logic;
        data                 : out std_logic_vector (15 downto 0);
        done                 : out std_logic;
        debug_count          : out std_logic_vector (16 downto 0);
        debug_dma_size       : out std_logic_vector (15 downto 0);
        debug_dma_start_addr : out std_logic_vector (14 downto 0);
        debug_dma_addr       : out std_logic_vector (14 downto 0);
        debug_dma_prog_full  : out std_logic;
        debug_dma_empty      : out std_logic;
        dram_ready           : in  std_logic;
        dram_rd_en           : out std_logic;
        dram_rd_addr         : out std_logic_vector (14 downto 0);
        dram_rd_data         : in  std_logic_vector (31 downto 0);
        dram_rd_valid        : in  std_logic
        );
end dram_rd;

architecture default of dram_rd is
    signal addr_gene_go          : std_logic;
    signal addr_gene_size        : std_logic_vector(16 downto 0);
    signal addr_gene_done        : std_logic;
    signal handshake_ack         : std_Logic;
    signal dram_rd_fifo_empty    : std_logic;
    signal dram_rd_fifo_progfull : std_logic;
    signal dram_rd_fifo_full     : std_logic;
    signal fifo_rst              : std_logic;
    signal fifo_rd_en            : std_logic;
    signal fifo_rd_done          : std_logic;
    signal fifo_done_rst         : std_logic;
    signal fifo_data_in          : std_logic_vector(31 downto 0);
    signal dram_rd_addr_debug    : std_logic_vector(14 downto 0);
    signal dram_rd_counter       : std_logic_vector(16 downto 0);
    signal fifo_rd_finish        : std_logic;
begin

    --size conversion
    addr_gene_size <= std_logic_vector(unsigned(size) / 2) when (unsigned(size) mod 2) = 0
                       else std_logic_vector(unsigned(size) / 2 + 1);

    U_ADDR_GENE : entity work.addr_generator
        port map (
            clk           => dram_clk, 
            rst           => dram_rst,
            go            => addr_gene_go,
            dram_ready    => dram_ready,
            size          => addr_gene_size,
            stall         => dram_rd_fifo_progfull,
            start_addr    => start_addr,
            done          => addr_gene_done,
            rd_en         => dram_rd_en,
            addr_to_DRAM  => dram_rd_addr_debug
        );

    U_ADDR_GENE_SYNC : entity work.handshake_dram_rd
        port map (
            clk_src   => user_clk,
            clk_dest  => dram_clk,
            rst_src   => user_rst,
            rst_dest  => dram_rst,
            go        => go,
            
            rcv       => addr_gene_go,
            ack       => handshake_ack
        );

    U_DRAM_FIFO : entity work.dram_fifo
        port map (
            clk_src     => dram_clk,
            clk_dest    => user_clk,
            rst         => fifo_rst, 
            empty       => dram_rd_fifo_empty,
            full        => dram_rd_fifo_full,
            prog_full   => dram_rd_fifo_progfull,
            rd_en       => fifo_rd_en,
            wr_en       => dram_rd_valid,
            data_in     => fifo_data_in,
            data_out    => data
        );

    -- if fifo not empty, tell user_app data valid
    valid <= not dram_rd_fifo_empty and not fifo_rd_done;
    fifo_rd_en <= rd_en and not dram_rd_fifo_empty and not fifo_rd_done;
    done <= fifo_rd_done;
    -- when fifo rd_en up to size, then fifo also need to rst
    fifo_rst <= dram_rst or fifo_done_rst;
    
    -- swap dram_rd_data before put in fifo
    fifo_data_in(31 downto 16) <= dram_rd_data(15 downto 0);
    fifo_data_in(15 downto 0) <= dram_rd_data(31 downto 16);
    
    -- fifo_counter used to calculate when fifo_rd is up to size
    U_COUNTER : entity work.fifo_counter
        port map (
            clk          => user_clk,
            rst          => user_rst,
            go           => go,
            fifo_rd_en   => fifo_rd_en,
            size         => size,
            dram_rd_counter => dram_rd_counter,
            fifo_rd_done => fifo_rd_done
        );
    
    U_DUALFLOP : entity work.delay
        generic map (
            cycles => 2,               
            width  => 1,
            RESET_VALUE => "0"
            )
        port map (
            clk       => dram_clk,
            rst       => dram_rst,
            en        => C_1,
            input(0)  => fifo_rd_done,
            output(0) => fifo_done_rst
            );
    
    -- pass debug info
    debug_count          <= dram_rd_counter;
    debug_dma_size       <= addr_gene_size(15 downto 0);
    debug_dma_start_addr <= start_addr;
    debug_dma_addr       <= dram_rd_addr_debug;
    debug_dma_prog_full  <= dram_rd_fifo_progfull;
    debug_dma_empty      <= dram_rd_fifo_empty;
    dram_rd_addr         <= dram_rd_addr_debug;
end default;