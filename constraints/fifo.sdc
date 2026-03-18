# Clock definition
create_clock -name clk -period 10 [get_ports clk]

# Input delay (relative to clock)
set_input_delay 2 -clock clk [remove_from_collection [all_inputs] [get_ports clk]]

# Output delay (relative to clock)
set_output_delay 2 -clock clk [all_outputs]

# Clock uncertainty
set_clock_uncertainty 0.1 [get_clocks clk]
