##############################################################
# NDM creator
# Created by Mo'men Salah Alkady
##############################################################
### creating NDMs
source ./scripts/ndm_tsmc_180nm_std.tcl
source ./scripts/ndm_tsmc_180nm_fill.tcl

### ndm library name
set ndm "tsmc_180nm"

### creating ndm directory
set ndm_dir "../ndm"
file mkdir $ndm_dir

### change all paths to absolute paths since some tools don't support relative paths
set ndm_dir	[file normalize $ndm_dir]

### creating library manager workspace
create_workspace -flow aggregate $ndm

### reading ndm files
set ndm_files [concat [glob ${ndm_dir}/tsmc_180nm_*.ndm]]

foreach ndm_file $ndm_files {
	read_ndm $ndm_file
}

### checking and committing workspace
check_workspace
commit_workspace -force -directory $ndm_dir -output $ndm.ndm

## removing unnecessary .ndm files
foreach ndm_file $ndm_files {
	file delete -force $ndm_file
}
unset ndm_files
unset ndm_file
