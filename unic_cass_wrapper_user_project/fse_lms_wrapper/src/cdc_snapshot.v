module cdc_snapshot #(
    parameter integer DATA_WIDTH = 8
)(
    input  wire                  clk,            // fast system clock
    input  wire                  rst_n,          // system reset
    input  wire                  trigger_async_n,// trigger (active low, e.g., SS_N)
    input  wire [DATA_WIDTH-1:0] data_in,        // live data (changing on clk)
    output reg  [DATA_WIDTH-1:0] data_out        // frozen data (stable for reading)
);

// Double-Flop Synchronizer for the asynchronous trigger:
// ss_sync[0] -> Metastable filter
// ss_sync[1] -> Stable synchronized
// ss_sync[2] -> Delayed version for edge detection
reg [2:0] trig_sync;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        trig_sync <= 3'b111; // Default High (inactive)
    end 
    else begin
        trig_sync <= {trig_sync[1:0], trigger_async_n};
    end
end

// Falling Edge Detector (High -> Low transition)
wire capture_pulse;
assign capture_pulse = (trig_sync[2] == 1'b1) && (trig_sync[1] == 1'b0);

// Snapshot Register
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        data_out <= {DATA_WIDTH{1'b0}};
    end 
    else begin
        if (capture_pulse) begin
            data_out <= data_in;
        end
    end
end

endmodule