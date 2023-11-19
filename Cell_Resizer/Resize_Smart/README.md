# Overview
This script (resizer.tcl) allows selecting a specific timing path and resizing its cells based on an average delay metric and a delay factor that the user chooses.

# Description
* This script is divided into multiple stages as follows:
    * Creating a timing report for the wanted timing path.
    * Analyzing the timing report and extracting the following:
        * Instance Names
        * Cell Names
        * Driving Strength
        * Delay
    * Calculating the average delay of all cells in the specified timing path.
    * Creates a resizing script for IC Compiler 2 for each cell in the timing path based on two cases as follows:
        * Cell's delay is greater than the average delay multiplied by a chosen factor (delay > delay_average * delay_factor):              The cell is resized to the specified driving strength.
        * Cell's delay is less than or equal to the average delay multiplied by a chosen factor (delay <= delay_average * delay_factor):    The cell is resized to the same driving strength it already has.
    * The created resize script is then executed.
    * A legalization increment is performed to ensure proper layout.

# Getting Started
## Dependencies
* IC Compiler 2

## Execution
* Create a directory "work" and put the scripts in "work/scripts".
* Create the directory "work/reports".
* Edit the script to select the required driving strength and delay factor.
* Edit the path group, scenario, and click on (select) the timing path in the Timing Analysis Window in the IC Compiler 2 GUI.
* Make sure the ICC2 terminal is open in the directory "work".
* Enter the following command:
    * "source ./scripts/resizer.tcl":    to execute the resizing script.