`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:54:06 04/10/2019 
// Design Name: 
// Module Name:    regFile 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module regFile(                                             //�Ĵ���Դ��
    input clk,
    input reset,
    input regwr,
    input [4:0] RsAddr,
    input [4:0] RtAddr,
    input [4:0] WriteAddr,
    input [31:0] WriteData,
    output [31:0] RsData,
    output [31:0] RtData
    );
    reg [31:0] regs [1:31];                                  //����31��32λ�Ĵ���,����$0=0,��ֻ����31��
    assign RsData=(RsAddr== 5'b0)?32'b0:regs[RsAddr];       
    assign RtData=(RtAddr== 5'b0)?32'b0:regs[RtAddr];       //����Ч����ʱ��rs��rt����ֵ��ֵ�������
    integer i; 
        always @ ( posedge clk or posedge reset)
            if(reset)
                for(i=1;i<32;i=+1)
                    regs[i]<=0;                             //����
            else if(regwr)
                regs[WriteAddr]<=WriteData;                 //д�ź���Чʱ����д�Ĵ�������
endmodule