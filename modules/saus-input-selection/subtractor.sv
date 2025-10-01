module subtractor #(
    parameter WIDTH = 16
)(
    input  logic signed [WIDTH-1:0] a,
    input  logic signed [WIDTH-1:0] b,
    output logic signed [WIDTH:0] diff
);
    assign diff = a - b;
endmodule
