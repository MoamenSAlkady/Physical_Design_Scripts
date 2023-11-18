# Overview
There are multiple scripts here that can be divided into three types based on functionality as follows:
* 1\)
    * Selecting a specific timing path and resize its cells based on an average delay metric and a delay factor that the user chooses.

* 2\)
    * Resizing specific instances of cells to a chosen driving strength.

* 3\)
    * Calculating the average delay of a specific timing path.

# Description
This script is divided into 2 stages or layers of hierarchy for the lack of better words, which bottom-up are as follows:
* 1\)
    * It creates the lower NDM files for both the Standard Cells and the Physical-Only Cells using the "normal" and "physical_only" flows respectively.
    * It reads all the necessary source files and combines them into 2 NDM files, one for the Standard Cells and one for the Physical-Only Cells.

* 2\)
    * It creates the combined single NDM file that combines both the 2 NDM files for the Standard Cells and the Physical-Only Cells using the "aggregate" flow.
    * It reads all the lower level NDM files and then combines into a single NDM file.

# Getting Started
## Dependencies
* IC Compiler 2

## Execution
* Create a directory "work" and put the scripts in "work/scripts".
* Edit the scripts to change the source files' directories as needed.
* Open a terminal in the directory "work".
* Enter the following commands in order:
    * "icc2_lm_shell":                          to open the Library Manager shell.
    * "source ./scripts/ndm_tsmc_180nm.tcl":    to execute the top-level script in the Library Manager shell.
* Find the combined NDM file in the directory "work/ndm".