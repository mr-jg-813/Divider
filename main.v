`timescale 1ns / 1ps
module divider(
    input  [3:0] A,   // Dividend
    input  [3:0] B,   // Divisor
    output reg [3:0] Q,  // Quotient
    output reg [3:0] R   // Remainder
);

wire [3:0] w1, w2, w3, w4;
wire       c1, c2, c3, c4;
reg  [3:0] g1, g2, g3, g4;

// Step 1: partial remainder = {0, A[3]} - B
add_sub sub1(
    .A({{3{1'b0}}, A[3]}),
    .B(B),
    .ctrl(1'b1),   // subtract
    .O(w1),
    .C(c1)
);

// If c1=1 (no borrow), keep w1; else restore by using {0, A[3]}
always @(*) begin
    if (c1)
        g1 = w1;                      // w1 = {0,A[3]} - B  (fits)
    else
        g1 = {{3{1'b0}}, A[3]};       // restore
end

// Step 2: shift g1 left, bring in A[2]
add_sub sub2(
    .A({g1[2:0], A[2]}),
    .B(B),
    .ctrl(1'b1),
    .O(w2),
    .C(c2)
);

always @(*) begin
    if (c2)
        g2 = w2;
    else
        g2 = {g1[2:0], A[2]};         // restore
end

// Step 3: shift g2 left, bring in A[1]
add_sub sub3(
    .A({g2[2:0], A[1]}),
    .B(B),
    .ctrl(1'b1),
    .O(w3),
    .C(c3)
);

always @(*) begin
    if (c3)
        g3 = w3;
    else
        g3 = {g2[2:0], A[1]};         // restore
end

// Step 4: shift g3 left, bring in A[0]
add_sub sub4(
    .A({g3[2:0], A[0]}),
    .B(B),
    .ctrl(1'b1),
    .O(w4),
    .C(c4)
);

always @(*) begin
    if (c4)
        g4 = w4;
    else
        g4 = {g3[2:0], A[0]};         // restore

    // Final partial remainder is the true remainder
    R = g4;

    // Quotient bits come from carry flags (1 = divisor fit)
    Q = (B == 4'b0000) ? 4'b0000 : {c1, c2, c3, c4};
end

endmodule
