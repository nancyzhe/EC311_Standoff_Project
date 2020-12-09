`timescale 1ns / 1ps

module display_bulletcount(
    input [1:0] p_bullet, //bullet count in binary
    output reg [2:0] LEDcount //bullet count in one hot encoding
    );
    
always@(*)begin
case(p_bullet)
2'd0: LEDcount<=3'b000;
2'd1: LEDcount<=3'b001;
2'd2: LEDcount<=3'b011;
2'd3: LEDcount<=3'b111;
endcase
end
endmodule
