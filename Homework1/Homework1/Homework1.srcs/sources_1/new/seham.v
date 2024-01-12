module hw1(
    input [1:0] A,
    input [1:0] B,
    input [1:0] C,
    output reg [2:0] out
    
    );
    
    always @*
       begin
        if (A>B && B>C)
            out=A+B;
        else if(A>B && C>B)
            out=A+C;
        else if(B>A && A>C)
            out=A+B;
        else if(B>C && C>A)
            out=B+C;
        else if (C>A && A>B)
            out=A+C;
        else if(C>B && B>A)
            out=B+C;
    
    end
endmodule