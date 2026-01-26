module fse_lms_wrapper (
    `ifdef USE_POWER_PINS
    inout VPWR,    // Common digital supply
    inout VGND,    // Common digital ground
    `endif
    input  wire        clk_i,
    input  wire        rst_ni,
    input  wire [16:0] ui_PAD2CORE,
    output wire [16:0] uo_CORE2PAD
);

    top u_top (
        .clkA      (clk_i),
        .reset     (rst_ni),
        .spi_ss_n  (ui_PAD2CORE[0]),
        .spi_sclk  (ui_PAD2CORE[1]),
        .spi_mosi  (ui_PAD2CORE[2]),
        .spi_miso  (uo_CORE2PAD[0]),
        .x_serial  (ui_PAD2CORE[3]),
        .y_serial  (uo_CORE2PAD[1])
    );

    assign uo_CORE2PAD[16:2] = 15'b0;

endmodule