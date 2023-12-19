##############################################################
# Function: Perform incremental legalization process
# Created by Mo'men Salah Alkady
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
