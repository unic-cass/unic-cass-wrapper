module serial_to_parallel #(
    parameter integer N = 8
)(
    input  wire              i_clock,
    input  wire              i_reset,
    input  wire              i_enable,
    input  wire              i_data,
    output reg               o_ready, // pulso 1 ciclo
    output reg  [N-1:0]      o_data
);

    function integer clog2;
        input integer value;
        integer i;
        begin
            clog2 = 0;
            for (i = value-1; i > 0; i = i >> 1)
                clog2 = clog2 + 1;
        end
    endfunction

    localparam integer CNTW = (N <= 1) ? 1 : clog2(N);

    reg [N-1:0]     reg_sh;
    reg [CNTW-1:0]  reg_cnt;

    always @(posedge i_clock) begin
        if (i_reset) begin
            reg_sh  <= 0;
            reg_cnt <= 0;
            o_ready <= 0;
            o_data  <= 0;
        end else begin
            o_ready <= 0;

            if (i_enable) begin
                reg_sh <= {reg_sh[N-2:0], i_data};

                if (reg_cnt == N-1) begin
                    o_data  <= {reg_sh[N-2:0], i_data};
                    o_ready <= 1;
                    reg_cnt <= 0;
                end else begin
                    reg_cnt <= reg_cnt + 1'b1;
                end
            end
        end
    end

endmodule
