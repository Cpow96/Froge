transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlib lab8_soc
vmap lab8_soc lab8_soc
vlog -vlog01compat -work lab8_soc +incdir+D:/altera/ece385/final_project/lab8_soc/synthesis/submodules {D:/altera/ece385/final_project/lab8_soc/synthesis/submodules/lab8_soc_Keycode.v}
vlog -sv -work work +incdir+D:/altera/ece385/final_project {D:/altera/ece385/final_project/map_ROM.sv}

