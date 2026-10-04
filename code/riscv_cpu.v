
// riscv_cpu.v - single-cycle RISC-V CPU Processor

module riscv_cpu (
    input         clk, reset,
    output [31:0] PC,
    input  [31:0] Instr,
    output        MemWrite,
    output [31:0] Mem_WrAddr, Mem_WrData,
    input  [31:0] ReadData,
    output [31:0] Result
);

wire        ALUSrc, RegWrite, Jump, Zero,lt,ltu;
wire [1:0]  ResultSrc, ImmSrc;
wire [3:0]  ALUControl;

//instruction bits matching 
wire [6:0]  op       = Instr[6:0];
wire [2:0]  funct3   = Instr[14:12];
wire        funct7b5 = Instr[30];

controller c (
    .op(op),
    .funct3(funct3),
    .funct7b5(funct7b5),
    .Zero(Zero),
    .lt(lt),               // Crucial for blt
    .ltu(ltu),             // Crucial for bltu, bgeu
    .ResultSrc(ResultSrc),
    .MemWrite(MemWrite),
    .PCSrc(PCSrc),
    .ALUSrc(ALUSrc),
    .RegWrite(RegWrite),
    .Jump(Jump),
    .Jalr(Jalr),
    .ImmSrc(ImmSrc),
    .ALUControl(ALUControl)
);

datapath    dp  (clk, reset, ResultSrc, PCSrc,
                ALUSrc, RegWrite, ImmSrc, ALUControl,Jalr,
                Zero,lt,ltu, PC, Instr, Mem_WrAddr, Mem_WrData, ReadData, Result);

endmodule

