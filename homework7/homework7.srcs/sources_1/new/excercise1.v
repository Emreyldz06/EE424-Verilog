`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.12.2023 12:29:25
// Design Name: 
// Module Name: excercise1
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


module excercise1(x,a,b,c,y

    );

input [7:0] a,b,c,x;
output reg [10:0]  y ;

reg [8:0]w1;
reg [9:0]w2;
always@(*)begin
    
    w1={a[7],a}+{x[7],x};
    w2={w1[8],w1}+{b[7],b[7],b};
    y={w2[9],w2}+{c[7],c[7],c[7],c};
end
endmodule 

