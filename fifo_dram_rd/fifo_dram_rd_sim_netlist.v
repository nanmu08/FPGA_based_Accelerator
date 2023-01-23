// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Wed Nov 30 20:56:19 2022
// Host        : DESKTOP-4DH234D running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/MuNanStudy/MS_semester_fall_2022/ReconfigurableComputing/ip_repo/dram_test_1.0/src/fifo_dram_rd/fifo_dram_rd_sim_netlist.v
// Design      : fifo_dram_rd
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_dram_rd,fifo_generator_v13_2_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_7,Vivado 2022.1" *) 
(* NotValidForBitStream *)
module fifo_dram_rd
   (rst,
    wr_clk,
    rd_clk,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty,
    prog_full,
    wr_rst_busy,
    rd_rst_busy);
  input rst;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [31:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [15:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output prog_full;
  output wr_rst_busy;
  output rd_rst_busy;

  wire [31:0]din;
  wire [15:0]dout;
  wire empty;
  wire full;
  wire prog_full;
  wire rd_clk;
  wire rd_en;
  wire rd_rst_busy;
  wire rst;
  wire wr_clk;
  wire wr_en;
  wire wr_rst_busy;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_valid_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [5:0]NLW_U0_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [6:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [5:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "0" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "6" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "32" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "16" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "1" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_FULL_FLAGS_RST_VAL = "1" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "1" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "2" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "1" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "0" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_FIFO_TYPE = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "4" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "5" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "32" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "31" *) 
  (* C_PROG_FULL_TYPE = "1" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "7" *) 
  (* C_RD_DEPTH = "128" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "7" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "6" *) 
  (* C_WR_DEPTH = "64" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "6" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  fifo_dram_rd_fifo_generator_v13_2_7 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(1'b0),
        .data_count(NLW_U0_data_count_UNCONNECTED[5:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(prog_full),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[6:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(rd_rst_busy),
        .rst(rst),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(1'b0),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(wr_clk),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[5:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "6" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module fifo_dram_rd_xpm_cdc_gray
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [5:0]src_in_bin;
  input dest_clk;
  output [5:0]dest_out_bin;

  wire [5:0]async_path;
  wire [4:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [5:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [5:0]\dest_graysync_ff[1] ;
  wire [5:0]dest_out_bin;
  wire [4:0]gray_enc;
  wire src_clk;
  wire [5:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(\dest_graysync_ff[1] [2]),
        .I2(\dest_graysync_ff[1] [4]),
        .I3(\dest_graysync_ff[1] [5]),
        .I4(\dest_graysync_ff[1] [3]),
        .I5(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [5]),
        .I3(\dest_graysync_ff[1] [4]),
        .I4(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [4]),
        .I2(\dest_graysync_ff[1] [5]),
        .I3(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(\dest_graysync_ff[1] [5]),
        .I2(\dest_graysync_ff[1] [4]),
        .O(binval[3]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[5]),
        .Q(async_path[5]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "7" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module fifo_dram_rd_xpm_cdc_gray__parameterized1
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [6:0]src_in_bin;
  input dest_clk;
  output [6:0]dest_out_bin;

  wire [6:0]async_path;
  wire [5:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [6:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [6:0]\dest_graysync_ff[1] ;
  wire [6:0]dest_out_bin;
  wire [5:0]gray_enc;
  wire src_clk;
  wire [6:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(binval[1]),
        .O(binval[0]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [5]),
        .I3(\dest_graysync_ff[1] [6]),
        .I4(\dest_graysync_ff[1] [4]),
        .I5(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [4]),
        .I2(\dest_graysync_ff[1] [6]),
        .I3(\dest_graysync_ff[1] [5]),
        .I4(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(\dest_graysync_ff[1] [5]),
        .I2(\dest_graysync_ff[1] [6]),
        .I3(\dest_graysync_ff[1] [4]),
        .O(binval[3]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(\dest_graysync_ff[1] [6]),
        .I2(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[5]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\dest_graysync_ff[1] [6]),
        .O(binval[5]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [6]),
        .Q(dest_out_bin[6]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[6]),
        .Q(async_path[6]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "5" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "SINGLE" *) 
module fifo_dram_rd_xpm_cdc_single
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [4:0]syncstages_ff;

  assign dest_out = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "5" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "SINGLE" *) 
module fifo_dram_rd_xpm_cdc_single__2
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [4:0]syncstages_ff;

  assign dest_out = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b1" *) (* DEST_SYNC_FF = "5" *) (* INIT = "1" *) 
(* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "SYNC_RST" *) 
module fifo_dram_rd_xpm_cdc_sync_rst
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [4:0]syncstages_ff;

  assign dest_rst = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b1" *) (* DEST_SYNC_FF = "5" *) (* INIT = "1" *) 
(* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "SYNC_RST" *) 
module fifo_dram_rd_xpm_cdc_sync_rst__2
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [4:0]syncstages_ff;

  assign dest_rst = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
RgPKnWr9n0dGgttm3akiFhAlfB96usOQYxnEmPhGyTGg1AbizYAjGPWLXBWl50n/d0IA71ci4aJB
wt6mtfyNADm3ZReK7D3mKu037BOgxryoEwwf1kiC6q/PllxsdAgEMfQrfHJ3E2AzSpdYjoxVYito
y0JW6CUDcWvWa4WV0EA=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
M0l6KpOGH3jL8eRt3NCD7e2USYnkg5H9GAnE1PKmnjiouFN3Y8kjWA2PZDAQLm9UW+TsC1HeVlzO
WjNCHkjR/6ubCsIcWfpPZWdIuAenlsyq8Y9l6b8vMj8JSbDEOiFF/GHSbKsn22MJdDJKEhHFK6GV
s8gR2vywRFwG69gIRE4qGhVB+WIg8GJrDpDMYH6lCjMkTrjXuKDUcNlJN3NPLuhJ7tsditwf1pr5
moJRmGpJnip/rGm0g4o4A6ev4CtePjoao8C1wFtzHkERX9oenhh7cGjDMejU5IrLv8NxFnLj1FpB
9MuF1beTU20NI5oAn6zLiLiOtXjf0ghU3AN4DA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
hAsrUfp6Qgjm8yBjNYTEtQmVQmMxzL8TE/3oiQSxSI3+yEkXAbQCXkT9mo+LCdv+fGECOB0istHd
eLtbsiYbxjxNxYkXiUrRE5O+aSxynIray+uF9DJigTEUZu8JJXUbzxK4DDUu1Lm9tpGps4+Prz1m
0gkj13RT/Y/418s2VTw=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BP/54Wm/GJmb1jy0bxWJJX4aiKyiWPVh4X3VL30BQrmX4PlEsNKzBJH3Qu8IIYERfnFP0ifAgboa
vypMQ5Ed0BrMePGkWIgT6I8hxJCMFpHdkSK7m1giSKyZzFfTOrVqoNFXE+qdzLfY1J5hBWCvouYo
jllavK4N3gF9FLScH2AUWYVMcVth2QPaTAU2NLnAUNH8kgtBjBfc8/KbPPTznD1QNVqvFstzcbTA
hGQ1ETVPvINQ0KqxxAG5PRhtQD4+pC+hr/Tvk+RSvGyBOfy9zE86OXkJiYs9dSFhNiMFmCPL9DBO
se4OxNNC0/7aBtb1mkSEA9YFDYEb9jS7Jasy2A==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
SnzT9DVH3xlEN8nrr2YrlvTO5qj7L22d7WaBcuKyTaiHoIwwFHrC4HQbfs0TAwkdWcOgmJoATPSF
F6qm0KiddbrlERF3MfKUldeGBJtqLdX+zGw7+3JD7S+HB9dIMOFOHy+IiCZp1/Pz8epKpi238cel
rcVoJQKz406wmXDvOo8KsT+XhRLs9BVCrBErPGGXKYDk6NXAp0duOgQE9DbslzMU83M/kUC7uERV
tQW02240peKQFp2elEZC7Tetvgp0TaFTtJiKN45REi8GQUCKGa85JjNIk1qb/+k95TIIP1xrHirc
6iX7qbwnPetv8TVu2NjkZ0WDEK5RXdOXcxBwHA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
erkR82V0jX8ytva+9MzEs0c75Z7j7TsgxWRLNAUfbbU28i+U9YzuZlSfYU75M0f9jx1gvxtBrfKv
cNHVdkR+i5zfHDZsDwfMEEBhs8wzDCKqe+eex6BBEvlIOesCPXrr2RozQgaQ1PBh/os2Arfu+873
BjsVxFJkbhpzIqlddOo/XZV9Yi+eih7A7pXXEBR6IL7Poo4Ka49MiVQU0xJrDTm+ddOuMPDRRD7g
dsxS/uzdcBcO2myV6g/7YH/C2Ce9s6+UywJN/0JeXSqwA7bsBqqnfFicVAT0lckLopMLiuzK7dsN
EwhFeqoetciFrDIj9+o0xDMWBZhgNP1u68vURA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
R+BI65BKLT0I9hEtsxGnDyM5XY9gzULeTPOSDXvd3KWOzZJAx6C0xlbyZcFZhAEG/QIK2yd0wAi6
IUWxyF/sx3HsqKjhVi5KxnpuXDBOZVoj811O7JukedFVmDW7OHGtBkuiJ5X5irw7mfsEKRQmF/1i
V6lj9HYHZEjxtDeZjACsLY4y1QxWalSKT4HIMOHznBLL8dLbGMlS+ZmFuFn0gcwZavVl7gTkTtkf
W0gn01A9ru7NKsf+iLX0kj4dgItPu9N2g02M1vWQ9UUQEVvfV7lUc7GY1suibrD8aEkhH9S7lZ7n
bFsT4qxyvzg8ML6v4g4v7N6VuyhEtgFgNd725Q==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
jNUVKiwH68vHsU54idgvKwaVJcoxTUuxfgrQpbpmM/IpesWA3wHsGzYClwAxkKzw3KRnFyQqTWcZ
yj1EQ2CMBxlJ0kyNbZW8OK8pXzeigToZ0U6Aq3Gy+j7wBbhe83wE1Ygn82sK8dHTEulvaRLn/c5r
ispy1s7jMKIvYNzoUuZrgyBQyfaYmdqUia8XlQjFd+VwzhTXKwzvmaqHWyaHjfBKeCooO7+oUxMG
OJg83W54EVe9ronFQ8Wr9EOL8ia7qelCAgyQe/bC0HHCoMAm8apI7sX23iMR/wMiPP5V2bQzycy+
rBX/+SWkqSeIE1FLm+muFPvrE7iLwJaW8d1fzdFFjAZ5aIXArbWNfwbK8S0TczXc9lEzmpb69rwA
UJIrs4alo81qGQ32UFhjuMQjX75O9Od1HWHDj5PFaT/Ja5Ly+bK8Cc3gfO6dCE81m7d+B2JBZ/Hl
tBA19QuOAYwT2EIPOdpaVtCULb33cWODWu3qQFhZMmDzKTb3kwpcr0LL

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
MnzcA2swaxH1LRacKDou0ZmiiMRETbWIdHgeBgyQz7ILronsXLoB/C20WuFNGEVSiL2/51EZ6MXZ
vMHI8fFcMQCJcuTBDBibUMKv6bXI9s8fTbtrBZppbF/R1icG5JYhqmX4aRnv4W/dxJRjI2L35nLN
Y48E9OfgfkD1sr+IRwx8WEKFmUhuk8dLe0VOK7ywe3XEcneYvrz+HhPj16bGmNfMwNnDgZ3gKKZD
hRnys+jzvAX3HyISrErWXhMKrhWMxXeTNFJCqNQ0LWAVHQYwyKnF5xVpyXSuGNSIrva+QXqOrZBG
3VNLirNVtMRiKLfwZeMaqvswkqBDAa53utlAAA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
d0xXkKtsKM8GvXhDZr16p1+oE3uBtD04BJ76eGGIEj/CFECfHVy9qsJ43oSKjas0+AJr4GFFnVb6
X7gJV6MmX/OboC9ier5joUCGz0mxVzkRZK9a+LPEDcg0K6+cLE36kr+FfxW9Uk2816EHBCMCf5mK
A4eAhSmAb5Nq74F/q0quiG416npbny7faiQ+xmPDfYYiM3UuMKaD4iE8ODlz1w5xThPllWESf3LZ
NTkw6fozyTqZ47vvE21O3dgIGAY1v+C6BwlCK24VwPJa1xs9csY+qTk31j5jjAc1ExlB6QF7t9UH
lk70qdNPWxT87OH7kFT8UvPO1D6BTC3/WkDZfA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
LYhdzKTvo93uJrAaiP5OfCDuOnu2BSvPnxlv6I7h2n1+xHtj34LNNKzWEgOg9dUV9cYDaHYUjjEt
DKdWcz6mZ61d5qyxAhpv67fc90v7JVgtOAcT94/Yb+AuLxXFcGA6Gic7uoJtUgz6JmTnb22Dxdjc
KuIewDj4IOTfP8XGXKTaF+cNp0CFrQgTAcVSQFyLFxr0I/9h3S+GZLecA7ntEeHEOfCJzPvy0ddi
7MCdQWECLb+fXC0IAn8V95TumcpINiRAX1BHi9IGJ4QoMrb3jOCrPkFhDMTJj2aiImUWdi/l/0QE
d7wcXlgIEYVeoKYUOJ4mqy+zZPUbLNeOPADUDQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 114544)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
