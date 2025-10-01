module subtractor #(
    parameter WIDTH = 16
)(
    input  logic [WIDTH-1:0] a,
    input  logic [WIDTH-1:0] b,
    output logic [WIDTH:0] diff
);
    assign diff = a - b;
endmodule
