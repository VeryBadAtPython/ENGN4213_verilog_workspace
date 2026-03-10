set_property SRC_FILE_INFO {cfile:C:/Users/Jacob/Documents/Vivado_Projects/ENGN4213_verilog_workspace/Lab_2/arbitrary_clock_divider/arbitrary_clock_divider.srcs/constrs_1/new/clockDividerHB_constraints_ZyboZ7.xdc rfile:../../../arbitrary_clock_divider.srcs/constrs_1/new/clockDividerHB_constraints_ZyboZ7.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:7 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN V12   IOSTANDARD LVCMOS33 } [get_ports { dividedClk }]; #IO_L4P_T0_34 Sch=je[1]
set_property src_info {type:XDC file:1 line:13 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN V13   IOSTANDARD LVCMOS33 } [get_ports { beat }]; #IO_L3N_T0_DQS_34 Sch=je[7]
set_property src_info {type:XDC file:1 line:18 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN K17 IOSTANDARD LVCMOS33 } [get_ports {clk}];
set_property src_info {type:XDC file:1 line:19 export:INPUT save:INPUT read:READ} [current_design]
create_clock -add -period 8.00 [get_ports {clk}];
set_property src_info {type:XDC file:1 line:21 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN K18   IOSTANDARD LVCMOS33 } [get_ports { reset }];
set_property src_info {type:XDC file:1 line:22 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN G15   IOSTANDARD LVCMOS33 } [get_ports { enable }];
