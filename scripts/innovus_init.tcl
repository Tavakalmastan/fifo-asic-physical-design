# Library search path
set init_lib_search_path libs/lef/

# LEF files
set init_lef_file {
libs/lef/gsclib045_tech.lef
libs/lef/gsclib045_macro.lef
libs/lef/gsclib045_hvt_macro.lef
libs/lef/gsclib045_lvt_macro.lef
}

# Netlist
set init_verilog outputs/sync_fifo_netlist.v

# Top module
set init_top_cell sync_fifo

# Constraints
set init_sdc_file constraints/fifo.sdc

# Initialize design
init_design
