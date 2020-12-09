`timescale 1ns / 1ps

module choice_valid(
    input [1:0] count,      //input bullet count, with values from 0 to 3
    input [2:0] choice,     //input player/computer choice with one-hot encoding
    
    output reg [3:0]final_choice //uses one-hot encoding:
                            //0100 shoot
                            //0010 reload
                            //0001 duck
                            //1000 idle (nothing happens!)
    );
    
    always@(choice)
    begin
        if(count == 0 && choice == 3'b100)
            final_choice <= 4'b1000;
        else if(count == 3 && choice == 3'b010)
            final_choice <= 4'b1000;
        else
            final_choice <= choice;
    end
endmodule
