module parallel_to_serial #(
    parameter integer N = 8
)(
    input  wire         i_clock,
    input  wire         i_reset,
    input  wire         i_enable,
    input  wire         i_load,
    input  wire [N-1:0] i_data,
    output reg          o_valid,
    output reg          o_data
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
    reg             reg_done;

    always @(posedge i_clock) begin
        if (i_reset) begin
            reg_sh   <= 0;
            reg_cnt  <= 0;
            reg_done <= 0;
            o_valid  <= 0;
            o_data   <= 0;
        end else begin
            if (!i_enable) begin
                reg_cnt  <= 0;
                reg_done <= 0;
                o_valid  <= 0;
            end else begin
                if (reg_done) begin
                    reg_done <= 0;
                    reg_cnt  <= 0;
                    o_valid  <= 0;
                end else if (i_load && !o_valid) begin
                    reg_sh  <= i_data;
                    reg_cnt <= 0;
                    o_valid <= 1;
                    o_data  <= i_data[N-1];
                end else if (o_valid) begin
                    reg_sh <= {reg_sh[N-2:0], 1'b0};
                    o_data <= reg_sh[N-2];

                    if (reg_cnt == N-2) begin
                        reg_done <= 1;
                    end else begin
                        reg_cnt <= reg_cnt + 1'b1;
                    end
                end
            end
        end
    end

endmodule
