###########################################################################
# Function: Script to create a resizing script for solving timing violations
# Created by Mo'men Salah Alkady
###########################################################################
### setting initial settings for script
set endpoint 			"u_cortexm0integration/u_cortexm0/u_logic/Oo3l85_reg/D"
set group   			"HCLK"
set scenario 			"func_ss_typical_max_1p62v_125c"

### define required driving strength for resizing
set drive_strength_resize   8
set delay_factor            1.55

### sourcing necessary scripts
source ./scripts/report_timing_for_resize.tcl
source ./scripts/resize_script_maker.tcl
source ./scripts/resize_script.tcl
source ./scripts/legalize.tcl

### resetting initialization variables
unset endpoint
unset group
unset scenario

##############################################################
# END
##############################################################

#func_ss_typical_max_1p62v_125c func typical_max_1p62v_125c HCLK setup 2453 6 -0.99 -2.07
#-0.95 pin u_cortexm0integration/u_cortexm0/u_logic/Oo3l85_reg/D