//module regFile(                                             //寄存器源�
 //   input clk,
//    input reset,
  //  input regwr,
  //  input [4:0] RsAddr,
 //   input [4:0] RtAddr,
 //   input [4:0] WriteAddr,
 //   input [31:0] WriteData,
 //   output [31:0] RsData,
 //   output [31:0] RtData
 //   );
 //   reg [31:0] regs [1:31];                                  //定义31�2位寄存器,由于$0=0,故只定义31�
 //   assign RsData=(RsAddr== 5'b0)?32'b0:regs[RsAddr];       
 //   assign RtData=(RtAddr== 5'b0)?32'b0:regs[RtAddr];       //在有效输入时将rs、rt输入值赋值到输出�
 //   integer i; 
 //       always @ ( posedge clk or posedge reset)
 //           if(reset)
 //               for(i=1;i<32;i=i+1)
 //                   regs[i]<=0;                             //清零
 //           else if(regwr)
//                regs[WriteAddr]<=WriteData;                 //写信号有效时进行写寄存器操作
//endmodule

// 下方是另一种功能相同的代码
  module regFile(
   input clk,
   input reset,
   input regwr,
   input [4:0] RsAddr,
   input [4:0] RtAddr,
   input [4:0] WriteAddr,
   output [31:0] RsData,
   output [31:0] RtData,
   input [31:0] WriteData
   );
  reg[31:0] regs[0:31];
  assign RsData=(RsAddr == 5'b0)?32'b0:regs[RsAddr];
  assign RtData=(RtAddr == 5'b0)?32'b0:regs[RtAddr];
  integer i;
   always @ (posedge clk)
       begin
           if(!reset)
               begin
                   if(regwr==1)
                       begin
                           regs[WriteAddr]=WriteData;
                       end
               end
           else
               begin
                   for(i=0;i<32;i=i+1)
                       regs[i]=0;
               end
       end
  endmodule