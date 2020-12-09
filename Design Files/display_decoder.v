`timescale 1ns / 1ps


module display_decoder(
    input [3:0] p_vchoice,
    output reg [3:0] p_dchoice
    );
    
    always@(*)begin
    case(p_vchoice)
    4'b0001: p_dchoice<=4'd11;//duck
    4'b0010: p_dchoice<=4'd12;//reload
    4'b0100: p_dchoice<=4'd13;//shoot
    4'b1000: p_dchoice<=4'd10;//idle
    endcase 
    end
endmodule
