vsim -voptargs="+acc" work.tb_risc_top

add wave -divider "Testbench Signals"
add wave -divider "clk and reset"
add wave \
{sim:/tb_risc_top/clk } \
{sim:/tb_risc_top/reset } 
add wave -divider "programm memory interface"
add wave -radix unsigned \
{sim:/tb_risc_top/instr_addr }
add wave \
{sim:/tb_risc_top/instr } 
add wave -divider "data memory interface"
add wave -radix unsigned \
{sim:/tb_risc_top/data_addr } \
{sim:/tb_risc_top/data_to_mem } \
{sim:/tb_risc_top/data_from_mem }
add wave \
{sim:/tb_risc_top/write_en }
add wave -divider "all signals of your RISC"
add wave -r -radix unsigned sim:/tb_risc_top/tb_component/*

run 89900 ns
mem save -o mem/data_after_sim.mem -f mti -data unsigned -addr decimal -startaddress 869 -endaddress 1000 -wordsperline 1 /tb_risc_top/data_mem/memory
