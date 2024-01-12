module sum_of_two_largest(
  input [1:0] A,
  input [1:0] B,
  input [1:0] C,
  output [2:0] out
);

assign out = (A > B && A > C) ? ((B > C) ? (A + B) : (A + C))
           : (B > A && B > C) ? ((A > C) ? (B + A) : (B + C))
           : (C + ((A > B) ? A : B));

endmodule