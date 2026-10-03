transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/joecrispin1587/riscv-single-cycle-cpu/code {/home/joecrispin1587/riscv-single-cycle-cpu/code/t1_riscv_cpu.v}
vlog -vlog01compat -work work +incdir+/home/joecrispin1587/riscv-single-cycle-cpu/code {/home/joecrispin1587/riscv-single-cycle-cpu/code/riscv_cpu.v}
vlog -vlog01compat -work work +incdir+/home/joecrispin1587/riscv-single-cycle-cpu/code {/home/joecrispin1587/riscv-single-cycle-cpu/code/data_mem.v}
vlog -vlog01compat -work work +incdir+/home/joecrispin1587/riscv-single-cycle-cpu/code/components {/home/joecrispin1587/riscv-single-cycle-cpu/code/components/reset_ff.v}
vlog -vlog01compat -work work +incdir+/home/joecrispin1587/riscv-single-cycle-cpu/code/components {/home/joecrispin1587/riscv-single-cycle-cpu/code/components/reg_file.v}
vlog -vlog01compat -work work +incdir+/home/joecrispin1587/riscv-single-cycle-cpu/code/components {/home/joecrispin1587/riscv-single-cycle-cpu/code/components/mux4.v}
vlog -vlog01compat -work work +incdir+/home/joecrispin1587/riscv-single-cycle-cpu/code/components {/home/joecrispin1587/riscv-single-cycle-cpu/code/components/mux2.v}
vlog -vlog01compat -work work +incdir+/home/joecrispin1587/riscv-single-cycle-cpu/code/components {/home/joecrispin1587/riscv-single-cycle-cpu/code/components/main_decoder.v}
vlog -vlog01compat -work work +incdir+/home/joecrispin1587/riscv-single-cycle-cpu/code/components {/home/joecrispin1587/riscv-single-cycle-cpu/code/components/imm_extend.v}
vlog -vlog01compat -work work +incdir+/home/joecrispin1587/riscv-single-cycle-cpu/code/components {/home/joecrispin1587/riscv-single-cycle-cpu/code/components/datapath.v}
vlog -vlog01compat -work work +incdir+/home/joecrispin1587/riscv-single-cycle-cpu/code/components {/home/joecrispin1587/riscv-single-cycle-cpu/code/components/controller.v}
vlog -vlog01compat -work work +incdir+/home/joecrispin1587/riscv-single-cycle-cpu/code/components {/home/joecrispin1587/riscv-single-cycle-cpu/code/components/alu_decoder.v}
vlog -vlog01compat -work work +incdir+/home/joecrispin1587/riscv-single-cycle-cpu/code/components {/home/joecrispin1587/riscv-single-cycle-cpu/code/components/alu.v}
vlog -vlog01compat -work work +incdir+/home/joecrispin1587/riscv-single-cycle-cpu/code/components {/home/joecrispin1587/riscv-single-cycle-cpu/code/components/adder.v}
vlog -vlog01compat -work work +incdir+/home/joecrispin1587/riscv-single-cycle-cpu/code {/home/joecrispin1587/riscv-single-cycle-cpu/code/instr_mem.v}

vlog -vlog01compat -work work +incdir+/home/joecrispin1587/riscv-single-cycle-cpu/.test {/home/joecrispin1587/riscv-single-cycle-cpu/.test/tb_1b.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb_1b

add wave *
view structure
view signals
run -all
