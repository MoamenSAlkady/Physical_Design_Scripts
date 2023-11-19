# Overview
This script (delay_average.tcl) calculates the average delay of cells for a specific timing path.

# Description
This script creates a timing report for the selected timing path and calculates the average delay of cells in that specific timing path.

# Getting Started
## Dependencies
* IC Compiler 2

## Execution
* Create a directory "work" and put the scripts in "work/scripts".
* Create the directory "work/reports".
* Edit the path group, scenario, and click on (select) the timing path in the Timing Analysis Window in the IC Compiler 2 GUI.
* Edit the delay factor to your choice.
* Make sure the ICC2 terminal is open in the directory "work".
* Enter the following command:
    * "source ./scripts/delay_average.tcl":                          to execute the script.