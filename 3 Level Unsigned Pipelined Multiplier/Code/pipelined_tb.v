`timescale 1ns/1ns
`include "pipelined_multiplier.v"

module pipelined_tb;

// Inputs
reg [3:0] x;
reg [3:0] y;
reg clk;
// Outputs
wire [7:0] out;
// Instantiate the Unit Under Test (UUT)
pipelined_multiplier uut (.x(x),.y(y),.out(out),.clk(clk));

initial begin
    $dumpfile("pipelined_tb.vcd");
    $dumpvars(0,pipelined_tb);
// Initialize Inputs
clk = 0;
x=3;y=2;
#10 x=8;y=5;
#10 x=2;y=8;
#10 x=9;y=3;
#10 x=6;y=8;
#10 x=7;y=5;
#10 x=2;y=9;
#10 x=6;y=4;
#30 $finish;
end
always #5 clk=~clk;
endmodule
