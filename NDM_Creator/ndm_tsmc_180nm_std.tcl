##############################################################
# NDM creator
# Created by Mo'men Salah Alkady
##############################################################
### ndm library name
set ndm "tsmc_180nm_std"

### creating ndm directory
set ndm_dir "./ndm"
file mkdir $ndm_dir

## setting library directory
set libs			"/arm/scratch/geoflo01/gate_libs/libs"

### tech file
set synopsys_tech_tf		${libs}/arm/tsmc/ce018fg/arm_tech/r5p1/milkyway/6lm/sc7_tech.tf

### db files directory
set db_dir			${libs}/arm/tsmc/ce018fg/sc7_base_rvt/r9p0-01eac0/db
set db_all			[glob ${db_dir}/*.db]

### lef files
set lef				${libs}/arm/tsmc/ce018fg/sc7_base_rvt/r9p0-01eac0/lef/sc7_ce018fg_base_rvt.lef

### change all paths to absolute paths since some tools don't support relative paths
set db_dir	[file normalize $db_dir]
set ndm_dir	[file normalize $ndm_dir]

### creating library manager workspace
create_workspace -flow normal $ndm

### reading tech file
read_tech_file $synopsys_tech_tf

### reading .db files
read_db $db_all

### reading .lef files
read_lef -merge_action Add $lef

### checking and committing workspace
check_workspace
commit_workspace -force -directory $ndm_dir -output $ndm.ndm
