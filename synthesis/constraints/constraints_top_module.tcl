##################################
# Input/Output Constraints File
##################################

####################
#### write clock
####################
set CLK_PERIOD_WRITE 10.00 
set CLK_LATENCY_WRITE 1.00
set CLK_SKEW_WRITE 0.50
set CLK_JITTER_WRITE 0.20
set SETUP_UNCERTAINTY_WRITE [expr $CLK_SKEW_WRITE + $CLK_JITTER_WRITE]
set INPUT_DELAY 1.00
set OUTPUT_DELAY 1.00

## Clock constraints
create_clock write_clk -period $CLK_PERIOD_WRITE -waveform {0.0 5.0}
set_clock_latency $CLK_LATENCY_WRITE write_clk
set_clock_uncertainty -setup $SETUP_UNCERTAINTY_WRITE write_clk
set_clock_uncertainty -hold $CLK_SKEW_WRITE write_clk
set_clock_transition -rise 0.1 write_clk
set_clock_transition -fall 0.12 write_clk

####################
#### read clock
####################
set CLK_PERIOD_READ 17.00 
set CLK_LATENCY_READ 1.00
set CLK_SKEW_READ 0.50
set CLK_JITTER_READ 0.20
set SETUP_UNCERTAINTY_READ [expr $CLK_SKEW_READ + $CLK_JITTER_READ]

## Clock constraints
create_clock read_clk -period $CLK_PERIOD_READ -waveform {0.0 8.5}
set_clock_latency $CLK_LATENCY_READ read_clk
set_clock_uncertainty -setup $SETUP_UNCERTAINTY_READ read_clk
set_clock_uncertainty -hold $CLK_SKEW_READ read_clk
set_clock_transition -rise 0.1 read_clk
set_clock_transition -fall 0.12 read_clk

####################
#### clock domain crossing
####################

# set false paths between clock domains because we are handling them with cdc circuitry
set_false_path -from [get_clocks write_clk] -to [get_clocks read_clk]
set_false_path -from [get_clocks read_clk] -to [get_clocks write_clk]

####################
#### input/output signals
####################

# Virtual clock for input/output signals
create_clock -name v_write_clk -period $CLK_PERIOD_WRITE -waveform {0.0 5.0}
create_clock -name v_read_clk -period $CLK_PERIOD_READ -waveform {0.0 8.5}

# Max transition/capacitance
set_max_transition 1.5 [current_design]
set_max_capacitance 0.5 [current_design]

# Input constraints
set_input_delay $INPUT_DELAY -clock v_write_clk [get_ports write_data[*]]
set_input_delay $INPUT_DELAY -clock v_write_clk [get_ports write_enable]
set_input_delay $INPUT_DELAY -clock v_read_clk [get_ports read_enable]
set_max_fanout 1 [all_inputs]
set_input_transition -rise 0.1 [all_inputs]
set_input_transition -fall 0.12 [all_inputs]

# Outputs constraints
set_output_delay $OUTPUT_DELAY -clock v_write_clk [get_ports full]
set_output_delay $OUTPUT_DELAY -clock v_read_clk [get_ports empty]
set_output_delay $OUTPUT_DELAY -clock v_read_clk [get_ports read_data[*]]
set_load 0.2 [all_outputs]
