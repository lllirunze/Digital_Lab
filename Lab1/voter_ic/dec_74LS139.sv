`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/14 22:28:19
// Design Name: 
// Module Name: dec_74LS139
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dec_74LS139(
    input  [1:0] D,
    logic  s,
    output logic [3:0] Y
    );
    
    always_comb begin
        if( s == 1'b0)begin
            case(D)
                2'b00 :  Y = 4'b1110 ;
                2'b01 :  Y = 4'b1101 ;
                2'b10 :  Y = 4'b1011 ;
                2'b11 :  Y = 4'b0111 ;            
            endcase
        end
        else  begin  Y = 4'b1111 ; end
    end
endmodule
