`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2023 14:42:53
// Design Name: 
// Module Name: excercise2
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


module excercise2(clk,x,a,b,c,y

    );
    
input clk;
input [7:0] a,b,c,x;
output reg [10:0]  y ;

reg [8:0] b1,c1,c2;
reg [8:0] w1,w1_1;
reg [9:0] w2,w2_2;

always@(*)begin
    
    w1={a[7],a}+{x[7],x};
    w2={w1_1[7],w1_1}+{b1[7],b1};
    y={w2_2[7],w2_2}+{c2[7],c2};
end

always@(posedge clk)begin
    
    w1_1<=w1;
    w2_2<=w2;
    c1<=c;
    c2<=c1;
    b1<=b;
end



endmodule
