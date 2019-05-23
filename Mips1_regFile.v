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