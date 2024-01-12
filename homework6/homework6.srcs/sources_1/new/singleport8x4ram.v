`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.12.2023 19:13:41
// Design Name: 
// Module Name: singleport8x4ram
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


module singleport8x4ram(input clk,input we,input en,input [2:0] addr,input [3:0] di,output reg [3:0]do);

 
    
    (*RAM_STYLE="BLOCK"*)
    reg [3:0] ram8x4 [7:0];
  
    initial begin
    ram8x4[0]=2;
    ram8x4[1]=3;
    ram8x4[2]=4;
    ram8x4[3]=5;
    ram8x4[4]=6;
    ram8x4[5]=7;
    ram8x4[6]=8;
    ram8x4[7]=1;
    end
    always@(posedge clk)begin
        if(en)begin
       
            if(we)begin
                ram8x4[addr]<=di;
                do<=di;
                
            end
            else do<=ram8x4[addr];
           
        end    
    end


endmodule
