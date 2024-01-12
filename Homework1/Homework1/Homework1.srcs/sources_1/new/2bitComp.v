`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2023 12:01:37
// Design Name: 
// Module Name: 2bitComp
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


module twobitComp(
    input [1:0] compinA,
    input [1:0] compinB,
    output [1:0] compout
);

assign compout = (compinA > compinB) ? compinA : compinB;
endmodule
