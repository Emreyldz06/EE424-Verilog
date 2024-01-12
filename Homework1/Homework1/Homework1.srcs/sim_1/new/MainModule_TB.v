`timescale 1ns / 1ps
module MainModule_TB;

    reg [1:0] A;
    reg [1:0] B;
    reg [1:0] C;
    wire [2:0] out;

    hw1 uut(.A(A),.B(B),.C(C),.out(out));

    initial begin
        A = 2;
        B= 0;
        C = 3;
        #10;
        A = 0;
        B= 1;
        C = 2;
        #10;
        A = 1;
        B= 2;
        C = 3;
        #10;
        A = 3;
        B= 2;
        C = 1;
        #10;
    end

endmodule