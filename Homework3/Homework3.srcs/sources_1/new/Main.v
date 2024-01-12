`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2023 12:05:24
// Design Name: 
// Module Name: TopModule
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


module TopModule(
    clk,ld_en,shift_en,seed,out,rst
        

    );
    input rst;
    input clk;
    input ld_en;
    input shift_en;
    input [31:0]seed;
    output reg out;
    reg feedback;
    reg [31:0] temp;
    always@(*)begin
    
        feedback=temp[0]^(temp[1]^(temp[20]^temp[31]));
        
    end
    
    always@(posedge clk)begin
        
//       if(rst)begin
//            temp<=32'b0;
//       end
//       else begin
//       if(ld_en)begin
            
//            temp<=seed;
//       end
//       else if(shift_en)begin 
            
//            temp<={temp[30:0],feedback};
            
//       end    
//       else begin 
//            temp<=temp;
//       end       
       
//       end
      temp <= (rst) ? 32'b0 : (ld_en) ? seed : (shift_en) ? {temp[30:0], feedback} : temp;

    end
    
    always@(*)begin
        out=temp[31];
    end
    
endmodule
