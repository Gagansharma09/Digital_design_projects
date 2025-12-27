`timescale 1ns/1ps
module full_adder(
 input in1,
 input in2,
 input cin,
 output sum,
 output carry);
 
 assign sum = in1^in2^cin;
 assign carry =(in1&in2)|(in2&cin)|(in1&cin);
endmodule
