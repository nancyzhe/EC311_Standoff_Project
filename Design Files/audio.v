`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2020 10:43:19 PM
// Design Name: 
// Module Name: tune
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


module audio(clk, speaker_out, p1lives);
input clk;
input [1:0] p1lives;
output reg speaker_out;
// first create a 17 bit binary counter
reg [16:0] counter;

reg [23:0] tone;
reg clkdivide = 0;

always@ (posedge clk) 
begin
tone <= tone + 1;   //use tone to generate square wave
                    //the MSB, tone[23], toggles with frequency 6Hz
                    //100,000,000:2^(24)=5.94
clkdivide = 100000000/440/2;
                    //divide clk by 2 to make sure 50% duty cycle
                    //MSB is now low for ~50% of time
end

always @(posedge clk) 
    if(counter==0) 
        counter <= (tone[23] ? clkdivide - 1 : clkdivide/2 - 1); 
                    //using tone[23] to switch between
                    //clkdivide-1 and clkdivide/2-1 frequencies
                    //if tone[23]=0, then counter = clkdivide-1
    else
        counter <= counter - 1;

reg speaker_out_temp;
always @(posedge clk) 
begin
    if(counter==0) speaker_out_temp <= ~speaker_out_temp;
                    //make square wave
    if(p1lives == 2'd0)
        speaker_out <= speaker_out_temp;
end

endmodule
