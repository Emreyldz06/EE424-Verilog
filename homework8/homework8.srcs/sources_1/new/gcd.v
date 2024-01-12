`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.12.2023 21:09:35
// Design Name: 
// Module Name: gcd
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


module gcd(
    A,B,clk,in_valid,idle,rst,result_valid,result_taken,result_data
    );
    
    input [15:0]                            A,B;
    output reg [15:0]               result_data;
    input         clk,in_valid,rst,result_taken;
    output reg                idle,result_valid;
    
    
    reg        zero=0,comparator=0;
    reg [15:0]            swap=0; 
    
    reg [15:0] A_current_state=0,A_next_state;
    reg [15:0] B_current_state=0,B_next_state;
    reg [15:0] result_data_next_state;
    reg [1:0]  main_current_state=0,main_next_state;
    reg        result_valid_next_state;
    
    parameter wait_data=2'b00 ,calculate=2'b01 ,done=2'b10;
    
    always@(posedge clk)begin
    
        main_current_state <= main_next_state;
        A_current_state    <= A_next_state;
        B_current_state    <= B_next_state;
        result_data        <= result_data_next_state;
        result_valid       <= result_valid_next_state;
        //state assignment
    end
    
    always@(*)begin
        
        zero       =              (B_current_state==0);
        comparator = (A_current_state<B_current_state);
        
    end
    
    always@(*)begin
        
        case(main_current_state)
            
            wait_data:begin 
                   
            main_next_state =   in_valid ? calculate : wait_data; 
            
            end
            calculate:begin 
            
            main_next_state = zero&&(~comparator)? done:calculate;
            
            end
            done:begin
            
            main_next_state = result_taken ?  wait_data:done;
            
            end
        endcase
    end
    
    always@(*)begin
        
        case(main_current_state)
            
            wait_data:begin 
            
                idle=1;
                result_valid_next_state=0;
                
            end
            calculate:begin 
            
                idle=0;
                result_valid_next_state=0;
                
            end
            done:begin
            
                idle=0;
                result_valid_next_state=1;
                
            end
        endcase
        //output assignments 
    
    end
    
    always@(*)begin
    case(main_current_state)
            
            wait_data:begin 
            
                A_next_state    =   in_valid ? A :   A_current_state;
                B_next_state    =   in_valid ? B :   B_current_state;  
                        
            end
            calculate:begin 
            
                if(comparator)begin
                    swap=A_current_state;
                    A_next_state=B_current_state;
                    B_next_state=A_current_state;    
                end
                else if(~zero) begin 
                    
                    A_next_state=   A_current_state - B_current_state;
                    
                end  
                else begin
                    A_next_state=                     A_current_state;
                    B_next_state=                     B_current_state;
                end  
            end
            done:begin
            
                    result_data_next_state =          A_current_state;
                
            end
        endcase
      
    end
endmodule
