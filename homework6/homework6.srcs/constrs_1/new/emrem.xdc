create_clock -period 10.000 -name clk -waveform {0.000 5.000} [get_ports clk]
set_input_delay -clock [get_clocks *] 0.000 [get_ports {{addr[0]} {addr[1]} {addr[2]} {data_in[0]} {data_in[1]} {data_in[2]} {data_in[3]} en sort we}]
