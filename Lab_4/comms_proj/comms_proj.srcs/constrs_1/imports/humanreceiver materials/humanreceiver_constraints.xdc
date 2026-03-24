## Clock
set_property PACKAGE_PIN K17 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk -period 8.000 [get_ports clk]  ; 

set_property PACKAGE_PIN K18 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

set_property PACKAGE_PIN Y16 [get_ports btn_capture]
set_property IOSTANDARD LVCMOS33 [get_ports btn_capture]

set_property PACKAGE_PIN K19 [get_ports btn_signal]
set_property IOSTANDARD LVCMOS33 [get_ports btn_signal]

set_property PACKAGE_PIN D18 [get_ports {LEDs[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LEDs[0]}]

set_property PACKAGE_PIN G14 [get_ports {LEDs[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LEDs[1]}]

# led_indicator is an optional 3rd LED for debugging
set_property PACKAGE_PIN M14 [get_ports {led_indicator}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_indicator}]

## LED PMOD port. Mind the order! If the 7'b ssdAnode string 
## is read as {a,b,c,d,e,f,g}, then segment g corresponds to ssdAnode[0]
## JE PINS
set_property PACKAGE_PIN V12 [get_ports {ssdAnode[2]}]  ; # JE1
set_property PACKAGE_PIN W16 [get_ports {ssdAnode[1]}]  ; # JE2
set_property PACKAGE_PIN J15 [get_ports {ssdAnode[0]}]  ; # JE3
set_property PACKAGE_PIN H15 [get_ports ssdCathode]     ; # JE4 (CAT)
## JD PINS
set_property PACKAGE_PIN T14 [get_ports {ssdAnode[6]}]  ; # JD1
set_property PACKAGE_PIN T15 [get_ports {ssdAnode[5]}]  ; # JD2
set_property PACKAGE_PIN P14 [get_ports {ssdAnode[4]}]  ; # JD3
set_property PACKAGE_PIN R14 [get_ports {ssdAnode[3]}]  ; # JD4

set_property IOSTANDARD LVCMOS33 [get_ports {ssdAnode[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports ssdCathode]