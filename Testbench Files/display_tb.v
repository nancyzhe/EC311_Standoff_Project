`timescale 1ns / 1ps

module display_tb(
    );
    
reg clk;    
reg [3:0] p1_dchoice,p2_dchoice;
reg [1:0] p1lives,p2lives;
wire [6:0] segment;
wire [7:0] AN;


display_scores test(clk,p1_dchoice,p2_dchoice,p1lives,p2lives,segment,AN);

initial begin
clk=0;
p1_dchoice=4'd12;
p2_dchoice=4'd11;
p1lives=2'd3;
p1lives=2'd3;
#10
p1_dchoice=4'd13;
p2_dchoice=4'd12;
p1lives=2'd2;
p1lives=2'd3;
#10
p1_dchoice=4'd13;
p2_dchoice=4'd12;
p1lives=2'd2;
p1lives=2'd3;
end


always #5 clk=clk; 

endmodule
