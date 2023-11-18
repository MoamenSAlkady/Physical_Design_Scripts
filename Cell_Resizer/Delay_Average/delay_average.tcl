###########################################################################
# Function: Calculate average delay increment for cells in a timing path
# Created by Mo'men Salah Alkady
###########################################################################
### setting initial settings for script
set endpoint 			"u_cortexm0integration/u_cortexm0/u_logic/Oo3l85_reg/D"
set group 				"HCLK"
set scenario 			"func_ss_typical_max_1p62v_125c"
set delay_factor 		1.55

## update timing
update_timing -full

## report timing
if {[info exists endpoint] && [info exists group] && [info exists scenario]} {
	report_timing -nosplit [get_timing_paths -report_by design -delay_type max -path_type full_clock_expanded -to [get_selection] -max_paths 999999 -nworst 1 -slack_lesser_than 999999 \
		-include_hierarchical_pins -groups $group -scenarios $scenario] > ./reports/report_timing_for_resize.rpt
} else {
	report_timing -nosplit -report_by scenario -transition_time -capacitance -nworst 10 -max_paths 200 -slack_lesser_than 0 -delay_type max > ./reports/report_timing_for_resize.rpt
}

### parsing timing report for necessary data to create resizing script
set report_file 		"./reports/report_timing_for_resize.rpt"
catch {set FH_RP [open $report_file r]}
set slurp [read -nonewline $FH_RP]
close $FH_RP
set lines [split $slurp "\n"]

set delay_incr 			""
set delay_incr_list 	{}
foreach line $lines {
	regexp {\s*.*/.*\s*\(.*X[0-9L].*\)\s*([0-9].[0-9]{1,2})} $line -> delay_incr
	set delay_incr_list 	[concat $delay_incr_list $delay_incr]
}

### calculating average delay for cells in the given timing report
set delay_total 		"0.00"
set count 				"0"
foreach delay $delay_incr_list {
	if {$delay != "0.00"} {
		set delay_total 	[expr {$delay_total + $delay}]
		set count 			[expr {$count + 1}]
	}
}
set delay_avg 				[expr {$delay_total/$count}]
set delay_factored 			[expr {$delay_avg * $delay_factor}]

### print average delay value
puts "Average Cell Delay:"
puts "###################"
puts "$delay_avg\n"
puts "Average Cell Delay with Factor ($delay_factor):"
puts "#####################################"
puts "$delay_factored"

### resetting initialization variables
unset endpoint
unset group
unset scenario

##############################################################
# END
##############################################################

#func_ss_typical_max_1p62v_125c func typical_max_1p62v_125c HCLK setup 2453 6 -0.95 -2.14
#-0.95 pin u_cortexm0integration/u_cortexm0/u_logic/Oo3l85_reg/D