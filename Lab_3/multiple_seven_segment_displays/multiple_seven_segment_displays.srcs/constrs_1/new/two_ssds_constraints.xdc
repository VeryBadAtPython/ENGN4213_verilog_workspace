set_property -dict {PACKAGE_PIN K17 IOSTANDARD LVCMOS33} [get_ports clk]
create_clock -name clock1 -add -period 8.00 [get_ports clk]

set_property -dict {PACKAGE_PIN H15 IOSTANDARD LVCMOS33} [get_ports {ssdCathode}]

set_property -dict {PACKAGE_PIN T14 IOSTANDARD LVCMOS33} [get_ports {ssdAnode[6]}]
set_property -dict {PACKAGE_PIN T15 IOSTANDARD LVCMOS33} [get_ports {ssdAnode[5]}]
set_property -dict {PACKAGE_PIN P14 IOSTANDARD LVCMOS33} [get_ports {ssdAnode[4]}]
set_property -dict {PACKAGE_PIN R14 IOSTANDARD LVCMOS33} [get_ports {ssdAnode[3]}]
set_property -dict {PACKAGE_PIN V12 IOSTANDARD LVCMOS33} [get_ports {ssdAnode[2]}]
set_property -dict {PACKAGE_PIN W16 IOSTANDARD LVCMOS33} [get_ports {ssdAnode[1]}]
set_property -dict {PACKAGE_PIN J15 IOSTANDARD LVCMOS33} [get_ports {ssdAnode[0]}]