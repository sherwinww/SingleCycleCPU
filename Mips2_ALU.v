module ALU(                                             //ALU
    input [31:0] input1, 
    input [31:0] input2, 
    input [3:0] ALUCtr, 
    output [31:0] ALURes, 
    output zero 
    );
    reg [31:0] ALURes;
    reg zero; 
    always @ (input1 or input2 or ALUCtr) 
        begin
            case(ALUCtr) 
            4'b0000:    //and
                ALURes = input1&input2;    
            4'b0001:    //or
                ALURes = input1|input2;
            4'b0010:    //add
                ALURes = input1+input2;
            4'b0110:    //sub
                begin
                    ALURes=input1-input2; 
                    if(ALURes==0) 
                        zero=1;
                    else zero=0; 
                end
            4'b0111: 	//小于设置
                begin 
                    if(input1<input2) ALURes=1;
                end
            default: 
                ALURes=0;
            endcase 
        end 
endmodule