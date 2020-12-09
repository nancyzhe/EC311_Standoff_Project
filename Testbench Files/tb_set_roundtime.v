`timescale 1ns / 1ps


module tb_set_roundtime;

reg clk,pause,normal,demo,simulation;
wire roundtime;

set_roundtime DUT(clk,pause,normal,demo,simulation,roundtime);

initial begin
clk = 0;
pause=1;
simulation=1;
normal=0;
demo=0;
#40 pause=0;
#400 pause=1;


#40 $finish;
end

always #1 clk= !clk;

endmodule
