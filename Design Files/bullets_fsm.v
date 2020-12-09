`timescale 1ns / 1ps

module bullets_fsm(
    output [1:0]numBullets,            // number of bullets equals the state
    input clk,                         //duration of round time
    input [2:0]action                  //player's input, 3 bits for each of the three actions
    );
    
   reg [1:0]state = 2'b01;
   
   always @ (posedge clk) begin 
   case(action)
        3'b001: 
        begin
        state <= state;
        end
        
        3'b010: if(state == 2'b11) begin
                state <= state;
                end 
                else begin
                state <= state + 2'b01;
                end

        3'b100: if (state == 0) begin
             state <= state;
             end
             else begin 
             state <= state - 2'b01;
             end

      endcase
   end
   
   assign numBullets = state;

          
endmodule
