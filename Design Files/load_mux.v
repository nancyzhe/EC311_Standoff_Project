`timescale 1ns / 1ps

module load_mux(
    input sel,a,b,
    output reg out
    );
    
    always @(*)begin
        if(sel) out=a;
        else out=b;
    end
    
endmodule
