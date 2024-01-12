`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2023 00:30:09
// Design Name: 
// Module Name: mainmodule
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


module mainmodule( n_temp,clk,out,rst

    );
    
    input clk,rst;
    input [9:0] n_temp;
    output reg [8:0]out;
    reg [9:0]ra,rb,rc,rd;
    reg [10:0]sum1,sum2;
    reg [11:0]sum3;
    reg [11:0]shifted_sum;
    reg [9:0] round =10'b0000000001;
    reg [9:0]rounded_num;
    initial begin 
    out=10'b0000000000;
    end
    always@(posedge clk) begin 
        if(rst)begin 
        ra<=10'b0000000000;
        rb<=10'b0000000000;
        rc<=10'b0000000000;
        rd<=10'b0000000000;
        end
        else begin
        ra<=n_temp;
        rb<=ra;
        rc<=rb;
        rd<=rc; 
       
       
        out<=rounded_num[9:1];
        end  
    end
    always@(*)begin 
    
        sum1={ra[9],ra}+{rb[9],rb};
        sum2={rc[9],rc}+{rd[9],rd};
        sum3={sum1[10],sum1}+{sum2[10],sum2};
        shifted_sum={sum3[11],sum3[11],sum3[11:2]};
        rounded_num= shifted_sum[9:0]+round;
    
    end

endmodule
