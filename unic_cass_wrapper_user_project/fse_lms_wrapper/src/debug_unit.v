module debug_unit #(
  parameter integer NB_ADDR = 7,
  parameter integer NB_DATA = 8
)(
  input  wire                 clk,
  input  wire                 rst_n,
  // SPI Slave Interface
  input  wire [NB_ADDR-1:0]   spi_addr,
  input  wire [NB_DATA-1:0]   spi_wdata,
  input  wire                 spi_wr_en,
  input  wire                 spi_ss_n,
  output reg  [NB_DATA-1:0]   spi_rdata,
  // Probe Inputs
  input  wire [NB_DATA-1:0]   monitor_status,
  input  wire [NB_DATA-1:0]   error_signal,
  input  wire [NB_DATA-1:0]   mon_w0,
  input  wire [NB_DATA-1:0]   mon_w1,
  input  wire [NB_DATA-1:0]   mon_w2,
  input  wire [NB_DATA-1:0]   mon_w3,
  input  wire [NB_DATA-1:0]   mon_w4,
  input  wire [NB_DATA-1:0]   mon_w5,
  input  wire [NB_DATA-1:0]   mon_w6,
  input  wire [NB_DATA-1:0]   mon_w7,
  input  wire [NB_DATA-1:0]   mon_w8,
  // Control Outputs
  output reg  [NB_DATA-1:0]   sw_reset,
  output reg  [NB_DATA-1:0]   debug_load,
  output reg  [NB_DATA-1:0]   enable_sig,
  output reg  [NB_DATA-1:0]   force_w0,
  output reg  [NB_DATA-1:0]   force_w1,
  output reg  [NB_DATA-1:0]   force_w2,
  output reg  [NB_DATA-1:0]   force_w3,
  output reg  [NB_DATA-1:0]   force_w4,
  output reg  [NB_DATA-1:0]   force_w5,
  output reg  [NB_DATA-1:0]   force_w6,
  output reg  [NB_DATA-1:0]   force_w7,
  output reg  [NB_DATA-1:0]   force_w8
);

// Address Map
localparam [NB_ADDR-1:0] ADDR_MONITOR_STATUS = 'h00;
localparam [NB_ADDR-1:0] ADDR_ERROR_SIGNAL = 'h01;
localparam [NB_ADDR-1:0] ADDR_MON_W0 = 'h20;
localparam [NB_ADDR-1:0] ADDR_MON_W1 = 'h21;
localparam [NB_ADDR-1:0] ADDR_MON_W2 = 'h22;
localparam [NB_ADDR-1:0] ADDR_MON_W3 = 'h23;
localparam [NB_ADDR-1:0] ADDR_MON_W4 = 'h24;
localparam [NB_ADDR-1:0] ADDR_MON_W5 = 'h25;
localparam [NB_ADDR-1:0] ADDR_MON_W6 = 'h26;
localparam [NB_ADDR-1:0] ADDR_MON_W7 = 'h27;
localparam [NB_ADDR-1:0] ADDR_MON_W8 = 'h28;
localparam [NB_ADDR-1:0] ADDR_SW_RESET = 'h10;
localparam [NB_ADDR-1:0] ADDR_DEBUG_LOAD = 'h11;
localparam [NB_ADDR-1:0] ADDR_ENABLE_SIG = 'h12;
localparam [NB_ADDR-1:0] ADDR_FORCE_W0 = 'h30;
localparam [NB_ADDR-1:0] ADDR_FORCE_W1 = 'h31;
localparam [NB_ADDR-1:0] ADDR_FORCE_W2 = 'h32;
localparam [NB_ADDR-1:0] ADDR_FORCE_W3 = 'h33;
localparam [NB_ADDR-1:0] ADDR_FORCE_W4 = 'h34;
localparam [NB_ADDR-1:0] ADDR_FORCE_W5 = 'h35;
localparam [NB_ADDR-1:0] ADDR_FORCE_W6 = 'h36;
localparam [NB_ADDR-1:0] ADDR_FORCE_W7 = 'h37;
localparam [NB_ADDR-1:0] ADDR_FORCE_W8 = 'h38;

// CDC Synchronization (Snapshot)
wire [NB_DATA-1:0] monitor_status_sync;
cdc_snapshot #(.DATA_WIDTH(NB_DATA)) u_cdc_monitor_status (
  .clk(clk),
  .rst_n(rst_n),
  .trigger_async_n(spi_ss_n),
  .data_in(monitor_status),
  .data_out(monitor_status_sync)
);

wire [NB_DATA-1:0] error_signal_sync;
cdc_snapshot #(.DATA_WIDTH(NB_DATA)) u_cdc_error_signal (
  .clk(clk),
  .rst_n(rst_n),
  .trigger_async_n(spi_ss_n),
  .data_in(error_signal),
  .data_out(error_signal_sync)
);

wire [NB_DATA-1:0] mon_w0_sync;
cdc_snapshot #(.DATA_WIDTH(NB_DATA)) u_cdc_mon_w0 (
  .clk(clk),
  .rst_n(rst_n),
  .trigger_async_n(spi_ss_n),
  .data_in(mon_w0),
  .data_out(mon_w0_sync)
);

wire [NB_DATA-1:0] mon_w1_sync;
cdc_snapshot #(.DATA_WIDTH(NB_DATA)) u_cdc_mon_w1 (
  .clk(clk),
  .rst_n(rst_n),
  .trigger_async_n(spi_ss_n),
  .data_in(mon_w1),
  .data_out(mon_w1_sync)
);

wire [NB_DATA-1:0] mon_w2_sync;
cdc_snapshot #(.DATA_WIDTH(NB_DATA)) u_cdc_mon_w2 (
  .clk(clk),
  .rst_n(rst_n),
  .trigger_async_n(spi_ss_n),
  .data_in(mon_w2),
  .data_out(mon_w2_sync)
);

wire [NB_DATA-1:0] mon_w3_sync;
cdc_snapshot #(.DATA_WIDTH(NB_DATA)) u_cdc_mon_w3 (
  .clk(clk),
  .rst_n(rst_n),
  .trigger_async_n(spi_ss_n),
  .data_in(mon_w3),
  .data_out(mon_w3_sync)
);

wire [NB_DATA-1:0] mon_w4_sync;
cdc_snapshot #(.DATA_WIDTH(NB_DATA)) u_cdc_mon_w4 (
  .clk(clk),
  .rst_n(rst_n),
  .trigger_async_n(spi_ss_n),
  .data_in(mon_w4),
  .data_out(mon_w4_sync)
);

wire [NB_DATA-1:0] mon_w5_sync;
cdc_snapshot #(.DATA_WIDTH(NB_DATA)) u_cdc_mon_w5 (
  .clk(clk),
  .rst_n(rst_n),
  .trigger_async_n(spi_ss_n),
  .data_in(mon_w5),
  .data_out(mon_w5_sync)
);

wire [NB_DATA-1:0] mon_w6_sync;
cdc_snapshot #(.DATA_WIDTH(NB_DATA)) u_cdc_mon_w6 (
  .clk(clk),
  .rst_n(rst_n),
  .trigger_async_n(spi_ss_n),
  .data_in(mon_w6),
  .data_out(mon_w6_sync)
);

wire [NB_DATA-1:0] mon_w7_sync;
cdc_snapshot #(.DATA_WIDTH(NB_DATA)) u_cdc_mon_w7 (
  .clk(clk),
  .rst_n(rst_n),
  .trigger_async_n(spi_ss_n),
  .data_in(mon_w7),
  .data_out(mon_w7_sync)
);

wire [NB_DATA-1:0] mon_w8_sync;
cdc_snapshot #(.DATA_WIDTH(NB_DATA)) u_cdc_mon_w8 (
  .clk(clk),
  .rst_n(rst_n),
  .trigger_async_n(spi_ss_n),
  .data_in(mon_w8),
  .data_out(mon_w8_sync)
);

always @(posedge clk or negedge rst_n) begin
  if (!rst_n) begin
    sw_reset <= {NB_DATA{1'b0}};
    debug_load <= {NB_DATA{1'b0}};
    enable_sig <= {NB_DATA{1'b0}};
    force_w0 <= {NB_DATA{1'b0}};
    force_w1 <= {NB_DATA{1'b0}};
    force_w2 <= {NB_DATA{1'b0}};
    force_w3 <= {NB_DATA{1'b0}};
    force_w4 <= {NB_DATA{1'b0}};
    force_w5 <= {NB_DATA{1'b0}};
    force_w6 <= {NB_DATA{1'b0}};
    force_w7 <= {NB_DATA{1'b0}};
    force_w8 <= {NB_DATA{1'b0}};
  end
  else begin
    if (spi_wr_en) begin
      case (spi_addr)
        ADDR_SW_RESET: sw_reset <= spi_wdata;
        ADDR_DEBUG_LOAD: debug_load <= spi_wdata;
        ADDR_ENABLE_SIG: enable_sig <= spi_wdata;
        ADDR_FORCE_W0: force_w0 <= spi_wdata;
        ADDR_FORCE_W1: force_w1 <= spi_wdata;
        ADDR_FORCE_W2: force_w2 <= spi_wdata;
        ADDR_FORCE_W3: force_w3 <= spi_wdata;
        ADDR_FORCE_W4: force_w4 <= spi_wdata;
        ADDR_FORCE_W5: force_w5 <= spi_wdata;
        ADDR_FORCE_W6: force_w6 <= spi_wdata;
        ADDR_FORCE_W7: force_w7 <= spi_wdata;
        ADDR_FORCE_W8: force_w8 <= spi_wdata;
      endcase
    end
  end
end

always @(*) begin
  case (spi_addr)
    // Probes (Synchronized)
    ADDR_MONITOR_STATUS: spi_rdata = monitor_status_sync;
    ADDR_ERROR_SIGNAL: spi_rdata = error_signal_sync;
    ADDR_MON_W0: spi_rdata = mon_w0_sync;
    ADDR_MON_W1: spi_rdata = mon_w1_sync;
    ADDR_MON_W2: spi_rdata = mon_w2_sync;
    ADDR_MON_W3: spi_rdata = mon_w3_sync;
    ADDR_MON_W4: spi_rdata = mon_w4_sync;
    ADDR_MON_W5: spi_rdata = mon_w5_sync;
    ADDR_MON_W6: spi_rdata = mon_w6_sync;
    ADDR_MON_W7: spi_rdata = mon_w7_sync;
    ADDR_MON_W8: spi_rdata = mon_w8_sync;
    // Controls (Readback)
    ADDR_SW_RESET: spi_rdata = sw_reset;
    ADDR_DEBUG_LOAD: spi_rdata = debug_load;
    ADDR_ENABLE_SIG: spi_rdata = enable_sig;
    ADDR_FORCE_W0: spi_rdata = force_w0;
    ADDR_FORCE_W1: spi_rdata = force_w1;
    ADDR_FORCE_W2: spi_rdata = force_w2;
    ADDR_FORCE_W3: spi_rdata = force_w3;
    ADDR_FORCE_W4: spi_rdata = force_w4;
    ADDR_FORCE_W5: spi_rdata = force_w5;
    ADDR_FORCE_W6: spi_rdata = force_w6;
    ADDR_FORCE_W7: spi_rdata = force_w7;
    ADDR_FORCE_W8: spi_rdata = force_w8;
    default:      spi_rdata = {NB_DATA{1'b0}};
  endcase
end

endmodule