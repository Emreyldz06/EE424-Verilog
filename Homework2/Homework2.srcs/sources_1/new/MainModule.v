`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.10.2023 12:16:53
// Design Name: 
// Module Name: MainModule
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


module MainModule(clk,rst, A,C

    );
    input clk,A,rst;
    output reg C;
    initial begin
        C = 0;
    end
    
    reg [1:0]current_state,next_state;
    
    parameter zero = 2'b00;
    parameter one = 2'b01;
    parameter two = 2'b11;
    parameter three = 2'b10;   
    
    always@(*)
    begin
    C=(current_state==three)?1:0;
    end 
    
    always@(posedge clk)
    begin
    if(rst)current_state<=zero;
    else current_state<=next_state;

    end
    
    always@(*)
    
    begin
            
        case(current_state)
        zero:begin 
        next_state = A ? one : zero;
        end
        one:begin 
        next_state = A ? one : two;
        end
        two:begin 
        next_state = A ? three : zero;
        end
        three:begin
        next_state=A ? one : zero;
        end
        
        default: next_state=zero;
        endcase
    
    end
    

    
    
    
    
    
endmodule
