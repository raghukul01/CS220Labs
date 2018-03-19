
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name Lab7_2 -dir "/media/raghukul/Raghu/Lab7_2/planAhead_run_5" -part xc3s500efg320-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/media/raghukul/Raghu/Lab7_2/top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/media/raghukul/Raghu/Lab7_2} }
set_property target_constrs_file "top.ucf" [current_fileset -constrset]
add_files [list {top.ucf}] -fileset [get_property constrset [current_run]]
link_design
