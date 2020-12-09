`timescale 1ns / 1ps



module set_roundtime(
    input clk,
    input pause,
    input normal,demo,simulation,
    output roundtime,
    output reg [6:0] count
    );
    
reg [30:0] max_counter = 30'd700000000;
 //set value of max_counter 
always@(posedge clk)begin
if(demo) max_counter<=30'd350000000;//7 sec interval
else begin 
if (normal) max_counter<=30'd150000000;//3 sec interval
else if (simulation) max_counter<=30'd10;//<<1 sec interval
end
end

//count based on the value of max_counter
reg [29:0] counter=0;  
reg slowclock=0;     
always@(posedge clk)begin
if(pause==0)begin
    if (counter==max_counter) begin
    slowclock=~slowclock;
    counter<=0;
    end
    else counter<=counter+29'd1;
end 
end

//set value of max_countdown based on the inputs
reg [2:0] max_countdown = 3'd7;
always@(posedge clk)
begin
 if(normal)
    max_countdown = 3'd3; //
 else if(demo)
    max_countdown = 3'd7;
end

reg sec_clock=0;//1Hz frequency
reg [29:0] onesec=0;
always@(posedge clk)begin
if (onesec==30'd50000000) begin
    sec_clock=~sec_clock;
    onesec<=0;
    end
    else onesec<=onesec+29'd1;
end

//increase countdown until max_countdown reached
reg [2:0] countdown = 0;
always@(posedge sec_clock)
begin
    if(countdown == max_countdown)
        countdown <= 0;
    else
        countdown <= countdown + 1;
end

//assign LEDs to the values of countdown
always@(posedge clk)begin
case(countdown)
3'd0: count<=7'b0000000;
3'd1: count<=7'b1000000;
3'd2: count<=7'b1100000;
3'd3: count<=7'b1110000;
3'd4: count<=7'b1111000;
3'd5: count<=7'b1111100;
3'd6: count<=7'b1111110;
3'd7: count<=7'b1111111;
endcase
end

assign roundtime=slowclock;   
    
endmodule
