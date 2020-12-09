`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2020 05:38:01 PM
// Design Name: 
// Module Name: keyboard_decoder
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


module keyboard_decoder(
input [31:0] in,
output reg [2:0] choicep1,
output reg [2:0] choicep2,
output reg reset
    );
    
wire [7:0] ckey; //extraction from the input as current key
assign ckey=in[7:0];
// shoot 001
// reload 010
// duck 001
//P1 U I O
//P2 Q W E
//RESET R
always@(*)
begin
case(ckey)
//P1
//U 3C (shoot) 100
8'b00111100: choicep1=3'b100; //16'b1111000000111100: choicep1=3'b100;
//I 43 (reload) 010
8'b01000011: choicep1=3'b010; //16'b1111000001000011: choicep1=3'b010;
//O 44 (duck) 001
8'b01000100: choicep1=3'b001; //16'b1111000001000100: choicep1=3'b001;
// P2
//Q 15 SHOOT
8'b00010101 : choicep2=3'b100; //16'b1111000000010101 : choicep2=3'b100;
//W 1D RELOAD
8'b00011101 : choicep2=3'b010; //16'b1111000000011101 : choicep2=3'b010;
//E 24 DUCK   
8'b00100100 : choicep2=3'b001; //16'b1111000000100100 : choicep2=3'b001;
//RESET 
//R 2D     
8'b00101101 : reset=1'b1;   //16'b1111000000101101 : reset=1'b1; 
default: begin
    choicep1=3'b0;
    choicep2=3'b0;
    reset=0;
    end 
endcase
end
endmodule
