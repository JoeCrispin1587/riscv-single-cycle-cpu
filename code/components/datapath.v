
// datapath.v
module datapath (
    input         clk, reset,
    input [1:0]   ResultSrc,
    input         PCSrc, ALUSrc,
    input         RegWrite,
    input [1:0]   ImmSrc,
    input [2:0]   ALUControl,
    input         Jalr,
    output        Zero,
    output [31:0] PC,
    input  [31:0] Instr,
    output [31:0] Mem_WrAddr, Mem_WrData,
    input  [31:0] ReadData,
    output [31:0] Result
);

wire [31:0] PCNext, PCPlus4, PCTarget,lui, AuiPC,lAuiResult; //added lui, AuiPC , lAuiResult
wire [31:0] ImmExt, SrcA, SrcB, WriteData, ALUResult, PCJalr;

// next PC logic

mux2 #(32)     pcmux(PCPlus4, PCTarget, PCSrc, PCNext);
mux2 #(32)     jalrmux(PCNext, ALUResult, Jalr, PCJalr); //mux for PCNext and ALUResult

reset_ff #(32) pcreg(clk, reset, PCJalr, PC);

adder          pcadd4(PC, 32'd4, PCPlus4);
adder          pcaddbranch(PC, ImmExt, PCTarget);

// register file logic
reg_file       rf (clk, RegWrite, Instr[19:15], Instr[24:20], Instr[11:7], Result, SrcA, WriteData);
imm_extend     ext (Instr[31:7], ImmSrc, ImmExt);

// ALU logic
mux2 #(32)     srcbmux(WriteData, ImmExt, ALUSrc, SrcB);
alu            alu (SrcA, SrcB, ALUControl, ALUResult, Zero);
//mux3 #(32)     resultmux(ALUResult, ReadData, PCPlus4, ResultSrc, Result); //prev code

//lui and auipc logic
assign lui = {Instr[31:12],12'b0}; //lui instruction
adder #(32)   auipc (PC,lui , AuiPC); // auipc = pc + lui 
mux2  #(32)   lAuimux (AuiPC, lui ,Instr[5],lAuiResult); // to select between lui and auipc with sel = op[5]
mux4 #(32)    resultmux(ALUResult, ReadData, PCPlus4,lAuiResult, ResultSrc, Result); //converted mux3 to mux4 for extra input lAuiResult

assign Mem_WrData = WriteData;      
assign Mem_WrAddr = ALUResult;

endmodule

