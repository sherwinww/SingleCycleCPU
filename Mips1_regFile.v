//module regFile(                                             //å¯å­å¨æºç 
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
 //   reg [31:0] regs [1:31];                                  //å®ä¹31ä¸2ä½å¯å­å¨,ç±äº$0=0,æåªå®ä¹31ä¸
 //   assign RsData=(RsAddr== 5'b0)?32'b0:regs[RsAddr];       
 //   assign RtData=(RtAddr== 5'b0)?32'b0:regs[RtAddr];       //å¨ææè¾å¥æ¶å°rsãrtè¾å¥å¼èµå¼å°è¾åºç«
 //   integer i; 
 //       always @ ( posedge clk or posedge reset)
 //           if(reset)
 //               for(i=1;i<32;i=i+1)
 //                   regs[i]<=0;                             //æ¸é¶
 //           else if(regwr)
//                regs[WriteAddr]<=WriteData;                 //åä¿¡å·æææ¶è¿è¡åå¯å­å¨æä½
//endmodule

// ä¸æ¹æ¯å¦ä¸ç§åè½ç¸åçä»£ç 
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