`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.12.2023 14:16:39
// Design Name: 
// Module Name: sel_sort
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


module sel_sort(

    input clk,we,en,sort,
    input [2:0] addr,
    input [3:0] data_in,
    output reg [3:0] data_out,
    output reg sort_done

    );
    
reg [3:0] min_val=15;             //Min val had settle to 15 is the max of the 4-bit number
reg [2:0] temp_index;
reg [3:0] read_val,loop_val;
reg sort_done_ff;  


wire [3:0] ram_dout;
reg  [3:0] ram_din;
reg  [2:0] ram_addr;
reg        ram_enable;
reg        ram_wenable;    // Block data registers taken from the block ram

reg  [2:0] current_index_currentstate=0,current_index_nextstate;
reg  [2:0] loopcounter_currentstate=0,loopcounter_nextstate;
reg  [1:0] main_current_state=0,main_next_state;
reg  swap_current_state=0,swap_next_state;                               //case Definitions 
 
parameter idle=2'b00,findmin=2'b01,swap=2'b10; //3 states are idle findmin and swap

singleport8x4ram b1(.clk(clk),.we(ram_wenable),.en(ram_enable),.addr(ram_addr),.di(ram_din),.do(ram_dout));   

always@(posedge clk)begin

    current_index_currentstate<=current_index_nextstate;
    loopcounter_currentstate<=loopcounter_nextstate;
    main_current_state<=main_next_state;
    swap_current_state<=swap_next_state;
    sort_done<=sort_done_ff;
    // The state assignments done in the posedge clk 
end

always@(*)begin

    if(main_current_state==swap) swap_next_state=1;
    else swap_next_state=0;
    // This swap state determines  which value write to ram
end  




always@(*)begin

    case(main_current_state)
    
        idle:begin 
            data_out=ram_dout;
            ram_din=data_in;
            ram_addr=addr;
            ram_enable=en;
            ram_wenable=we;
            if(sort)begin 
                main_next_state=findmin;
            end      
            else begin 
                main_next_state=main_current_state; 
            end
        end
        
        findmin: begin 
            ram_enable=1;
            ram_wenable=0;
            ram_addr=current_index_currentstate;
            read_val=ram_dout;
            if(current_index_currentstate==7)begin
                
               
                main_next_state=swap; 
            end
            else if(sort_done) begin 
               main_next_state=idle;
            end
            else begin main_next_state=main_current_state; end    
        end
        
        swap:begin 
            ram_enable=1;
            ram_wenable=1;
            read_val=ram_dout;

                if(swap_current_state==0)begin
                    ram_addr=temp_index;
                    ram_din = loop_val;
                end
                else begin
                    
                    ram_addr=loopcounter_currentstate;
                    ram_din= min_val;
                    if(loopcounter_currentstate==6)begin
                       sort_done_ff=1;
                       main_next_state=idle; 
                    end
                    else begin
                        main_next_state=findmin; 
                    end
                end
          
        end
    
    endcase

end




always@(*)begin
       
       case (main_current_state)
       
       idle:begin 
        current_index_nextstate=0;
       end
       findmin:begin 
       current_index_nextstate=current_index_currentstate+1;
       end
       swap:begin 
        if(swap_current_state==1) current_index_nextstate=loopcounter_nextstate;
        else current_index_nextstate=current_index_currentstate;
       end
       
       endcase
 
end


always@(*)begin
    
        if ((swap_current_state==1 & loopcounter_currentstate==6)&(main_current_state==swap)) begin
            loopcounter_nextstate=0;
        end
        else if(main_current_state==swap & swap_current_state==1)begin
            loopcounter_nextstate=loopcounter_currentstate+1;
        end
        
        else loopcounter_nextstate=loopcounter_currentstate;
end

always @(*)begin 
        
        case(main_current_state)
        idle: begin
            min_val=15;
            loop_val<=0;
            temp_index<=0;
        end
        
        findmin: begin 
            
            if((current_index_currentstate-1)==loopcounter_currentstate)begin 
                
                loop_val<=read_val;
            end
            else begin 
                 loop_val<=loop_val;
            end
            if (swap_current_state==1)begin 
                          
                 min_val<=15; 
                 temp_index<=loopcounter_currentstate;  
            end
            
            else begin  
                if(read_val<=min_val)begin 
                   min_val<=read_val;
                   temp_index<=current_index_currentstate-1;
                end
                else begin 
                   min_val<=min_val; 
                   temp_index<=temp_index;
                end
            end
            
        end
        
        swap: begin 
            
            if((read_val<min_val)&(loopcounter_currentstate==0))begin 
               min_val<=read_val;
               temp_index<=7;
            end
            else if((read_val<min_val)&(current_index_currentstate==0)&~((loopcounter_currentstate==0))) begin
                min_val<=read_val;
                temp_index<=7;
            end
            else begin 
               min_val=min_val; 
               temp_index=temp_index;
            end
        
        end
        
        endcase
        
end

endmodule
