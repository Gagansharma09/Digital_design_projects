`timescale 1ns/1ps
module half_adder (
 input wire a,
 input wire b,
 output wire sum,
 output wire carry
);
 assign sum = a ^ b; // XOR
 assign carry = a & b; // AND
