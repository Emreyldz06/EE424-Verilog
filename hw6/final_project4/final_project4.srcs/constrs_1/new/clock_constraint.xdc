# Clock Source
# ----------------------------------------------------------------------------
set_property PACKAGE_PIN Y9 [get_ports {clk}]; 

set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 13]];



