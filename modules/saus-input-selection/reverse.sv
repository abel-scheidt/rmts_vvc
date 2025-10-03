module reverse #(
    parameter WIDTH = 16,
    parameter N = 32
)(
    input  logic signed [WIDTH-1:0] input_vector [31:0],
    output logic signed [WIDTH-1:0] output_vector [31:0]
);
    always_comb begin
        int new_pos;
        for (int pos = 0; pos < 32; pos++) begin
            new_pos = 32 - ((pos / N + 1) * N) + pos % N;
            output_vector[new_pos] = input_vector[pos];
        end
    end
endmodule
