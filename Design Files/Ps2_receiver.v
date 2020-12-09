`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Digilent Inc.
// Engineer: Thomas Kappenman
// 
// Create Date: 03/03/2015 09:33:36 PM
// Design Name: 
// Module Name: PS2Receiver
// Project Name: Nexys4DDR Keyboard Demo
// Target Devices: Nexys4DDR
// Tool Versions: 
// Description: PS2 Receiver module used to shift in keycodes from a keyboard plugged into the PS2 port
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PS2Receiver(
    input clk,
    input kclk,
    input kdata,
    output [31:0] keycodeout
    );
    
    //[15:0] from keycodeout for current key
    wire keyclk, keydata;
    reg [7:0] currentdata;
    reg [7:0] previousdata;
    reg [3:0] cnt;
    reg [31:0]keycode;
    reg flag;
    
    initial begin
        keycode[31:0]<=32'd0;
        cnt<=4'b0000;
        flag<=1'b0;
    end
    
keyboard_debouncer debounce(
    .clk(clk),
    .I0(kclk),
    .I1(kdata),
    .O0(keyclk),
    .O1(keydata)
);
    
always@(negedge(keyclk))begin
    case(cnt)
    0:;//Start bit
    1:currentdata[0]<=keydata;
    2:currentdata[1]<=keydata;
    3:currentdata[2]<=keydata;
    4:currentdata[3]<=keydata;
    5:currentdata[4]<=keydata;
    6:currentdata[5]<=keydata;
    7:currentdata[6]<=keydata;
    8:currentdata[7]<=keydata;
    9:flag<=1'b1;
    10:flag<=1'b0;
    
    endcase
        if(cnt<=9) cnt<=cnt+1;
        else if(cnt==10) cnt<=0;
        
end

always @(posedge flag)begin
    if (previousdata!=currentdata)begin
        keycode[31:24]<=keycode[23:16];
        keycode[23:16]<=keycode[15:8];
        keycode[15:8]<=previousdata;
        keycode[7:0]<=currentdata;
        previousdata<=currentdata;
    end
end
    
assign keycodeout=keycode;
    
endmodule

