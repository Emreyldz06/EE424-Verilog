`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2023 22:39:42
// Design Name: 
// Module Name: main_module
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


module main_module(clk,rst,led,button

    );
 input clk,rst,button;
 output reg led;
 wire button_temp,button_real;
 
 debouncer b1(.clk(clk),.rst(rst),.dein(button),.deout(button_temp));
 edgedetector b2(.clk(clk),.rst(rst),.edgein(button_temp),.edgeout(button_real));
 
 always@(posedge clk)begin
 
 led=rst?0:(button_real)?~led:led;
 
 end
 
 
    
endmodule
