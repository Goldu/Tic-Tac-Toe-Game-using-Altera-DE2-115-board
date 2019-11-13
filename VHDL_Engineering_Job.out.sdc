## Generated SDC file "VHDL_Engineering_Job.out.sdc"

## Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, the Altera Quartus II License Agreement,
## the Altera MegaCore Function License Agreement, or other 
## applicable license agreement, including, without limitation, 
## that your use is for the sole purpose of programming logic 
## devices manufactured by Altera and sold by Altera or its 
## authorized distributors.  Please refer to the applicable 
## agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 14.0.0 Build 200 06/17/2014 SJ Web Edition"

## DATE    "Sun Sep 13 17:03:06 2015"

##
## DEVICE  "EP4CE115F29C7"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {CLK} -period 20.000 -waveform { 0.000 10.000 } [get_ports {sys_clk}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************



#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay  -clock [get_clocks {CLK}]  20.000 [get_ports {Key}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  20.000 [get_ports {SW[0]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  20.000 [get_ports {SW[1]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  20.000 [get_ports {SW[2]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  20.000 [get_ports {SW[3]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  20.000 [get_ports {SW[4]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  20.000 [get_ports {SW[5]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  20.000 [get_ports {SW[6]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  20.000 [get_ports {SW[7]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  20.000 [get_ports {SW[8]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  20.000 [get_ports {SW[9]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  20.000 [get_ports {SW[10]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  20.000 [get_ports {SW[11]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  20.000 [get_ports {SW[12]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  20.000 [get_ports {SW[13]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  20.000 [get_ports {SW[14]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  20.000 [get_ports {SW[15]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  20.000 [get_ports {SW[16]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  20.000 [get_ports {SW[17]}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {CLK}]  20.000 [get_ports {lysdiod_ut[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  20.000 [get_ports {lysdiod_ut[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  20.000 [get_ports {lysdiod_ut[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  20.000 [get_ports {lysdiod_ut[3]}]


#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

