`timescale 1ns / 1ps
module f_add(
    input a,
    input b,
    input cin,
    output reg s,
    output reg cout
    );
    
always@ (*) begin
s = a ^ b ^ cin;
cout = (a&b) | (a&cin) | (b&cin); 
end
endmodule
