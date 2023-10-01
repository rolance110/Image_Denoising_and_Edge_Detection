read_file -autoread -top top {../rtl}
current_design top
link

uplevel #0 source BIP.sdc
#compile -exact_map
compile_ultra
compile_ultra -incremental

#compile -map_effort high

remove_unconnected_ports -blast_buses [get_cells * -hier]#

uplevel #0 { report_area }
write_file -format verilog -hier -output ../syn/BIP_syn.v
write_sdf -version 2.1 -context verilog  ../syn/BIP_syn.sdf
write -hierarchy -format ddc -output ../syn/BIP_syn.ddc
report_timing > ../syn/timing.log
report_area -hier > ../syn/area.log

exit