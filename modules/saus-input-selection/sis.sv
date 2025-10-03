module sis #(
    parameter WIDTH = 16,
    parameter N = 32,
    parameter MAX_N = 32
)(
    input  logic [1:0] transform_type,
    input  logic signed [WIDTH-1:0] input_vector [31:0],
    output logic signed [WIDTH+$clog2(MAX_N)-1:0] output_vector [31:0]
);
    localparam DCT2 = 2'b00;
    localparam DST7 = 2'b01;
    localparam DCT8 = 2'b10;
    
    logic signed [WIDTH+$clog2(MAX_N)-1:0] decompose_output [31:0];
    logic signed [WIDTH-1:0] reverse_output [31:0];
    
    decompose_module #(
        .WIDTH(WIDTH),
        .N(N),
        .MAX_N(MAX_N)
    ) decompose_inst (
        .input_vector(input_vector),
        .output_vector(decompose_output)
    );
    
    reverse_module #(
        .WIDTH(WIDTH),
        .N(N)
    ) reverse_inst (
        .input_vector(input_vector),
        .output_vector(reverse_output)
    );
    
    always_comb begin
        case (transform_type)
            DCT2: begin
                output_vector = decompose_output;
            end
            DCT8: begin
                for (int i = 0; i < 32; i++) begin
                    output_vector[i] = reverse_output[i];
                end
            end
            DST7: begin
                for (int i = 0; i < 32; i++) begin
                    output_vector[i] = input_vector[i];
                end
            end
            default: begin
                for (int i = 0; i < 32; i++) begin
                    output_vector[i] = input_vector[i];
                end
            end
        endcase
    end
endmodule
