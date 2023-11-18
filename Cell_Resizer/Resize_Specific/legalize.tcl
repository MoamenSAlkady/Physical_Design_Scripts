##############################################################
# Function: Run Post-CTS Optimization in ICC2
# Created by
##############################################################

### legalization
legalize_placement -incremental

### connect pg
connect_pg_net -automatic

### update timing
update_timing -full

##############################################################
# END
##############################################################
