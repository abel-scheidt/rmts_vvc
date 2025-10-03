module butterfly #(
    parameter WIDTH = 16
)(
    input  logic signed [WIDTH-1:0] in0,
    input  logic signed [WIDTH-1:0] in1,
    input  logic signed [WIDTH-1:0] in2,
    input  logic signed [WIDTH-1:0] in3,
    output logic signed [WIDTH:0] out0,
    output logic signed [WIDTH:0] out1,
    output logic signed [WIDTH:0] out2,
    output logic signed [WIDTH:0] out3
);
    adder #(.WIDTH(WIDTH)) add03 (
        .a(in0),
        .b(in3),
        .sum(out0)
    );
    
    adder #(.WIDTH(WIDTH)) add12 (
        .a(in1),
        .b(in2),
        .sum(out1)
    );
    
    subtractor #(.WIDTH(WIDTH)) sub12 (
        .a(in1),
        .b(in2),
        .diff(out2)
    );
    
    subtractor #(.WIDTH(WIDTH)) sub03 (
        .a(in0),
        .b(in3),
        .diff(out3)
    );
endmodule
