`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2023 13:27:24
// Design Name: 
// Module Name: exercise3
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


module exercise3( clk,X2,X21,Y2,Y21,A,B

    );

input [7:0] X2,X21,A,B;
input clk;
output  [9:0] Y2,Y21;

submodule b1(.clk(clk),.x(X2),.a(A),.b(B),.y(Y2));
submodule b2(.clk(clk),.x(X21),.a(A),.b(B),.y(Y21));



    
endmodule
