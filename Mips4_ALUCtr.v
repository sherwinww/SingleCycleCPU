module ALUCtr( 
    input [1:0] ALUOp, 
    input [5:0] funct, 
    output [3:0] ALUCtr
    );
    reg[3:0] ALUCtr; 
    always @ (ALUOp or funct) 
        casex({ALUOp,funct}) 
            8'b00xx_xxxx: ALUCtr=4'b0010; 
            8'b01xx_xxxx: ALUCtr=4'b0110; 
            8'b1xxx_0000: ALUCtr=4'b0010; 
            8'b1xxx_0010: ALUCtr=4'b0110; 
            8'b1xxx_0100: ALUCtr=4'b0000; 
            8'b1xxx_0101: ALUCtr=4'b0001; 
            8'b1xxx_1010: ALUCtr=4'b0111;
            8'b00xx_xxxx: ALUCtr=4'b0010; 
        endcase 
endmodule