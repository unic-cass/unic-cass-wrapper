//Modulo principal

module top
#(
    parameter NBin      = 8, //Bits de la entrada
    parameter NBFin     = 5, //Bits fraccionarios de la entrada
    parameter NBout     = 8, //Bits de la salida
    parameter NBFout    = 5, //Bits fraccionarios de la salida
    parameter Ncoeff    = 9, //Numero de coeficientes
    parameter NBcoeff   = 7, //Bits de los coeficientes
    parameter NBFcoeff  = 5  //Bits fraccionarios de los coeficientes
)
(
    input                      clkA,
    input                      reset,

    input                       spi_ss_n,
    input                       spi_sclk,
    input                       spi_mosi,
    output                      spi_miso,

    input      x_serial,
    output     y_serial
);

wire [NBin-1 :0] x_parallel;
wire sys_enable;
wire x_ready;
reg x_ready_q;
wire        [Ncoeff*NBcoeff -1 :0] coeff;
wire                               d;
wire signed [NBin           -1 :0] xROM;
wire signed [NBin           -1 :0] xAux;
reg signed  [NBin           -1 :0] x_r;
wire [7:0] w_force_0, w_force_1, w_force_2, w_force_3, w_force_4, w_force_5, w_force_6, w_force_7, w_force_8;
wire [7:0] w_mon_0, w_mon_1, w_mon_2, w_mon_3, w_mon_4, w_mon_5, w_mon_6, w_mon_7, w_mon_8;
wire [7:0] debug_load_bus;
wire [7:0] sys_enable_bus;
wire [Ncoeff*NBcoeff -1 :0] coeff_force_packed;
wire signed [NBin + 1 -1 :0] e_out;
wire signed [NBout -1 :0] y;

wire [6:0] spi_addr;    
wire [7:0] spi_wdata;   
wire       spi_wr_en;   
wire [7:0] spi_rdata;   

assign sys_enable = sys_enable_bus[0];

serial_to_parallel #(
    .N (NBin) 
) u_s2p_input (
    .i_clock  (clkA),
    .i_reset  (!reset),   
    .i_enable (sys_enable),
    .i_data   (x_serial),
    .o_ready  (x_ready), 
    .o_data   (x_parallel)
);

spi_slave_mode0 #(
        .ADDR_BITS(7),
        .DATA_BITS(8)
    ) u_spi_slave (
        .rst_n       (reset),
        .ss_n        (spi_ss_n),
        .sclk        (spi_sclk),
        .mosi        (spi_mosi),
        .miso        (spi_miso),
        .addr_out    (spi_addr),
        .data_out    (spi_wdata),
        .write_enable(spi_wr_en),
        .data_in     (spi_rdata),
        .done        (),     
        .rx_frame    ()     
    );


debug_unit u_debug_unit (
    .clk            (clkA          ),
    .rst_n          (reset         ),
    .spi_addr       (spi_addr),
    .spi_wdata      (spi_wdata),
    .spi_wr_en      (spi_wr_en),
    .spi_ss_n      (spi_ss_n),
    .spi_rdata      (spi_rdata),
    .monitor_status (8'b0),
    .error_signal   (e_out [NBin : NBin-7]),
    .mon_w0         (w_mon_0        ),
    .mon_w1         (w_mon_1        ),
    .mon_w2         (w_mon_2        ),
    .mon_w3         (w_mon_3        ),
    .mon_w4         (w_mon_4        ),
    .mon_w5         (w_mon_5        ),
    .mon_w6         (w_mon_6        ),
    .mon_w7         (w_mon_7        ),
    .mon_w8         (w_mon_8        ),
    .sw_reset       (),
    .debug_load     (debug_load_bus ),
    .enable_sig     (sys_enable_bus ),
    .force_w0       (w_force_0      ),
    .force_w1       (w_force_1      ),
    .force_w2       (w_force_2      ),
    .force_w3       (w_force_3      ),
    .force_w4       (w_force_4      ),
    .force_w5       (w_force_5      ),
    .force_w6       (w_force_6      ),
    .force_w7       (w_force_7      ),
    .force_w8       (w_force_8      )
);

assign w_mon_0 = { coeff[NBcoeff*1-1], coeff[NBcoeff*1-1 -: NBcoeff] };
assign w_mon_1 = { coeff[NBcoeff*2-1], coeff[NBcoeff*2-1 -: NBcoeff] };
assign w_mon_2 = { coeff[NBcoeff*3-1], coeff[NBcoeff*3-1 -: NBcoeff] };
assign w_mon_3 = { coeff[NBcoeff*4-1], coeff[NBcoeff*4-1 -: NBcoeff] };
assign w_mon_4 = { coeff[NBcoeff*5-1], coeff[NBcoeff*5-1 -: NBcoeff] };
assign w_mon_5 = { coeff[NBcoeff*6-1], coeff[NBcoeff*6-1 -: NBcoeff] };
assign w_mon_6 = { coeff[NBcoeff*7-1], coeff[NBcoeff*7-1 -: NBcoeff] };
assign w_mon_7 = { coeff[NBcoeff*8-1], coeff[NBcoeff*8-1 -: NBcoeff] };
assign w_mon_8 = { coeff[NBcoeff*9-1], coeff[NBcoeff*9-1 -: NBcoeff] };

assign coeff_force_packed = {
    w_force_8[NBcoeff-1:0], 
    w_force_7[NBcoeff-1:0], 
    w_force_6[NBcoeff-1:0], 
    w_force_5[NBcoeff-1:0], 
    w_force_4[NBcoeff-1:0], 
    w_force_3[NBcoeff-1:0], 
    w_force_2[NBcoeff-1:0], 
    w_force_1[NBcoeff-1:0], 
    w_force_0[NBcoeff-1:0]
};

always @(posedge clkA) begin
    x_ready_q <= x_ready;
    if (x_ready) begin
        x_r <= x_parallel;
    end
end

//Instancia de FIR
FIR_t
#(
    .NBin     (NBin     ),
    .NBFin    (NBFin    ),
    .NBout    (NBout    ),
    .NBFout   (NBFout   ),
    .NBcoeff  (NBcoeff  ),
    .NBFcoeff (NBFcoeff )
) u_FIR(
    .clk    (clkA  ),
    .reset  (reset ),
    .i_enable (x_ready),
    .x      (x_parallel  ),
    .coeff  (coeff ),
    .y(y)
);

assign d = (y[NBout-1] || y == {NBout{1'b0}}) ? 1'b0 : 1'b1; // Decision tomada

//Instancia de LMS
LMS
#(
    .NBx   (NBin    ),
    .NBFx  (NBFin   ),
    .NBy   (NBout   ),
    .NBFy  (NBFout  ),
    .NBw   (NBcoeff ),
    .NBFw  (NBFcoeff)
) u_LMS(
    .clkA    (clkA  ),
    .reset   (reset   ), 
    .y       (y     ),
    .d       (d     ),
    .x       (x_r     ),
    .i_enable (x_ready_q),
    .coeff   (coeff ),
    .debug_load(debug_load_bus[0]),
    .i_coeffs(coeff_force_packed),
    .e_out   (e_out  )
);

parallel_to_serial #(
    .N (NBout)
) u_p2s_output (
    .i_clock  (clkA),
    .i_reset  (!reset),   
    .i_enable (sys_enable), 
    .i_load   (x_ready),   
    .i_data   (y),
    .o_valid  (),   
    .o_data   (y_serial)   
);

endmodule
