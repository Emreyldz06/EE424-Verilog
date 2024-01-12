`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.12.2023 19:10:16
// Design Name: 
// Module Name: sortmain
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


module sortmain(
                input clk,we,en,sort,
                input [3:0] data_in,
                output reg [3:0] data_out,
                output reg sort_done
                );




reg [2:0] current_state_i,next_state_i;
reg [2:0] current_state_j,next_state_j;
reg [2:0] current_state_addr,next_state_addr;
reg [2:0] current_state_main,next_state_main;

reg [3:0]temp_data[7:0]; 
reg [3:0]temp;

reg [3:0] s_datain;
wire [3:0] s_dataout;
reg s_we,s_en,s_sort;

reg [2:0] temp_addr;

parameter idle=2'b00,readmem=2'b01,sorttemp=2'b10,writemem=2'b11;

initial begin
temp_data[0]=0;
temp_data[1]=0;
temp_data[2]=0;
temp_data[3]=0;
temp_data[4]=0;
temp_data[5]=0;
temp_data[6]=0;
temp_data[7]=0;

current_state_i=0;
current_state_j=0;
current_state_addr=0;
current_state_main=0;
end

singleport8x4ram b1(.clk(clk),.we(s_we),.en(s_en),.addr(current_state_addr),.di(s_datain),.do(s_dataout));


always@(posedge clk)begin
    current_state_i<=next_state_i;
    current_state_j<=next_state_j;
    current_state_addr<=next_state_addr;
    current_state_main<=next_state_main;
    temp_addr<=current_state_addr;
end

always@(*)begin
    case(current_state_main)
    idle:begin 
        s_en=en;
        s_we=we;
        s_datain=data_in;
        data_out=s_dataout;
        
        if(s_sort)begin
            
            next_state_main=readmem;
        end
        else begin
            next_state_main=idle;
        end
    
    end
    readmem:begin 
    
        s_en=1;
        s_we=0;
        temp_data[temp_addr]=s_dataout;
        if(temp_addr==7)begin
        next_state_main=sorttemp;
        end
        else begin
            next_state_main=readmem;
        end
    end
    sorttemp:begin
        s_en=0;
        if(((current_state_j==7)&(current_state_i==6)))begin
        next_state_addr=0;
        next_state_main=writemem;
        end
        else begin
            next_state_main=sorttemp;
        end
    
    
    end
    writemem:begin 
        s_en=1;
        s_we=1;
        s_datain=temp_data[current_state_addr];
        if(temp_addr==7)begin
            s_sort=0;
            sort_done=1;
            next_state_main=idle;
        end
        else begin
            next_state_main=writemem;
        end
        
    end
    
    
    endcase

end



always@(*)begin

        if((current_state_addr==7)|(current_state_main==idle))begin
        next_state_addr=0;
        end
        else next_state_addr=current_state_addr+1;       
end

always@(*)begin
     if(current_state_main==sorttemp)begin
        if(current_state_i==6)begin
        next_state_i=0;
        end
        else next_state_i=current_state_i+1;
      end
      else begin 
        next_state_i=current_state_i;
    end  
end


always@(*)begin
    
    if(current_state_main==sorttemp)begin
        if((current_state_i==6)&(current_state_j!=7))begin
            next_state_j=current_state_j+1;
        end
        else if ((current_state_j==7)&(current_state_i==6)) begin
            next_state_j=0;
        end
        else next_state_j=current_state_j;
    end
    else begin 
        next_state_j=current_state_j;
    end
end

always@(*)begin
    if(current_state_main==sorttemp)begin
        if(temp_data[current_state_i]>temp_data[current_state_i+1])begin
            temp=temp_data[current_state_i];
            temp_data[current_state_i]=temp_data[current_state_i+1];
            temp_data[current_state_i+1]=temp;
        end
    end
  
end

always@(posedge clk)begin
    if(sort) s_sort=1;
end

endmodule
