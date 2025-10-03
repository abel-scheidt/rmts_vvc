module t2s #(
    parameter WIDTH = 16,
    parameter N = 32,
    parameter DEPTH = 0
)(
    input  logic signed [WIDTH-1:0] input_vector [31:0],
    output logic signed [WIDTH-1:0] output_vector [31:0]
);

always_comb begin
        for (int pos = (32 >> DEPTH); pos < 32; pos++) begin
            output_vector[pos] = input_vector[pos];
        end

        int R, parity, new_pos;
        for (int pos = 0; pos < (32 >> DEPTH); pos++) begin
            R = pos % N;
            parity = R % 2;
            new_pos = (pos / N) * N;
            
            if ((pos / (N / 2)) % 2 == 0) begin
                new_pos = new_pos + 2 * R - parity;
            end else begin
                new_pos = new_pos + (N - 1) - 2 * (R - parity - N / 2) - (1 - parity);
            end
            
            output_vector[new_pos] = input_vector[pos];
        end
    end
endmodule
