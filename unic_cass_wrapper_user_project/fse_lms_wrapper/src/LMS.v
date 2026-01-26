//Implementacion del algoritmo LMS

module LMS
#(
    parameter NBx   = 8, //Bits de la entrada
    parameter NBFx  = 5, //Bits fraccionarios de la entrada
    parameter NBy   = 8, //Bits de la salida
    parameter NBFy  = 5, //Bits fraccionarios de la salida
    parameter Nw    = 9, //Numero de coeficientes
    parameter NBw   = 7, //Bits de los coeficientes
    parameter NBe = NBy + 1, //Bits de la señal de error
    parameter NBFw  = 5  //Bits fraccionarios de los coeficiente
)
(
    input                        clkA,
    input                        reset,
    input                        d,
    input signed  [NBy    -1 :0] y,   
    input signed  [NBx    -1 :0] x,   
    output        [Nw*NBw -1 :0] coeff,
    // Debug unit interface
    input wire [Nw*NBw -1 :0] i_coeffs,
    input                     debug_load, 
    input              i_enable,
    output signed [NBe-1 :0]  e_out
);

//Parametros locales:
localparam NBmu = 8;
localparam NBFmu = 7;

localparam NBFd = NBFy;
localparam NBd = NBFy + 2;
localparam NBId = NBd - NBFd;
localparam NBFe = NBFy;
localparam NBmult = NBx + NBmu + NBe;
localparam NBFmult = NBFx + NBFmu + NBFe;
localparam NBImult = NBmult - NBFmult;
localparam Nsum = Nw;
localparam NBsum = NBmult + 1;
localparam NBFsum = NBFmult;
localparam NBIsum = NBsum - NBFsum;
localparam NBsumSat = NBmult;
localparam NBFsumSat = NBFmult;
localparam NBIsumSat = NBsumSat - NBFsumSat;
localparam NBsat = NBIsum - NBIsumSat;
localparam NBwSat = NBw;
localparam NBFwSat = NBFw;
localparam NBIwSat = NBwSat - NBFwSat; 
localparam NBsatW = NBImult - NBIwSat;
localparam NBcount = 32;

//Variables:
wire signed [NBe-1      :0] e;                  //Señal de error
wire signed [NBd-1      :0] d_e;                //Señal deseada ajustada al largo correspondiente para la resta
reg signed  [NBmu-1     :0] mu;                 //Constante de aprendizaje
reg signed  [NBx-1      :0] x_r    [Nw-1 :0];   //Entradas anteriores (Comparar con los del FIR)
wire signed [NBmult-1   :0] mult   [Nw-1 :0];   //Multiplicaciones
reg signed  [NBsumSat-1 :0] w      [Nw-1 :0];   //Coeficientes
wire signed [NBw-1      :0] w_out  [Nw-1 :0];   //Coeficientes con saturacion
wire signed [NBsum-1    :0] sum    [Nw-1 :0];   //Sumas
wire signed [NBsumSat-1 :0] sumSat [Nw-1 :0];   //Sumas saturadas
reg signed  [NBcount-1  :0] count;              //Contador
reg toggle = 0;
wire enable;

always @(posedge clkA ) begin
    if (i_enable) begin
        toggle <= ~toggle;
    end
end

assign enable = toggle;

//Calculo de la señal de error:
//assign e = d - y;
assign d_e = (!d) ? {{NBId{1'b1}}, {NBFd{1'b0}}} : {{NBId-1{1'b0}}, 1'b1, {NBFd{1'b0}}};
assign e = d_e - y;

//Calculo de la constante de aprendizaje:
always @(posedge clkA) begin
    if (!reset) begin
        mu <= 8'b0_0010000;
        count <= 0;
    end
    else begin
        if (i_enable) begin
            count <= count + 1;
            if (count == 600) begin
                mu <= 8'b0_00000100;
                count <= 0;
            end
        end
    end
end

//Entradas anteriores:
integer j;
always @(posedge clkA) begin
    if (!reset) begin
        for(j=0; j<Nw; j=j+1) begin
            x_r[j] <= 0;
        end
    end
    else begin
        if (i_enable) begin
            x_r[0] <= x;
            for(j=1; j<Nw; j=j+1) begin
                x_r[j] <= x_r[j-1];
            end
        end
    end
end

//Operaciones:
generate
    genvar i;
    for(i=0; i<Nw; i=i+1) begin
        assign mult[i]   = mu * e * x_r[i];
        assign sum[i]    = w[i] + mult[i];
        assign sumSat[i] =  ( ~|sum[i][NBsum-1 -: NBsat+1] || &sum[i][NBsum-1 -: NBsat+1]) ? sum[i][NBsum - NBsat - 1 -: NBsumSat] :
                            (sum[i][NBsum-1]) ? {{1'b1},{NBsumSat-1{1'b0}}} : {{1'b0},{NBsumSat-1{1'b1}}};

        assign w_out[i]  =  ( ~|w[i][NBmult-1 -: NBsatW+1] || &w[i][NBmult-1 -: NBsatW+1]) ? w[i][NBmult - NBsatW - 1 -: NBwSat] :
                            (w[i][NBmult-1]) ? {{1'b1},{NBwSat-1{1'b0}}} : {{1'b0},{NBwSat-1{1'b1}}};
    end
endgenerate

integer k;
always @(posedge clkA) begin
    if (!reset) begin
        for(k=0; k<Nw; k=k+1) begin
            if(k != (Nw/2)) begin
                w[k] <= 0;
            end
            else begin
                w[k] <= 36'h400000000;
            end
        end
    end
    else if (debug_load) begin
        for(k=0; k<Nw; k=k+1) begin
            w[k] <= { 
                {(NBsumSat - (NBw + (NBFsumSat - NBFw))){i_coeffs[NBw*(k+1)-1]}}, 
                i_coeffs[NBw*(k+1)-1 -: NBw],
                {(NBFsumSat - NBFw){1'b0}} 
            };
        end
    end 
    else if(i_enable && enable) begin
        for(k=0; k<Nw; k=k+1) begin
            w[k] <= sumSat[k];
        end
    end
end


//Coeficientes de salida:
generate
    genvar h;
    for(h=0; h<Nw; h=h+1) begin
        assign coeff[NBw*(h+1)-1 -: NBw] = w_out[h];
    end
endgenerate

assign e_out = e;

endmodule