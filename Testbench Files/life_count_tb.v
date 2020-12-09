`timescale 1ns / 1ps

module life_count_tb(
    );
    
reg shot;
reg roundtime=0;
wire [1:0]numLives;

life_count test(shot,roundtime,numLives);

initial begin
shot=0;
#7 shot=1;
#3 shot=0;
#4 shot=1;
#13 shot=0;
#24 shot=1;
#13 shot=0;
#60 $finish;
end

always #5 roundtime<=!roundtime;

endmodule
