onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /CPU/clk
add wave -noupdate /CPU/reset
add wave -noupdate /CPU/control_unit/states
add wave -noupdate -radix unsigned -childformat {{{/CPU/control_unit/counter[4]} -radix unsigned} {{/CPU/control_unit/counter[3]} -radix unsigned} {{/CPU/control_unit/counter[2]} -radix unsigned} {{/CPU/control_unit/counter[1]} -radix unsigned} {{/CPU/control_unit/counter[0]} -radix unsigned}} -subitemconfig {{/CPU/control_unit/counter[4]} {-height 15 -radix unsigned} {/CPU/control_unit/counter[3]} {-height 15 -radix unsigned} {/CPU/control_unit/counter[2]} {-height 15 -radix unsigned} {/CPU/control_unit/counter[1]} {-height 15 -radix unsigned} {/CPU/control_unit/counter[0]} {-height 15 -radix unsigned}} /CPU/control_unit/counter
add wave -noupdate -radix hexadecimal /CPU/control_unit/Funct
add wave -noupdate -radix hexadecimal /CPU/control_unit/OPCODE
add wave -noupdate -group ALU /CPU/ALUOut_/Load
add wave -noupdate -group ALU -radix unsigned /CPU/ALUOut_/Entrada
add wave -noupdate -group ALU -radix unsigned /CPU/ALUOut_/Saida
add wave -noupdate -group ALU -radix unsigned /CPU/mux_ALUOut_/data_out
add wave -noupdate -group ALU -radix unsigned -childformat {{/CPU/ALU_/S(31) -radix binary} {/CPU/ALU_/S(30) -radix binary} {/CPU/ALU_/S(29) -radix binary} {/CPU/ALU_/S(28) -radix binary} {/CPU/ALU_/S(27) -radix binary} {/CPU/ALU_/S(26) -radix binary} {/CPU/ALU_/S(25) -radix binary} {/CPU/ALU_/S(24) -radix binary} {/CPU/ALU_/S(23) -radix binary} {/CPU/ALU_/S(22) -radix binary} {/CPU/ALU_/S(21) -radix binary} {/CPU/ALU_/S(20) -radix binary} {/CPU/ALU_/S(19) -radix binary} {/CPU/ALU_/S(18) -radix binary} {/CPU/ALU_/S(17) -radix binary} {/CPU/ALU_/S(16) -radix binary} {/CPU/ALU_/S(15) -radix binary} {/CPU/ALU_/S(14) -radix binary} {/CPU/ALU_/S(13) -radix binary} {/CPU/ALU_/S(12) -radix binary} {/CPU/ALU_/S(11) -radix binary} {/CPU/ALU_/S(10) -radix binary} {/CPU/ALU_/S(9) -radix binary} {/CPU/ALU_/S(8) -radix binary} {/CPU/ALU_/S(7) -radix binary} {/CPU/ALU_/S(6) -radix binary} {/CPU/ALU_/S(5) -radix binary} {/CPU/ALU_/S(4) -radix binary} {/CPU/ALU_/S(3) -radix binary} {/CPU/ALU_/S(2) -radix binary} {/CPU/ALU_/S(1) -radix binary} {/CPU/ALU_/S(0) -radix binary}} -subitemconfig {/CPU/ALU_/S(31) {-height 15 -radix binary} /CPU/ALU_/S(30) {-height 15 -radix binary} /CPU/ALU_/S(29) {-height 15 -radix binary} /CPU/ALU_/S(28) {-height 15 -radix binary} /CPU/ALU_/S(27) {-height 15 -radix binary} /CPU/ALU_/S(26) {-height 15 -radix binary} /CPU/ALU_/S(25) {-height 15 -radix binary} /CPU/ALU_/S(24) {-height 15 -radix binary} /CPU/ALU_/S(23) {-height 15 -radix binary} /CPU/ALU_/S(22) {-height 15 -radix binary} /CPU/ALU_/S(21) {-height 15 -radix binary} /CPU/ALU_/S(20) {-height 15 -radix binary} /CPU/ALU_/S(19) {-height 15 -radix binary} /CPU/ALU_/S(18) {-height 15 -radix binary} /CPU/ALU_/S(17) {-height 15 -radix binary} /CPU/ALU_/S(16) {-height 15 -radix binary} /CPU/ALU_/S(15) {-height 15 -radix binary} /CPU/ALU_/S(14) {-height 15 -radix binary} /CPU/ALU_/S(13) {-height 15 -radix binary} /CPU/ALU_/S(12) {-height 15 -radix binary} /CPU/ALU_/S(11) {-height 15 -radix binary} /CPU/ALU_/S(10) {-height 15 -radix binary} /CPU/ALU_/S(9) {-height 15 -radix binary} /CPU/ALU_/S(8) {-height 15 -radix binary} /CPU/ALU_/S(7) {-height 15 -radix binary} /CPU/ALU_/S(6) {-height 15 -radix binary} /CPU/ALU_/S(5) {-height 15 -radix binary} /CPU/ALU_/S(4) {-height 15 -radix binary} /CPU/ALU_/S(3) {-height 15 -radix binary} /CPU/ALU_/S(2) {-height 15 -radix binary} /CPU/ALU_/S(1) {-height 15 -radix binary} /CPU/ALU_/S(0) {-height 15 -radix binary}} /CPU/ALU_/S
add wave -noupdate -group ALU /CPU/ALU_/Menor
add wave -noupdate -group {A op} /CPU/control_unit/ALUSrcA
add wave -noupdate -group {A op} /CPU/registers_/ReadData1
add wave -noupdate -group {A op} /CPU/A_/Load
add wave -noupdate -group {A op} /CPU/A_/Saida
add wave -noupdate -group {A op} -radix decimal /CPU/mux_ALU1_/data_out
add wave -noupdate -group {B op} /CPU/B_/Load
add wave -noupdate -group {B op} -radix decimal /CPU/mux_ALU2_/data_out
add wave -noupdate -group {B op} /CPU/control_unit/ALUOutSrc
add wave -noupdate -group {B op} /CPU/control_unit/ALUSrcB
add wave -noupdate -group PC /CPU/control_unit/PCSource
add wave -noupdate -group PC /CPU/PC_/Load
add wave -noupdate -group PC -radix decimal /CPU/PC_/Saida
add wave -noupdate -group PC -radix decimal /CPU/PC_/Entrada
add wave -noupdate -group MEMO -radix unsigned /CPU/MEM_/Address
add wave -noupdate -group MEMO -radix decimal /CPU/mdr_/Saida
add wave -noupdate -group MEMO /CPU/mdr_/Load
add wave -noupdate -group MEMO -radix decimal /CPU/MEM_/Dataout
add wave -noupdate -group {Op Reg} -radix decimal /CPU/registers_/Cluster(1)
add wave -noupdate -group {Op Reg} -radix decimal /CPU/registers_/Cluster(2)
add wave -noupdate -group {Op Reg} -radix decimal /CPU/registers_/Cluster(3)
add wave -noupdate -group {Op Reg} -radix decimal /CPU/registers_/Cluster(4)
add wave -noupdate -group {Op Reg} -radix decimal /CPU/registers_/Cluster(5)
add wave -noupdate -group {Op Reg} -radix decimal /CPU/registers_/Cluster(6)
add wave -noupdate -group {Op Reg} -radix decimal /CPU/registers_/Cluster(7)
add wave -noupdate -group {Op Reg} -radix decimal /CPU/registers_/Cluster(8)
add wave -noupdate -group {Op Reg} -radix decimal /CPU/registers_/Cluster(9)
add wave -noupdate -group {Op Reg} -radix decimal /CPU/registers_/Cluster(10)
add wave -noupdate -group IR /CPU/IR_/Instr31_26
add wave -noupdate -group IR /CPU/IR_/Instr25_21
add wave -noupdate -group IR /CPU/IR_/Instr20_16
add wave -noupdate -group IR /CPU/IR_/Instr15_0
add wave -noupdate -radix decimal -childformat {{/CPU/EPC_/Saida(31) -radix decimal} {/CPU/EPC_/Saida(30) -radix decimal} {/CPU/EPC_/Saida(29) -radix decimal} {/CPU/EPC_/Saida(28) -radix decimal} {/CPU/EPC_/Saida(27) -radix decimal} {/CPU/EPC_/Saida(26) -radix decimal} {/CPU/EPC_/Saida(25) -radix decimal} {/CPU/EPC_/Saida(24) -radix decimal} {/CPU/EPC_/Saida(23) -radix decimal} {/CPU/EPC_/Saida(22) -radix decimal} {/CPU/EPC_/Saida(21) -radix decimal} {/CPU/EPC_/Saida(20) -radix decimal} {/CPU/EPC_/Saida(19) -radix decimal} {/CPU/EPC_/Saida(18) -radix decimal} {/CPU/EPC_/Saida(17) -radix decimal} {/CPU/EPC_/Saida(16) -radix decimal} {/CPU/EPC_/Saida(15) -radix decimal} {/CPU/EPC_/Saida(14) -radix decimal} {/CPU/EPC_/Saida(13) -radix decimal} {/CPU/EPC_/Saida(12) -radix decimal} {/CPU/EPC_/Saida(11) -radix decimal} {/CPU/EPC_/Saida(10) -radix decimal} {/CPU/EPC_/Saida(9) -radix decimal} {/CPU/EPC_/Saida(8) -radix decimal} {/CPU/EPC_/Saida(7) -radix decimal} {/CPU/EPC_/Saida(6) -radix decimal} {/CPU/EPC_/Saida(5) -radix decimal} {/CPU/EPC_/Saida(4) -radix decimal} {/CPU/EPC_/Saida(3) -radix decimal} {/CPU/EPC_/Saida(2) -radix decimal} {/CPU/EPC_/Saida(1) -radix decimal} {/CPU/EPC_/Saida(0) -radix decimal}} -subitemconfig {/CPU/EPC_/Saida(31) {-height 15 -radix decimal} /CPU/EPC_/Saida(30) {-height 15 -radix decimal} /CPU/EPC_/Saida(29) {-height 15 -radix decimal} /CPU/EPC_/Saida(28) {-height 15 -radix decimal} /CPU/EPC_/Saida(27) {-height 15 -radix decimal} /CPU/EPC_/Saida(26) {-height 15 -radix decimal} /CPU/EPC_/Saida(25) {-height 15 -radix decimal} /CPU/EPC_/Saida(24) {-height 15 -radix decimal} /CPU/EPC_/Saida(23) {-height 15 -radix decimal} /CPU/EPC_/Saida(22) {-height 15 -radix decimal} /CPU/EPC_/Saida(21) {-height 15 -radix decimal} /CPU/EPC_/Saida(20) {-height 15 -radix decimal} /CPU/EPC_/Saida(19) {-height 15 -radix decimal} /CPU/EPC_/Saida(18) {-height 15 -radix decimal} /CPU/EPC_/Saida(17) {-height 15 -radix decimal} /CPU/EPC_/Saida(16) {-height 15 -radix decimal} /CPU/EPC_/Saida(15) {-height 15 -radix decimal} /CPU/EPC_/Saida(14) {-height 15 -radix decimal} /CPU/EPC_/Saida(13) {-height 15 -radix decimal} /CPU/EPC_/Saida(12) {-height 15 -radix decimal} /CPU/EPC_/Saida(11) {-height 15 -radix decimal} /CPU/EPC_/Saida(10) {-height 15 -radix decimal} /CPU/EPC_/Saida(9) {-height 15 -radix decimal} /CPU/EPC_/Saida(8) {-height 15 -radix decimal} /CPU/EPC_/Saida(7) {-height 15 -radix decimal} /CPU/EPC_/Saida(6) {-height 15 -radix decimal} /CPU/EPC_/Saida(5) {-height 15 -radix decimal} /CPU/EPC_/Saida(4) {-height 15 -radix decimal} /CPU/EPC_/Saida(3) {-height 15 -radix decimal} /CPU/EPC_/Saida(2) {-height 15 -radix decimal} /CPU/EPC_/Saida(1) {-height 15 -radix decimal} /CPU/EPC_/Saida(0) {-height 15 -radix decimal}} /CPU/EPC_/Saida
add wave -noupdate -radix unsigned /CPU/registers_/Cluster(31)
add wave -noupdate -radix unsigned /CPU/registers_/Cluster(29)
add wave -noupdate -group lo /CPU/low_/Reset
add wave -noupdate -group lo /CPU/low_/Load
add wave -noupdate -group lo -radix decimal -childformat {{/CPU/low_/Entrada(31) -radix decimal} {/CPU/low_/Entrada(30) -radix decimal} {/CPU/low_/Entrada(29) -radix decimal} {/CPU/low_/Entrada(28) -radix decimal} {/CPU/low_/Entrada(27) -radix decimal} {/CPU/low_/Entrada(26) -radix decimal} {/CPU/low_/Entrada(25) -radix decimal} {/CPU/low_/Entrada(24) -radix decimal} {/CPU/low_/Entrada(23) -radix decimal} {/CPU/low_/Entrada(22) -radix decimal} {/CPU/low_/Entrada(21) -radix decimal} {/CPU/low_/Entrada(20) -radix decimal} {/CPU/low_/Entrada(19) -radix decimal} {/CPU/low_/Entrada(18) -radix decimal} {/CPU/low_/Entrada(17) -radix decimal} {/CPU/low_/Entrada(16) -radix decimal} {/CPU/low_/Entrada(15) -radix decimal} {/CPU/low_/Entrada(14) -radix decimal} {/CPU/low_/Entrada(13) -radix decimal} {/CPU/low_/Entrada(12) -radix decimal} {/CPU/low_/Entrada(11) -radix decimal} {/CPU/low_/Entrada(10) -radix decimal} {/CPU/low_/Entrada(9) -radix decimal} {/CPU/low_/Entrada(8) -radix decimal} {/CPU/low_/Entrada(7) -radix decimal} {/CPU/low_/Entrada(6) -radix decimal} {/CPU/low_/Entrada(5) -radix decimal} {/CPU/low_/Entrada(4) -radix decimal} {/CPU/low_/Entrada(3) -radix decimal} {/CPU/low_/Entrada(2) -radix decimal} {/CPU/low_/Entrada(1) -radix decimal} {/CPU/low_/Entrada(0) -radix decimal}} -subitemconfig {/CPU/low_/Entrada(31) {-height 15 -radix decimal} /CPU/low_/Entrada(30) {-height 15 -radix decimal} /CPU/low_/Entrada(29) {-height 15 -radix decimal} /CPU/low_/Entrada(28) {-height 15 -radix decimal} /CPU/low_/Entrada(27) {-height 15 -radix decimal} /CPU/low_/Entrada(26) {-height 15 -radix decimal} /CPU/low_/Entrada(25) {-height 15 -radix decimal} /CPU/low_/Entrada(24) {-height 15 -radix decimal} /CPU/low_/Entrada(23) {-height 15 -radix decimal} /CPU/low_/Entrada(22) {-height 15 -radix decimal} /CPU/low_/Entrada(21) {-height 15 -radix decimal} /CPU/low_/Entrada(20) {-height 15 -radix decimal} /CPU/low_/Entrada(19) {-height 15 -radix decimal} /CPU/low_/Entrada(18) {-height 15 -radix decimal} /CPU/low_/Entrada(17) {-height 15 -radix decimal} /CPU/low_/Entrada(16) {-height 15 -radix decimal} /CPU/low_/Entrada(15) {-height 15 -radix decimal} /CPU/low_/Entrada(14) {-height 15 -radix decimal} /CPU/low_/Entrada(13) {-height 15 -radix decimal} /CPU/low_/Entrada(12) {-height 15 -radix decimal} /CPU/low_/Entrada(11) {-height 15 -radix decimal} /CPU/low_/Entrada(10) {-height 15 -radix decimal} /CPU/low_/Entrada(9) {-height 15 -radix decimal} /CPU/low_/Entrada(8) {-height 15 -radix decimal} /CPU/low_/Entrada(7) {-height 15 -radix decimal} /CPU/low_/Entrada(6) {-height 15 -radix decimal} /CPU/low_/Entrada(5) {-height 15 -radix decimal} /CPU/low_/Entrada(4) {-height 15 -radix decimal} /CPU/low_/Entrada(3) {-height 15 -radix decimal} /CPU/low_/Entrada(2) {-height 15 -radix decimal} /CPU/low_/Entrada(1) {-height 15 -radix decimal} /CPU/low_/Entrada(0) {-height 15 -radix decimal}} /CPU/low_/Entrada
add wave -noupdate -group lo -radix decimal /CPU/low_/Saida
add wave -noupdate -group hi /CPU/high_/Reset
add wave -noupdate -group hi /CPU/high_/Load
add wave -noupdate -group hi -radix decimal /CPU/high_/Entrada
add wave -noupdate -group hi -radix decimal /CPU/high_/Saida
add wave -noupdate -group shift /CPU/reg_desloc_/Shift
add wave -noupdate -group shift /CPU/reg_desloc_/N
add wave -noupdate -group shift /CPU/reg_desloc_/Entrada
add wave -noupdate -group shift /CPU/reg_desloc_/Saida
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {9400 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 243
configure wave -valuecolwidth 198
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {8745 ps} {9769 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ps -dutycycle 50 -starttime 0ps -endtime 20000ps sim:/CPU/clk 
wave create -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 100ps sim:/CPU/reset 
wave modify -driver freeze -pattern constant -value St0 -starttime 100ps -endtime 20000ps Edit:/CPU/reset 
wave modify -driver freeze -pattern clock -initialvalue St1 -period 100ps -dutycycle 50 -starttime 0ps -endtime 30000ps Edit:/CPU/clk 
WaveCollapseAll -1
wave clipboard restore
