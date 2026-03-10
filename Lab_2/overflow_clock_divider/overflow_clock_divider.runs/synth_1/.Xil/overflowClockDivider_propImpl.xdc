set_property SRC_FILE_INFO {cfile:{C:/Users/Jacob/Documents/Vivado_Projects/ENGN4213_verilog_workspace/Lab_2/overflow_clock_divider/overflow_clock_divider.srcs/constrs_1/new/overflow ClockDivider_constraints_ZyboZ7.xdc} rfile:{../../../overflow_clock_divider.srcs/constrs_1/new/overflow ClockDivider_constraints_ZyboZ7.xdc} id:1} [current_design]
set_property src_info {type:XDC file:1 line:1 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN D18 [get_ports dividedClk]
set_property src_info {type:XDC file:1 line:5 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN K17 IOSTANDARD LVCMOS33 } [get_ports {clk}];
set_property src_info {type:XDC file:1 line:6 export:INPUT save:INPUT read:READ} [current_design]
create_clock -add -period 8.00 [get_ports {clk}];
set_property src_info {type:XDC file:1 line:8 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN K18   IOSTANDARD LVCMOS33 } [get_ports { reset }];
set_property src_info {type:XDC file:1 line:9 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN G15   IOSTANDARD LVCMOS33 } [get_ports { enable }];
