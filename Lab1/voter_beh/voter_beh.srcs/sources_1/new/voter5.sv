`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/14 22:38:17
// Design Name: 
// Module Name: voter5
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


module voter5(
    input [4:0] I,
    output logic pass
    );
    
    int counter = 0;
    always_comb  begin
        for( int i = 0; i < 5 ;i= i+1)begin
             if ( I[i] == 1'b1)begin
                 counter = counter + 1;
             end
        end      
        if (counter>=3)begin pass = 1'b1 ;end 
        else begin pass = 1'b0 ;end          
        counter = 0;
     end
endmodule
