`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/25 09:22:38
// Design Name: 
// Module Name: alu
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


module alu(
    input [3:0] A,
    input [3:0] B,
    input [3:0] aluop,
    output logic [7:0] alures,
    output logic ZF,
    output logic OF
    );
    logic Cout;
    logic [3:0] S;
    logic [3:0] Cin; 
    
    assign Cin=aluop[2]==0 ? 4'b0000 : 4'b1111;
    
    rca ADD(
        .A      (A),
        .B      ((~B&Cin)|(B&(~Cin))),
        .Cin    (Cin[0]),
        .S      (S),
        .Cout   (Cout)
    ); 
       
    always_comb  begin
        case(aluop)
            4'b0000:begin 
                alures[3:0]=A&B;   
                alures[7:4]=4'b0000;
                OF=0;
                ZF=!alures;
            end
            4'b0001:begin 
                alures[3:0]=A|B;   
                alures[7:4]=4'b0000;
                OF=0;
                ZF=!alures;
            end
            4'b0010:begin 
                alures[3:0]=A^B;   
                alures[7:4]=4'b0000;    
                OF=0;
                ZF=!alures;
            end
            4'b0011:begin 
                alures[3:0]=~(A&B);
                alures[7:4]=4'b0000;
                OF=0;
                ZF=!alures;
            end
            4'b0100:begin 
                alures[3:0]=~A;    
                alures[7:4]=4'b0000;
                OF=0;
                ZF=!alures;
            end
            4'b0101:begin 
                alures[3:0]=A<<B[2:0];  
                alures[7:4]=4'b0000;
                OF=0;
                ZF=!alures;
            end
            4'b0110:begin 
                alures[3:0]=A>>B[2:0];  
                alures[7:4]=4'b0000;
                OF=0;
                ZF=!alures;
            end
            4'b0111:begin 
                alures[3:0]=$signed(A)>>>B[2:0]; 
                alures[7:4]=4'b0000;
                OF=0;
                ZF=!alures;
            end
            4'b1000:begin 
                alures[7:0]=A*B;
                OF=0;
                ZF=!alures;
            end
            4'b1001:begin 
                alures[7:0]={{4{A[3]}},A}*{{4{B[3]}},B};    
                OF=0;
                ZF=!alures; 
            end 
            4'b1010:begin 
                if((A[3]==B[3])&&(A[3]!=S[3])) begin 
                    alures[3:0]=S;
                    alures[7:4]=4'b0000;
                    OF=1;
                    ZF=!alures;
                end
                else begin 
                    alures[3:0]=S;
                    alures[7:4]=4'b0000; 
                    OF=0;
                    ZF=!alures; 
                end
            end
            4'b1011:begin 
                alures[3:0]=S;  
                alures[7:4]=4'b0000;
                OF=0;
                ZF=!alures; 
            end  
            4'b1100:begin 
                if((A[3]!=B[3])&&(S[3]!=A[3]))begin 
                    alures[3:0]=S[3:0];
                    alures[7:4]=4'b0000; 
                    OF=1;
                    ZF=!alures;
                end 
                else begin  
                    alures[3:0]=S[3:0];
                    alures[7:4]=4'b0000; 
                    OF=0;
                    ZF=!alures;
                end
            end
            4'b1101:begin 
                alures[3:0]=S;      
                alures[7:4]=4'b0000; 
                OF=0;
                ZF=!alures;
            end
            4'b1110:begin 
                alures[0]=$signed(A)<$signed(B) ? 1:0;
                alures[7:1]=7'b0000000; 
                OF=0;
                ZF=!alures;
            end
            4'b1111:begin 
                alures[0]=A<B ? 1:0;                  
                alures[7:1]=7'b0000000; 
                OF=0;
                ZF=!alures;
            end
        endcase
    end
endmodule
