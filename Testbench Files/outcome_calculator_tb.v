`timescale 1ns / 1ps

module outcome_calculator_tb;

reg clk;
reg [3:0] p1_choice,p2_choice;
wire p1shot, p2shot;
//wire p1L,p2L;

outcome_calc test(.clk(clk),.p1_choice(p1_choice),.p2_choice(p2_choice), .p1shot(p1shot), .p2shot(p2shot));

initial begin
clk=0;
    p1_choice=4'b0001;p2_choice=4'b0001;
#10 p1_choice=4'b0001;p2_choice=4'b0010;
#10 p1_choice=4'b0001;p2_choice=4'b0100;
#10 p1_choice=4'b0001;p2_choice=4'b1000;
#10 p1_choice=4'b0010;p2_choice=4'b0001;
#10 p1_choice=4'b0010;p2_choice=4'b0010;
#10 p1_choice=4'b0010;p2_choice=4'b0100;
#10 p1_choice=4'b0010;p2_choice=4'b1000;
#10 p1_choice=4'b0100;p2_choice=4'b0001;
#10 p1_choice=4'b0100;p2_choice=4'b0010;
#10 p1_choice=4'b0100;p2_choice=4'b0100;
#10 p1_choice=4'b0100;p2_choice=4'b1000;
#10 p1_choice=4'b1000;p2_choice=4'b0001;
#10 p1_choice=4'b1000;p2_choice=4'b0010;
#10 p1_choice=4'b1000;p2_choice=4'b0100;
#10 p1_choice=4'b1000;p2_choice=4'b1000;
#10 $finish;
end  

always #1 clk= !clk;

endmodule
