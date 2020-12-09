`timescale 1ns / 1ps


module outcome_calc(
    input clk,
    input [3:0] p1_choice,p2_choice,
    output reg p1shot,p2shot
    );
    
always@(posedge clk)
begin
    if(p1_choice == 4'b0100 && p2_choice == 4'b0100)
        begin
            p1shot <= 0;
            p2shot <= 0;
        end
    
    else 
    begin
        if(p1_choice == 4'b0100)begin
            if((p2_choice == 4'b1000) || (p2_choice == 4'b0010))
                p2shot <= 1;
            else begin
                    p1shot <= 0;
                    p2shot <= 0;
                 end
        end        
        else 
        begin
            if(p2_choice == 4'b0100)begin
                if((p1_choice == 4'b1000) || (p1_choice == 4'b0010))
                    p1shot <= 1;
                else begin
                    p1shot <= 0;
                    p2shot <= 0;
                 end
            end
    
            else begin
                    p1shot <= 0;
                    p2shot <= 0;
                 end
        end
     end    
end 
endmodule
