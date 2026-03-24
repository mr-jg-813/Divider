`timescale 1ns / 1ps
module RCA(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output wire Cout,
    output [3:0] S
    );
    
wire c0, c1, c2;

f_add add0(.a(A[0]), .b(B[0]), .cin(Cin), .s(S[0]), .cout(c0));

f_add add1(.a(A[1]), .b(B[1]), .cin(c0), .s(S[1]), .cout(c1));

f_add add2(.a(A[2]), .b(B[2]), .cin(c1), .s(S[2]), .cout(c2));

f_add add3(.a(A[3]), .b(B[3]), .cin(c2), .s(S[3]), .cout(Cout));
endmodule
