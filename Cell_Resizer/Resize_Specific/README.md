# Overview
This script resizes a specific or multiple instances of cells to a chosen driving strength.

# Description
This script allows you to batch-resize multiple instances of cells to a chosen driving strength and then peforms an incremental legalization to ensure proper layout.

# Getting Started
## Dependencies
* IC Compiler 2

## Execution
* Create a directory "work" and put the scripts in "work/scripts".
* Edit the $cell and $instances variables to choose the required instance names and resized cell names.
* Edit the library NDM name in line 19 to comply with your the library you use.
* Make sure the ICC2 terminal is open in the directory "work".
* Enter the following commands in order:
    * "source ./scripts/resize.tcl":                          to execute the script.