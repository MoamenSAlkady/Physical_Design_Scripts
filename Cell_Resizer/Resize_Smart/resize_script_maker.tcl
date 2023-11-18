###########################################################################
# Function: Script to create a resizing script for solving timing violations (smart)
# Created by Mo'men Salah Alkady
###########################################################################
### parsing timing report for necessary data to create resizing script
set report_file 			"./reports/report_timing_for_resize.rpt"
catch {set FH_RP [open $report_file r]}
set slurp [read -nonewline $FH_RP]
close $FH_RP
set lines [split $slurp "\n"]

set inst_name 				""
set cell_name 				""
set drive_strength 			""
set delay_incr 				""
set inst_name_list 			{}
set cell_name_list 			{}
set drive_strength_list 	{}
set delay_incr_list 		{}
foreach line $lines {
	regexp {\s*(.*)/.*\s*\((.*X([0-9L]).*)\)\s*([0-9].[0-9]{1,2})} $line -> inst_name cell_name drive_strength delay_incr
	set inst_name_list 	[concat $inst_name_list $inst_name]
	set cell_name_list 	[concat $cell_name_list $cell_name]
	set drive_strength_list [concat $drive_strength_list $drive_strength]
	set delay_incr_list 	[concat $delay_incr_list $delay_incr]
}

### calculating average delay for cells in the given timing report
set delay_total 			"0.00"
set count 					"0"
foreach delay $delay_incr_list {
	if {$delay != "0.00"} {
		set delay_total 	[expr {$delay_total + $delay}]
		set count 		[expr {$count + 1}]
	}
}
set delay_avg 				[expr {$delay_total/$count}]

### define required driving strength for resizing (in case of need for override)
#set drive_strength_resize 	8

### defining list with cell names with required driving strengths that should be resized based on a delay factor
set inst_name_resized 		{}
set cell_name_resized 		{}
#set delay_factor 			1.2

foreach inst $inst_name_list cell $cell_name_list delay $delay_incr_list {
	if {$delay > [expr {$delay_avg * $delay_factor}]} {
		set cell_name_resized [concat $cell_name_resized [regsub -all {(.*X)[0-9L]+(.*)} $cell [concat "\\1$drive_strength_resize\\2"]]]
	} else {
		set cell_name_resized [concat $cell_name_resized $cell]
	}
}

### creating the resizing script
set resize_script 			"./scripts/resize_script.tcl"
catch {set FH_SC [open $resize_script w]}
foreach inst $inst_name_list cell $cell_name_resized {
	puts $FH_SC "catch {size_cell $inst -lib_cell tsmc_180nm|tsmc_180nm_std/${cell}}"
}
close $FH_SC

### unsetting multiple variables to ensure proper re-execution of script
unset inst_name_list
unset cell_name_list
unset drive_strength_list
unset delay_incr_list
unset cell_name_resized

##############################################################
# END
##############################################################