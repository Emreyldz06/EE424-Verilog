`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.12.2023 12:07:14
// Design Name: 
// Module Name: submodule
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


module submodule(clk,x,a,b,y);
  
  input clk; 
  input [7:0] x,a,b;
  output reg [9:0] y;
  
  reg [8:0] w_1,w_12;
  reg [7:0] b_1;
  
  always@(*)begin
        
        w_1={a[7],a}+{x[7],x};
        y={b_1[7],b_1[7],b_1}+{w_12[8],w_12};
        
  end   
  
  always@(posedge clk)begin
       w_12<=w_1;
       b_1<=b;
  end
endmodule
