module adder #(
    parameter WIDTH = 16
)(
    input  logic [WIDTH-1:0] a,
    input  logic [WIDTH-1:0] b,
    output logic [WIDTH:0] sum
);
    assign sum = a + b;
endmodule
