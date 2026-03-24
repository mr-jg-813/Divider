`timescale 1ns / 1ps

module divider(
    input [3:0] A,
    input [3:0] B,
    output reg [3:0] Q,
    output reg [3:0] R
    );
    
reg ctrl;
wire c1,c2,c3,c4;
wire [3:0] w1,w2,w3,w4;
reg [3:0] g1,g2,g3,g4;
always@ (*) begin
     ctrl = 1; 
     end

add_sub sub1(.A({{3{1'b0}},A[3]}), 
            .B(B), 
            .ctrl(ctrl), 
            .O(w1),
            .C(c1) );
always@ (*) begin
ctrl = 1;
case(c1) 
1'b0: g1 = {{2{1'b0}},{A[3:2]}};
1'b1: g1 = w1;
endcase
end
add_sub sub2(.A(g1), 
            .B(B), 
            .ctrl(ctrl), 
            .O(w2),
            .C(c2) );
          
always@ (*) begin
ctrl = 1;
case(c2) 
1'b0: g2 = {{1'b0},A[3:1]};
1'b1: g2 = w2;
endcase
end
add_sub sub3(.A(g2), 
            .B(B), 
            .ctrl(ctrl), 
            .O(w3),
            .C(c3) );
          
always@ (*) begin
case(c3) 
1'b0: g3 = {{1'b0},A[3:1]};
1'b1: g3 = w3;
endcase
end
add_sub sub4(.A(g3), 
            .B(B), 
            .ctrl(ctrl), 
            .O(w4),
            .C(c4) );
          
always@ (*) begin
case(c4) 
1'b0: g4 = {{1'b0},A[3:1]};
1'b1: g4 = w4;
endcase

Q = {c1,c2,c3,c4};
end
endmodule
