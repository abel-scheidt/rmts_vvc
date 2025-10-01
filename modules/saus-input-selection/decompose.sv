module decompose #(
    parameter WIDTH = 16,
    parameter MAX_N = 32
)(
    input  logic [WIDTH-1:0] input_vector [31:0],
    input  logic [5:0] N,
    output logic [WIDTH-1:0] output_vector [31:0]
);
