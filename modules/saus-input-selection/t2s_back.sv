module t2s_back #(
    parameter WIDTH = 16,
    parameter DEPTH = 0
)(
    input  logic [WIDTH-1:0] input_vector [31:0],
    output logic [WIDTH-1:0] output_vector [31:0]
);
