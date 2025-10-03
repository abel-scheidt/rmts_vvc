module decompose #(
    parameter WIDTH = 16,
    parameter N = 32,
    parameter MAX_N = 32
)(
    input  logic signed [WIDTH-1:0] input_vector [31:0],
    output logic signed [WIDTH + $clog2(MAX_N) - 1:0] output_vector [31:0]
);
    localparam MAX_DEPTH = $clog2(MAX_N) - 1;

    // The problem now is how to use generate to store values of different sizes.
    // The idea was to make something like this:
    /*  logic signed [WIDTH-1:0] t2s_output [MAX_DEPTH-1:0][MAX_N:0];
        logic signed [WIDTH-1:0] butterfly_output [MAX_DEPTH-1:0][31:0];
        logic signed [WIDTH-1:0] t2s_back_output [MAX_DEPTH-1:0][31:0];

        genvar depth
        generate
            for (depth = 0; depth < MAX_DEPTH; depth++) begin : depth_stages
                t2s_module #(
                    .WIDTH(WIDTH + depth),
                    .DEPTH(depth)
                ) t2s_inst (
                    .input_vector(depth == 0 ? input_vector : t2s_back_output[depth-1]),
                    .N(N >> depth),
                    .output_vector(t2s_output[depth])
                ); (...) */
    // But this can't be done because as depth increases, t2s_back_output size also increases,
    // as well t2s_output and butterfly_output. So the static signals definition does not work.
    // The question is whether is possible to generate these signals dinamically or not.
