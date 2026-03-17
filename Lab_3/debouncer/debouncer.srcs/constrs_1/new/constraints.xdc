set_property -dict {PACKAGE_PIN T16 IOSTANDARD LVCMOS33} [get_ports switchA]
set_property -dict {PACKAGE_PIN G15 IOSTANDARD LVCMOS33} [get_ports switchB]
set_property -dict {PACKAGE_PIN K18 IOSTANDARD LVCMOS33} [get_ports reset]

set_property -dict {PACKAGE_PIN D18 IOSTANDARD LVCMOS33} [get_ports {led[3]}]
set_property -dict {PACKAGE_PIN G14 IOSTANDARD LVCMOS33} [get_ports {led[2]}]
set_property -dict {PACKAGE_PIN M15 IOSTANDARD LVCMOS33} [get_ports {led[1]}]
set_property -dict {PACKAGE_PIN M14 IOSTANDARD LVCMOS33} [get_ports {led[0]}]

set_property -dict {PACKAGE_PIN K17 IOSTANDARD LVCMOS33} [get_ports clk]
create_clock -name clock1 -add -period 8.00 [get_ports clk]