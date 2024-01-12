`timescale 1ns / 1ps

module LFSR32 (
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

    feedback=temp[0]^(temp[11]^(temp[30]^temp[31]));
    
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
  temp <= (rst) ? 32'b0 : (ld_en) ? seed : (shift_en) ? {feedback,temp[31:1]} : temp;

end

always@(*)begin
    out=temp[0];
end

endmodule 