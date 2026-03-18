############################################################
# 1. Import Design
############################################################

source inputs/Default.globals
init_design


############################################################
# 2. Floorplan
############################################################
# AspectRatio = 1 (square)
# Utilization = 0.5 (safe)
# Margins = 10 (safe for routing)

floorPlan -site CoreSite -r {1 0.5 10 10 10 10} -coreMarginsBy io


############################################################
# 3. IO Pin Placement
############################################################

# Input Ports
set in_ports [get_object_name [all_inputs]]

editPin -fixOverlap 1 \
-side left \
-layer 5 \
-spreadDirection clockwise \
-spreadType RANGE \
-start {0 10} \
-end {0 70} \
-pin $in_ports \
-snap TRACK


# Output Ports
set out_ports [get_object_name [all_outputs]]

editPin -fixOverlap 1 \
-side right \
-layer 5 \
-spreadDirection counterclockwise \
-spreadType RANGE \
-start {90 10} \
-end {90 70} \
-pin $out_ports \
-snap TRACK


############################################################
# 4. Pin Assignment Checks
############################################################

checkPinAssignment -reportSameNetPinAsOverlap \
-outFile reports/pin_overlap.rpt

checkPinAssignment -reportUncoloredViolation \
-outFile reports/pin_color_violation.rpt

checkPinAssignment -report_violating_pin \
-outFile reports/pin_violation.rpt

legalizePin


############################################################
# 5. Floorplan Debug / Info
############################################################

dbGet top.name
dbGet top.fPlan.coreBox
dbGet top.fPlan.coreBox_area

dbGet top.terms.name
dbGet top.terms.isinput

dbGet top.insts.name
llength [dbGet top.insts.name]


############################################################
# 6. Tap Cell (Skipped)
############################################################
# No tap cells in gsclib045 ? skip


############################################################
# 7. Floorplan Check
############################################################

checkFPlan -reportUtil


############################################################
# 8. Save Design (IMPORTANT: no .enc)
############################################################

saveDesign design/floorplan_done
