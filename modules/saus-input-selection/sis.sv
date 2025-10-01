module sis #(
    parameter WIDTH = 16,
    parameter MAX_N = 32
)(
    input  logic [1:0] transform_type,
    input  logic [5:0] N,
    input  logic [WIDTH-1:0] input_vector [31:0],
    output logic [WIDTH-1:0] output_vector [31:0]
);
