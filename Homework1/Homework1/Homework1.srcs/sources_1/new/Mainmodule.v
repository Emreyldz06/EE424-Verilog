`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2023 12:17:48
// Design Name: 
// Module Name: Mainmodule
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Mainmodule(
    
    input [1:0] A,
    input [1:0] B,
    input [1:0] C,
    output[2:0] out 
    );
    wire [2:0]csignificant;
    wire [7:0]decoder_out;
    wire [1:0]compA_B;
    wire [1:0]compA_C;
    wire [1:0]compC_B;
    
    assign csignificant = {A[1],B[1],C[1]};
    
    decoder3x8 U1 (.D_in(csignificant),.D_out(decoder_out));
    twobitComp U2 (.compinA(A),.compinB(B),.compout(compA_B)); 
    twobitComp U3 (.compinA(A),.compinB(C),.compout(compA_C)); 
    twobitComp U4 (.compinA(C),.compinB(B),.compout(compC_B)); 
    
    assign out= (decoder_out==2) ? (C + compA_B ):
                (decoder_out==4) ? (B + compA_C ):
                (decoder_out==8) ? (C + B ):
                (decoder_out==16) ? (A + compC_B ):
                (decoder_out==32) ? (C + A ):
                 A+B;
    
    
endmodule
