`timescale 1ns / 1ps
module add_sub(
    input [3:0] A,
    input [3:0] B,
    input ctrl,
    output [3:0] O,
    output C
    );
    
reg [3:0] b;
always@ (*) begin
 b = B ^ {4{ctrl}};
end

RCA add(.A(A), .B(b), .S(O), .Cin(ctrl), .Cout(C));

endmodule
