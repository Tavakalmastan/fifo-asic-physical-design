############################################################
# SDC for sync_fifo
############################################################

set sdc_version 2.0

############################################################
# Units
############################################################
set_units -time 1ns
set_units -capacitance 1pf

############################################################
# Current Design
############################################################
current_design sync_fifo

############################################################
# Clock Definition
############################################################
create_clock -name clk \
-period 2.0 \
-waveform {0 1} \
[get_ports clk]

############################################################
# Clock Uncertainty
############################################################
set_clock_uncertainty -setup 0.05 [get_clocks clk]
set_clock_uncertainty -hold 0.02 [get_clocks clk]

############################################################
# Input Delay Constraints
############################################################
set_input_delay -clock clk -max 0.3 [get_ports {wr_en rd_en}]
set_input_delay -clock clk -max 0.3 [get_ports {din[*]}]

set_input_delay -clock clk -min 0.05 [get_ports {wr_en rd_en}]
set_input_delay -clock clk -min 0.05 [get_ports {din[*]}]

############################################################
# Output Delay Constraints
############################################################
set_output_delay -clock clk -max 0.3 [get_ports {dout[*] empty full}]
set_output_delay -clock clk -min 0.05 [get_ports {dout[*] empty full}]

############################################################
# Reset (False Path)
############################################################
set_false_path -from [get_ports rstn]

############################################################
# Driving Cell for Inputs
############################################################
set_driving_cell \
-lib_cell BUFX12 \
-library slow_vdd1v0 \
-pin Y \
[get_ports {wr_en rd_en din[*] rstn}]

############################################################
# Output Load
############################################################
set_load 0.01 [get_ports {dout[*] empty full}]

############################################################
# Clock Transition
############################################################
set_clock_transition 0.1 [get_clocks clk]

############################################################
# Clock Latency
############################################################
set_clock_latency 0.1 [get_clocks clk]

############################################################
# Timing Derates
############################################################
set_timing_derate -early 0.95
set_timing_derate -late 1.05

############################################################
# End of SDC
############################################################
