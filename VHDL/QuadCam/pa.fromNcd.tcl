
# PlanAhead Launch Script for Post PAR Floorplanning, created by Project Navigator

create_project -name QuadCam -dir "D:/Dropbox/Capstone/QuadCam/VHDL/QuadCam/planAhead_run_1" -part xc6slx9ftg256-2
set srcset [get_property srcset [current_run -impl]]
set_property design_mode GateLvl $srcset
set_property edif_top_file "D:/Dropbox/Capstone/QuadCam/VHDL/QuadCam/example_top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/Dropbox/Capstone/QuadCam/VHDL/QuadCam} }
set_property target_constrs_file "example_top.ucf" [current_fileset -constrset]
add_files [list {example_top.ucf}] -fileset [get_property constrset [current_run]]
link_design
read_xdl -file "D:/Dropbox/Capstone/QuadCam/VHDL/QuadCam/example_top.ncd"
if {[catch {read_twx -name results_1 -file "D:/Dropbox/Capstone/QuadCam/VHDL/QuadCam/example_top.twx"} eInfo]} {
   puts "WARNING: there was a problem importing \"D:/Dropbox/Capstone/QuadCam/VHDL/QuadCam/example_top.twx\": $eInfo"
}
