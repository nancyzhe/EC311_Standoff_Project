`timescale 1ns / 1ps

module life_count(
    input shot,
    input roundtime,
    output reg [1:0]numLives
    );
    
    //i.e. 00 didn't lose life; 01 lost a life;
    
    reg numLives=2'd3;
    
    always@(posedge roundtime) begin
    if (shot == 0) begin                //life count stays the same
        numLives <= numLives;
        end
    else if (shot == 1) begin           //p1 lose a life, p2 lives unchanged
        numLives <= numLives-1;
        end
    end

endmodule

