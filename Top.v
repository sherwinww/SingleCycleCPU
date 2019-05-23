module top( 
    input clkin, 
    input reset 
    );
//wire for controller 
wire reg_dst,jmp,branch,memread,memwrite,memtoreg; 
wire[1:0] aluop; 
wire alu_src,regwrite;

reg[31:0] pc,add4; 
wire choose4; 
wire[31:0] expand2,mux2,mux3,mux4,mux5,address,jmpaddr,inst;
wire[4:0] mux1;

//wire for alu
wire zero;
wire[31:0] aluRes;

//wire for aluctr
wire[3:0] aluCtr;

//wire for memory
wire[31:0] memreaddata;

//wire for register
wire[31:0] RsData,RtData;

//wirefornext
wire[31:0] expand;

always @(negedge clkin)
    begin
        if(!reset) 
        begin
            pc=mux5;
            add4=pc+4;
        end
        else
        begin
            pc=31'b0;
            add4=32'h4;
        end
    end


instructionROM instrROM( 
    .a(pc[8:2]), 
    .clk(clkin), 
    .spo(inst) 
    );

dataRAM dRAM(
     .a(aluRes[7:2]), 
     .d(RtData), 
     .clk(!clkin), 
     .we(memwrite), 
     .spo(memreaddata) 
     );

mainCtr mainctr(
.opCode(inst[31:26]),
.regDst(reg_dst),
.J(jmp),
.B(branch),
.M2R(memtoreg),
.ALUSrc(alu_src),
.regWr(regwrite),
.memWr(memwrite),
.memRe(memread),
.ALUop(aluop));

ALU alu(
.input1(RsData),
.input2(mux2),
.ALUCtr(aluCtr),
.ALURes(aluRes),
.zero(zero));

ALUCtr aluctr( .ALUOp(aluop), .funct(inst[5:0]), .ALUCtr(aluCtr));

regFile regfile( 
    .clk(!clkin), 
    .reset(reset), 
    .regwr(regwrite), 
    .RsAddr(inst[25:21]), 
    .RtAddr(inst[20:16]), 
    .WriteAddr(mux1), 
    .WriteData(mux3), 
    .RsData(RsData), 
    .RtData(RtData) 
    );

signext signext(.inst(inst[15:0]), .data(expand));

assign mux1=reg_dst?inst[15:11]:inst[20:16]; 
assign mux2=alu_src?expand:RtData; 
assign mux3=memtoreg?memreaddata:aluRes; 
assign mux4=choose4?address:add4; 
assign mux5=jmp?jmpaddr:mux4; 
assign choose4=branch&zero; 
assign expand2=expand<<2; 
assign jmpaddr={add4[31:28],inst[25:0],2'b00}; 
assign address=pc+expand2;

endmodule