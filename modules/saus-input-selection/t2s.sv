module t2s #(
    parameter WIDTH = 16,
    parameter DEPTH = 0
)(
    input  signed [WIDTH-1:0] input_vector [31:0],
    input  signed [5:0] N,
    output signed [WIDTH-1:0] output_vector [31:0]
);
