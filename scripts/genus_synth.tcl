

# ------------------------------------------------------------
# Genus Synthesis Script for FIFO Design (SCAN-FREE)
# ------------------------------------------------------------

# ------------------------------
# Library Setup
# ------------------------------

set_db init_lib_search_path ../libs/timing_lib/slow/

set_db target_library {
    slow_vdd1v0_basicCells_hvt.lib
    slow_vdd1v0_basicCells_lvt.lib
    slow_vdd1v0_basicCells.lib
}

set_db link_library {
    slow_vdd1v0_basicCells_hvt.lib
    slow_vdd1v0_basicCells_lvt.lib
    slow_vdd1v0_basicCells.lib
}

# ------------------------------
# Design Setup
# ------------------------------

set TOP sync_fifo

read_hdl ../rtl/sync_fifo.v
elaborate $TOP

read_sdc ../constraints/fifo.sdc

set_db use_scan_seqs false

# ------------------------------
# Synthesis
# ------------------------------

set_db syn_generic_effort high
set_db syn_map_effort high
set_db syn_opt_effort high

syn_generic
syn_map
syn_opt

# ------------------------------
# Write Outputs
# ------------------------------

write_hdl > ../outputs/sync_fifo_netlist.v

report_area   > ../reports/area.rpt
report_timing > ../reports/timing.rpt
report_power  > ../reports/power.rpt
report_qor    > ../reports/qor.rpt
report_gates  > ../reports/gates.rpt

write_db ../outputs/sync_fifo.db

puts "Synthesis is done (SCAN FREE)"
