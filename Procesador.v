`timescale 1ns / 1ps
//Verificar señales de control
module Procesador(
	input clk
   );
	
	reg [63:0] pc1;		
	initial 
		pc1 = 64'b0;
	
	//Conexiones señales de control
	wire c_pcsrc;
	wire c_reg2loc;
	wire c_regwr;
	wire [1:0] c_seu;
	wire [1:0] c_alusrc;
	wire [2:0] c_aluop;
	wire c_memrd;
	wire c_memwr;
	wire c_zero;
	wire c_memtoreg;

	//Conexiones internas
	wire [63:0] c_outdm;
	wire [63:0] c_outalu;
	wire [63:0] c_outsumador2;
	wire [63:0] c_outmux3;
	wire [63:0] c_outseu;
	wire [63:0] c_outrn_rf;
	wire [63:0] c_outrm_rf;
	wire [63:0] c_outmux4;
	wire [4:0]  c_outmux1;
	wire [31:0] c_inst;
	wire [63:0] c_nextpc;
	wire [63:0] c_nextpcsin;
	wire [63:0] c_nextpccon;
	wire [63:0] c_currpc;
	
	always@(posedge clk) //Def salto de la seu
		if(c_pcsrc)
			pc1 <= pc1 + c_outseu;
		else pc1 <= pc1 + 3'b100;
	

	/*Sumador1 s1(
	.curr_pc(pc1),
	.next_pc(c_nextpcsin)
	);*/
	
	/*Mux2 m2( 
	.pc_sinsalto(c_nextpcsin),
	.pc_consalto(c_outsumador2),
	.pcsrc(c_pcsrc),
	.nextpc(pc1)
	);*/
	//Instanciar cada cable con la entrada de los modulos
	IM im(
	.pc(pc1[10:2]),
	.inst(c_inst)
	);
	
	CU cu(
	.inst(c_inst[31:21]),
	.zero(c_zero),
	.reg2loc(c_reg2loc),
	.pcsrc(c_pcsrc),
	.seu(c_seu),
	.regwr(c_regwr),
	.alusrc(c_alusrc),
	.aluop(c_aluop),
	.memtoreg(c_memtoreg), 
	.memrd(c_memrd),
	.memwr(c_memwr)
	);

	Mux1 m1(
	.rm(c_inst[20:16]),
	.rt(c_inst[4:0]),
	.reg2loc(c_reg2loc),
	.out_mux1(c_outmux1)
	);
	
	RegisterFile rf(
	.rn(c_inst[9:5]),
	.rm(c_outmux1),
	.rd(c_inst[4:0]),
	.datawr(c_outmux4),
	.regwr(c_regwr),
	.o_rn(c_outrn_rf),
	.o_rm(c_outrm_rf),
	.clk(clk)
	);
	
	SEU seu(
	.inst(c_inst[25:0]),
	.seu(c_seu),
	.out_seu(c_outseu)
	);
	
	Sumador2 s2(
	.nextpc_sin(pc1),
	.out_seu(c_outseu),
	.next_pc2(c_outsumador2) 
	);
	
	Mux3 m3(
	.src1(c_outrm_rf),
	.src2(c_outseu),
	.src3(c_inst[20:16]),
	.alusrc(c_alusrc),
	.src(c_outmux3)
	);
	
	ALU alu(
	.op_A(c_outrn_rf),
	.op_B(c_outmux3),
	.aluop(c_aluop),
	.zero(c_zero),
	.ALU_Result(c_outalu)
	);
	
	DM dm(
	.memrd(c_memrd),
	.memwr(c_memwr),
	.address(c_outalu),
	.datawrite(c_outrm_rf),
	.dataread(c_outdm)
	);
	
	Mux4 m4(
	.out_dm(c_outdm),
	.out_alu(c_outalu),
	.memtoreg(c_memtoreg),
	.out_mux4(c_outmux4)
	);
endmodule 
