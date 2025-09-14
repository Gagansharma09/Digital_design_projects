`timescale 1ns/1ps
module full_adder_tb;
 logic in1, in2, cin;
 logic sum, carry;
 // DUT instantiation
 full_adder dut (
 .in1(in1),
 .in2(in2),
 .cin(cin),
 .sum(sum),
 .carry(carry)
 );
 // VCD dump
 initial begin
 $dumpfile("dump.vcd");
 $dumpvars(0, full_adder_tb); // <-- FIXED
 end
 // Stimulus
 initial begin
 in1=0; in2=0; cin=0; #10;
 in1=0; in2=1; cin=0; #10;
 in1=1; in2=0; cin=0; #10;
 in1=1; in2=1; cin=0; #10;
 in1=0; in2=0; cin=1; #10;
 in1=0; in2=1; cin=1; #10;
 in1=1; in2=0; cin=1; #10;
 in1=1; in2=1; cin=1; #10;
 $finish;
 end
 initial begin
 $monitor("t=%0d,in1=%0d,in2=%0d,sum=%0d,carry=%0d",$time,in1,in2,sum,carry);
 end
endmodule
