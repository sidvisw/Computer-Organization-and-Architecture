
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name Assignment3_CLA -dir "/home/siddharth/Desktop/COA/Assignment_3/Assignment3_CLA/planAhead_run_1" -part xc7a100tcsg324-1
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/home/siddharth/Desktop/COA/Assignment_3/Assignment3_CLA/wrapper_CLA_16bit.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/siddharth/Desktop/COA/Assignment_3/Assignment3_CLA} }
set_property target_constrs_file "timing.ucf" [current_fileset -constrset]
add_files [list {timing.ucf}] -fileset [get_property constrset [current_run]]
link_design
