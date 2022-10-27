module counter #(
    parameter WIDTH = 8
)
(

    // interface signals
    input logic vbuddy_preset,
    input logic [WIDTH-1:0] rotary_encoder,
    input logic clk, // clock
    input logic rst, // reset
    input logic en, // counter enable
    output logic [WIDTH-1:0] count // counter output
);

always_ff @ (posedge clk, posedge rst, posedge vbuddy_preset)
    if (vbuddy_preset) count <= rotary_encoder;
    else if (rst) count <= {WIDTH{1'b0}};
    else count <= count + {{WIDTH-1{1'b0}}, en};
endmodule
