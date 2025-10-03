module t2s_back #(
    parameter WIDTH = 16,
    parameter DEPTH = 0
)(
    input  logic signed [WIDTH-1:0] input_vector [31:0],
    output logic signed [WIDTH-1:0] output_vector [31:0]
);

    always_comb begin
        int N = 32 >> DEPTH;
        
        for (int pos = N; pos < 32; pos++) begin
            output_vector[pos] = input_vector[pos];
        end

        int new_pos;
        for (int pos = 0; pos < N; pos++) begin
            if ((pos % 4) / 2) begin // Odd
                new_pos = N / 2 + pos / 2 - pos % 2;
            end else begin // Even
                new_pos = pos / 2 + pos % 2;
            end
            output_vector[new_pos] = input_vector[pos];
        end
    end
endmodule
