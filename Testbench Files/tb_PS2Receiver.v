`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2020 05:14:21 PM
// Design Name: 
// Module Name: tb_PS2Receiver
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


  module tb_PS2Receiver();
    reg CLK100MHZ;
    reg PS2_CLK;
    reg PS2_DATA;
    //wire [15:0]keycodeout;
    //reg CLK50MHZ=0;    
    wire [31:0]keycode;

PS2Receiver DUT(.clk(CLK100MHZ), .kclk(PS2_CLK), .kdata(PS2_DATA),.keycodeout(keycode));
initial CLK100MHZ=0;
initial PS2_CLK=0;
always begin 
#5
CLK100MHZ=~CLK100MHZ;
end 
always begin 
#25
PS2_CLK=~PS2_CLK;
end 

initial begin
      PS2_DATA=0;   
      #25
      PS2_DATA=1;
      #25
      PS2_DATA=0;
      #25
      PS2_DATA=1;
      #25
      PS2_DATA=1;
      #25
      PS2_DATA=1;
      #25
      PS2_DATA=1;
      #25
      PS2_DATA=1;
      #25
      PS2_DATA=0;
      #25
      PS2_DATA=1;
      #25
      PS2_DATA=0;
      #25
      PS2_DATA=0;
      #25
      PS2_DATA=1;
      #25
      PS2_DATA=0;
      #25
      PS2_DATA=1;
      #25
      PS2_DATA=0;
      #25
      PS2_DATA=0;
      #25
      PS2_DATA=1;
      #25
      PS2_DATA=0;
      PS2_DATA=0;   
      #25
      PS2_DATA=1;
      #25
      PS2_DATA=0;
      #25
      PS2_DATA=1;
      #25
      PS2_DATA=1;
      #25
      PS2_DATA=1;
      #25
      PS2_DATA=1;
      #25
      PS2_DATA=1;
      #25
      PS2_DATA=0;
      #25
      PS2_DATA=1;
      #25
      PS2_DATA=0;
      #25
      PS2_DATA=0;
      #25
      PS2_DATA=1;
      #25
      PS2_DATA=0;
      #25
      PS2_DATA=1;
      #25
      PS2_DATA=0;
      #25
      PS2_DATA=0;
      #25
      PS2_DATA=1;
      #25
      PS2_DATA=0;
      
      
    end
    

endmodule
