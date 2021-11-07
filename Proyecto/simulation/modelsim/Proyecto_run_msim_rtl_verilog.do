transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto {C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto/Register.sv}
vlog -sv -work work +incdir+C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto {C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto/MainDecoder.sv}
vlog -sv -work work +incdir+C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto {C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto/PC_Logic.sv}
vlog -sv -work work +incdir+C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto {C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto/ALUDecoder.sv}
vlog -sv -work work +incdir+C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto {C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto/ConditionalLogic.sv}
vlog -sv -work work +incdir+C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto {C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto/Decoder.sv}
vlog -sv -work work +incdir+C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto {C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto/ControlUnit.sv}
vlog -sv -work work +incdir+C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto {C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto/ControlUnit_tb.sv}

