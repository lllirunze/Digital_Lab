`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/25 22:36:49
// Design Name: 
// Module Name: ALU_4bits_tb
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


module ALU_4bits_tb();
    logic[3:0] A;
    logic[3:0] B;
    logic[3:0] aluop;
    logic[7:0] alures;
    logic ZF;
    logic OF;
    logic [7:0] alures_yex;
    logic ZF_yex;
    logic OF_yex;
    logic [21:0] stim[3856:0];
    
    int i ;
    
    alu ALU(
        .A(A),
        .B(B),
        .aluop(aluop),
        .alures(alures),
        .ZF(ZF),
        .OF(OF)
    );
       
    initial begin
        //A = 4'b0100;
        //B = 4'b1101;
        //for(i=0; i<16; i=i+1) begin
        //    aluop = i;
        //    #20;
        //end
        
        $readmemb("testcase.txt",stim);
        for(i=0;i<3856;i=i+1) begin
            {A,B,aluop,alures_yex,ZF_yex,OF_yex}=stim[i];
            #10;
            if(alures==alures_yex && ZF==ZF_yex && OF==OF_yex)
                $display($time,"test pass!");
            else
                $display($time,"Error:A=%b£¬B=%b,aluop=%b,alures=%b,ZF=%b,OF=%b,alures_yex=%b,ZF_yex=%b,OF_yex=%b",A,B,aluop,alures,ZF,OF,alures_yex,ZF_yex,OF_yex);
        end
    end

endmodule
