//FIR Transpuesto del Ecualizador Fraccionalmente Espaciado

module FIR_t
#(
    parameter NBin      = 8, //Bits de la entrada
    parameter NBFin     = 5, //Bits fraccionarios de la entrada
    parameter NBout     = 8, //Bits de la salida
    parameter NBFout    = 5, //Bits fraccionarios de la salida
    parameter Ncoeff    = 9, //Numero de coeficientes
    parameter NBcoeff   = 7, //Bits de los coeficientes
    parameter NBFcoeff  = 5  //Bits fraccionarios de los coeficiente
)
(
    input                                clk,
    input                                reset,
    input signed  [NBin           -1 :0] x,
    input         [Ncoeff*NBcoeff -1 :0] coeff,
    input                               i_enable,
    output signed [NBout          -1 :0] y
);

localparam AddBitsSum = $clog2(Ncoeff);
localparam Nin = Ncoeff;               
localparam Nprod = Ncoeff;             
localparam NBprod = NBin + NBcoeff;    
localparam NBFprod = NBFin + NBFcoeff; 
localparam NBsum = NBprod + AddBitsSum;
localparam NBFsum = NBFprod;           
localparam NBIsum = NBsum - NBFsum;    
localparam NBIout = NBout - NBFout;    
localparam NBsat = NBIsum - NBIout;    

// Variables:
reg signed  [NBcoeff-1 :0] w     [Ncoeff-1 :0];
wire signed [NBprod-1  :0] prod  [Nprod-1  :0];
reg signed  [NBin-1    :0] x_reg;
reg signed  [NBsum-1   :0] sum   [Nprod-1  :0];
wire signed [NBsum-1   :0] y_w;

// Coeficientes:
integer i;
always @(posedge clk) begin
    if(!reset) begin
        for(i=0; i<Ncoeff; i=i+1) begin
            w[i] <= 0;
        end
    end
    else begin
        if (i_enable) begin
            for(i=0; i<Ncoeff; i=i+1) begin
                w[i] <= coeff[NBcoeff*(i+1)-1 -: NBcoeff];
            end
        end
    end
end

// Entradas:
always @(posedge clk) begin
    if(!reset) begin
        x_reg <= 0;
    end
    else begin
        if (i_enable) begin
            x_reg <= x;
        end
    end
end

// Productos:
generate
    genvar j;
    for(j=0; j<Nprod; j=j+1) begin
        assign prod[j] = x_reg * w[Nprod-1-j];
    end
endgenerate

// Sumas:
integer k;
always @(posedge clk) begin
    if(!reset) begin
        for(k=0; k<Nprod; k=k+1) begin
            sum[k] <= 0;
        end
    end
    else begin
        if (i_enable) begin
            sum[0] <= prod[0];
            for(k=1; k<Nprod; k=k+1) begin
                sum[k] <= prod[k] + sum[k-1];
            end
        end
    end
end

// Salida:
assign y_w = sum[Nprod-1];

assign y =  ( ~|y_w[NBsum-1 -: NBsat+1] || &y_w[NBsum-1 -: NBsat+1]) ? y_w[NBsum - NBsat - 1 -: NBout] :
            (y_w[NBsum-1]) ? {{1'b1},{NBout-1{1'b0}}} : {{1'b0},{NBout-1{1'b1}}};

endmodule