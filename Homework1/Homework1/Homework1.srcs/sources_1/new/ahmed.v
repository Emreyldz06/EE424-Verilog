module Yontem2(
    input [1:0] A,
    input [1:0] B,
    input [1:0] C,
    output reg  [2:0] out
    );
    wire [2:0] D1,D2,D3;
   assign D1=A+B;
   assign D2=B+C;
   assign D3=C+A;
    
    always@(*)begin
    if((D1>D2) && (D1>D3))
    out=D1;
    else if ((D2>D3)&&(D2>D1))
    out=D2;
    else 
    out=D3;
    end
endmodule
