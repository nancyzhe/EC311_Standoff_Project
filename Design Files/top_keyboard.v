`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2020 07:13:22 PM
// Design Name: 
// Module Name: top_keyboard
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


module top_keyboard(
    input CLK100MHZ,
    input PS2_CLK,
    input PS2_DATA,
    output UART_TXD,
    //output [31:0]keycodeout
    output [2:0] choicep1
    //output [2:0] choicep2 
    //output reset
    );
    
reg CLK50MHZ=0;    
wire [31:0]keycode;
//remember to put this ******************************************
always @(posedge(CLK100MHZ))begin
    CLK50MHZ<=~CLK50MHZ;
end

PS2Receiver k1(
.clk(CLK50MHZ),
.kclk(PS2_CLK),
.kdata(PS2_DATA),
.keycodeout(keycode[31:0])
);
//assign keycodeout=keycode;

//choice1 comes from U I O; choice2 comes from Q W E; reset comes from R
keyboard_decoder d1(.in(keycode),.choicep1(choicep1),.choicep2(choicep2),.reset(reset));
endmodule
