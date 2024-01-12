`timescale 1ns / 1ps
module sorting(
 input clock, 
 output reg sort_flag, // when sorting complete sort_flag is 1
 output reg signed [7:0] outA,// send them to GCD module biggest 2 numbers
 output reg signed [7:0] outB 

 );
 parameter K = 16 ; 
 wire [7:0] data_out;

 reg signed [7:0] data_in; 
 reg WE; 
 reg signed [7:0] temp_1,temp_2; 
 reg [4:0] state,nextState; 
 reg [3:0]addr,C1,C2 ;  

 localparam IDLE = 'd0, // states are defined as localparameters
 first_read = 'd1,
 adress_wait= 'd2,
 second_read = 'd3,
 compare = 'd4,
 first_write = 'd5,
 second_write = 'd6,
 write_wait = 'd7,
 done = 'd8,
 OUT_A = 'd9,
 OUT_B = 'd10,
 C1_adr = 'd11,
 C2_adr = 'd12,
 wait_write = 'd13;
 initial 
 begin
 addr <= 0;
 WE <= 1'b0;
 state <= IDLE;
 end

 always @(posedge clock)
 begin
 case(state)
 IDLE: begin
 WE <= 1'b0;
 C1<=0;
 addr <= 0;
 state <= C2_adr;
 sort_flag <= 1'b0;
 end
 C2_adr:
 begin
 WE <= 1'b0;
 C2<=C1+1;
 state <= C1_adr;
 sort_flag <= 1'b0;
 end
 C1_adr:
 begin
 addr<= C1 ; 
 state <= adress_wait;
 nextState <= first_read;
 end
 first_read: begin 
 // 1 clock cyle RAM is waited to update data_out with new address.
 temp_1 <= data_out;
 state <= adress_wait;
 nextState <= second_read; 
 addr <= C2;
 end

 adress_wait: begin // wait for 1 clock cyle
 state <= nextState;
 end

 second_read: begin // after waiting 1 clock cyle read the second data and go to  compare state
 temp_2 <=data_out;
 state <= compare;
 end

 compare: begin
 if(temp_2 > temp_1) // compare the data
 begin
 temp_1 <= temp_2 ; 
 temp_2 <= temp_1 ; 
 state <= first_write;

 end
 else if(C1==K-2) begin  state <=done ;   end 
 else if(C2==K-1)begin state<= adress_wait ; nextState <=C2_adr; C1=C1+1;  end
 else if (temp_2 < temp_1)begin nextState = C1_adr ; C2=C2+1;   state <=adress_wait;   end

 end

 first_write: begin 
 
 WE <= 1'b1;
 data_in <= temp_2;
 state <= adress_wait;
 nextState <= wait_write;

 end
 
 wait_write:
 begin
 addr<= C1 ; 
 state <= adress_wait ; 
 nextState <= second_write;
 end
 second_write: begin 
 data_in <= temp_1;
 state <= write_wait;
 addr <= C1;
 //addr <= addr + 1;
 end
 write_wait: begin 
 WE <= 1'b0;
 state <= C1_adr;
 end
 done: begin // after the sorting is Done, we assign the two greatest number as outA and outB
 addr <= 0;
 nextState <= OUT_A;
 state <= adress_wait;
 end
 OUT_A: begin
 outA <= data_out;
 addr <= 1;
 nextState <= OUT_B;
 state <= adress_wait;
 end
 OUT_B: begin
 outB <= data_out;
 sort_flag <= 1'b1;
 end
 endcase
 end
 RAM RAM_1 ( 
 .clk(clock),
 .addr(addr),
 .WE(WE),
 .data_in(data_in),
 .data_out(data_out)
 );
endmodule