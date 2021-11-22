transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto {C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto/RAM.v}
vlog -vlog01compat -work work +incdir+C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto {C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto/romtest.v}
vlog -sv -work work +incdir+C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto {C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto/Extend.sv}
vlog -sv -work work +incdir+C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto {C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto/Demux_1_to_16.sv}
vlog -sv -work work +incdir+C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto {C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto/Register.sv}
vlog -sv -work work +incdir+C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto {C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto/Mux_2_to_1.sv}
vlog -sv -work work +incdir+C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto {C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto/Mux_16_to_1.sv}
vlog -sv -work work +incdir+C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto {C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto/PC.sv}
vlog -sv -work work +incdir+C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto {C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto/Plus4.sv}
vlog -sv -work work +incdir+C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto {C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto/RegisterFile.sv}
vlog -sv -work work +incdir+C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto {C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto/ALU.sv}
vlog -sv -work work +incdir+C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto {C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto/MainDecoder.sv}
vlog -sv -work work +incdir+C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto {C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto/PC_Logic.sv}
vlog -sv -work work +incdir+C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto {C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto/ALUDecoder.sv}
vlog -sv -work work +incdir+C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto {C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto/ConditionalLogic.sv}
vlog -sv -work work +incdir+C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto {C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto/Decoder.sv}
vlog -sv -work work +incdir+C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto {C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto/ControlUnit.sv}
vlog -sv -work work +incdir+C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto {C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto/ALUControlDeco.sv}
vlog -sv -work work +incdir+C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto {C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto/DataPath.sv}
vlog -sv -work work +incdir+C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto {C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto/CPU.sv}
vlog -sv -work work +incdir+C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto {C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto/Processor.sv}
vlog -sv -work work +incdir+C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto {C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto/writeMem.sv}
vlog -sv -work work +incdir+C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto {C:/Users/samas/Documents/GitHub/Proyecto-Taller-Diseno-Digital/Proyecto/processor_tb.sv}

