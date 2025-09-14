`timescale 1ns/1ps
module tb_half_adder;
 logic a, b; // SV-style
 logic sum, carry;
 // DUT instantiation (make sure RTL module is named half_adder)
 half_adder dut (
 .a(a),
 .b(b),
 .sum(sum),
 .carry(carry)
 );
 // VCD dump (only needed if using Icarus/EDA Playground)
 initial begin
 $dumpfile("dump.vcd");
 $dumpvars(0, tb_half_adder);
end
 // Monitor signals
 initial begin
 $monitor("TIME=%0t | a=%b b=%b | sum=%b carry=%b",
 $time, a, b, sum, carry);
 end
 // Stimulus
 initial begin
 a=0; b=0; #10;
 a=0; b=1; #10;
 a=1; b=0; #10;
 a=1; b=1; #10;
 $finish;
 end
endmodule
