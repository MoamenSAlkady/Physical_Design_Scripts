## update timing
update_timing -full

## report timing
if {[info exists endpoint] && [info exists group] && [info exists scenario]} {
	report_timing -nosplit [get_timing_paths -report_by design -delay_type max -path_type full_clock_expanded -to [get_selection] -max_paths 999999 -nworst 1 -slack_lesser_than 999999 \
		-include_hierarchical_pins -groups $group -scenarios $scenario] > ./reports/report_timing_for_resize.rpt
} else {
	report_timing -nosplit -report_by scenario -transition_time -capacitance -nworst 10 -max_paths 200 -slack_lesser_than 0 -delay_type max > ./reports/report_timing_for_resize.rpt
}

##############################################################
# END
##############################################################
