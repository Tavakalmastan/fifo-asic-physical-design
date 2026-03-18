# Library set
create_library_set -name slow_lib \
-timing {libs/timing_lib/slow/slow_vdd1v0_basicCells.lib \
libs/timing_lib/slow/slow_vdd1v0_basicCells_hvt.lib \
libs/timing_lib/slow/slow_vdd1v0_basicCells_lvt.lib}

# RC corner
create_rc_corner -name rc_slow

# Delay corner
create_delay_corner -name delay_slow \
-library_set slow_lib \
-rc_corner rc_slow

# Constraint mode
create_constraint_mode -name func \
-sdc_files {constraints/fifo.sdc}

# Analysis view
create_analysis_view -name view_slow \
-constraint_mode func \
-delay_corner delay_slow

set_analysis_view -setup view_slow -hold view_slow
