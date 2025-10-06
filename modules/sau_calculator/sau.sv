module sau #(
    parameter WIDTH = 20
)(
    input  logic signed [WIDTH-1:0] in,
    output logic signed [WIDTH+2:0] out [7:0]
);

    logic signed [WIDTH+2:0] in_extended;
    logic signed [WIDTH+2:0] in_shift1;
    logic signed [WIDTH+2:0] in_shift2;
    logic signed [WIDTH+2:0] in_shift3;
    
    assign in_extended = {{3{in[WIDTH-1]}}, in};
    assign in_shift1 = in_extended << 1;
    assign in_shift2 = in_extended << 2;
    assign in_shift3 = in_extended << 3;
    
    assign out[0] = in_extended;
    assign out[1] = in_shift1;
    assign out[2] = in_shift2 - in_extended;
    assign out[3] = in_shift2;
    assign out[4] = in_shift2 + in_extended;
    assign out[5] = out[2] << 1;
    assign out[6] = in_shift3 - in_extended;
    assign out[7] = in_shift3;

endmodule
