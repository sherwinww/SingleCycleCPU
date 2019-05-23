module mainCtr(                 //主控制器源码
    input [5:0] opCode, 
    output regDst, 
    output J,
    output B, 
    output M2R, 
    output ALUSrc, 
    output regWr, 
    output memWr, 
    output memRe, 
    output [1:0] ALUop
    );
    reg [9:0] temp;
    assign regDst=temp[9];
    assign J=temp[8];
    assign B=temp[7];
    assign M2R=temp[6];
    assign ALUSrc=temp[5];
    assign regWr=temp[4];
    assign memWr=temp[3];
    assign memRe=temp[2];
    assign ALUop=temp[1:0];
    always @ (opCode)
        case(opCode)
            6'b000000:temp = 10'b1000_0100_10;    //R
            6'b100011:temp = 10'b0001_1101_00;    //lw
            6'b101011:temp = 10'bx00x_1010_00;    //sw
            6'b000100:temp = 10'bx01x_0000_01;    //beq
            6'b000010:temp = 10'bx10x_x000_xx;    //j
            default: temp = 10'b0000_0000_00;     
        endcase
endmodule
