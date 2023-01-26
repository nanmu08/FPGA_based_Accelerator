# FPGA_based_Accelerator
This is a project which design and implement FPGA Based Accelerator for 1D Time Domain Convolution.
Designed and programmed a custom circuit implemented on the Zynq FPGA that exploits a significant amount of parallelism to improve performance compared to a microprocessor. 
Created DRAM DMA interface which can streaming data from/to external DRAM, using handshake and FIFO synchronizers to support control and data signals that cross clock domains.
Designed convolution pipeline and create smart buffer exploit the overlap between iterations to reuse data and improve bandwidth. which supports maximize kernel size with 128 16-bits elements and accelerator can speed up to 15x.
