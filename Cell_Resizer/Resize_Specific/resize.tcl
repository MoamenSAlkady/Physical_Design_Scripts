##############################################################
# Function: Resize multiple cells in a single execution
# Created by Mo'men Salah Alkady
##############################################################

## cells names
set cells 		[list \
	ADDFH_X8_A7TULL \
	ADDFH_X8_A7TULL \
]

## instances names
set instances 		[list \
	u_cortexm0integration/u_cortexm0/u_logic/U5670 \
	u_cortexm0integration/u_cortexm0/u_logic/U5762 \
]
## size cells
foreach inst $instances cell $cells {
	size_cell $inst -lib_cell tsmc_180nm|tsmc_180nm_std/${cell}
}

## legalize
source ./scripts/legalize.tcl

##############################################################
# END
##############################################################

#  u_cortexm0integration/u_cortexm0/u_logic/U5670/CO (ADDFH_X4_A7TULL)                      0.60     10.37 f
#  u_cortexm0integration/u_cortexm0/u_logic/U5762/CO (ADDFH_X1_A7TULL)                      0.59     10.96 f