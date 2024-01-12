`timescale 1ns / 1ps

//Single port RAM
module RAM( 
        input clk,
        input [3:0] addr, //addr 4 bit to hold 16 RAM adress space 
        input WE, 
        input signed [7:0] data_in, // Input of RAM
        output reg signed [7:0] data_out  // Output of RAM
    );  
    reg signed [7:0] RAM [15:0];
     //Inýtýal RAM values
    initial
    begin
        RAM [0] = 1; 
        RAM [1] = -10;
        RAM [2] = 14;
        RAM [3] = -23;
        RAM [4] = 37;
        RAM [5] = 2;
        RAM [6] = 26;
        RAM [7] = 90;
        RAM [8] = 41;
        RAM [9] = 56;
        RAM [10] = 73;
        RAM [11] = 16;
        RAM [12] = 100;
        RAM [13] = 57;
        RAM [14] = 51;
        RAM [15] = -7;
    end    
    always @(posedge clk ) 
    begin
        if(WE) 
        begin
            RAM[addr] <= data_in; //Write first mode
            data_out <= data_in; 
        end
        else
        begin // if WE=0 read adress 
            data_out <= RAM[addr]; 
        end
    end   
endmodule
