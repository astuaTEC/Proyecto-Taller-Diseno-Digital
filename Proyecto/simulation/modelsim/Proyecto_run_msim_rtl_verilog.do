transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto {C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto/ALU.sv}
vlog -sv -work work +incdir+C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto {C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto/Alu_tb.sv}

