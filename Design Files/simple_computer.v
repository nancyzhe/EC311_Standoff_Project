`timescale 1ns / 1ps



module simple_computer(
    input clk,
    input load,
    input reset,
    input [1:0] p1_bullet,comp_bullet,
    output reg [2:0] choice
    );
    
    reg [2:0] available = 3'b111; 
    
    //eliminate invalid choices based on computer bullet count
    always@(posedge clk)begin
    if(comp_bullet==2'd0) available<=3'b011; 
    else begin
        if(comp_bullet==2'd3) available<=3'b101;
        else available<=3'b111;
    end    
   
    end 
    
    reg [2:0] good_choice = 3'b111;
    //eliminate bad choices based on p1 bullet count
    always@(posedge clk)begin
    if(p1_bullet==2'd0) good_choice<=3'b110;
    else begin
        if(p1_bullet==2'd3) good_choice<=3'b101;
        else good_choice<=3'b111;
    end
    
    end
    
    //generate random numbers
    reg [3:0] seed=4'b1010;
    wire [3:0] number;
    
    random_number rand(clk,load,reset,seed,number);
    
    //make a choice
    always@(p1_bullet,comp_bullet,available)begin
    case(available)
    3'b011: begin
            case(good_choice)
            3'b110: choice<=3'b010;
            3'b101: choice<=3'b001;
            3'b111: begin
                    if(number<7) choice<=3'b010;
                    else choice<=3'b001;
                    end
            endcase
            end
    3'b101: begin
            case(good_choice)
            3'b110: choice<=3'b100;
            3'b101: begin
                    if(number<7)choice<=3'b100;
                    else choice<=3'b001;
                    end
            3'b111: begin
                    if(number<7) choice<=3'b100;
                    else choice<=3'b001;
                    end
            endcase
            end
    3'b111: begin
            case(good_choice)
            3'b110: begin
                    if(number<7) choice<=3'b100;
                    else choice<=3'b010;
                    end
            3'b101: begin
                    if(number<7)choice<=3'b100;
                    else choice<=3'b001;
                    end
            3'b111: begin
                    if(number<6) choice<=3'b100;
                    else begin 
                         if(number<12)choice<=3'b010;
                         else choice<=3'b001;
                         end   
                    end
            endcase
            end
    endcase
    
    end
    
endmodule
