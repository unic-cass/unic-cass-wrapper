############################################################
# SDC for FSE-LMS
# Constraints derived from:
#  - RTL structure
#  - tb_top.v (simulation timing intent)
############################################################


###############	#############################################
# 1. CLOCK DEFINITIONS
############################################################

# Main system clock
# Defined in tb_top.v as:
#   forever #10 clkA = ~clkA;
# => Period = 10 ns (100 MHz)
create_clock -name clkA -period 20 [get_ports clkA]

# SPI clock (external, asynchronous)
# Defined in tb_top.v ~20 MHz
create_clock -name spi_sclk -period 100 [get_ports spi_sclk]


############################################################
# 2. CLOCK RELATIONSHIPS
############################################################

# clkA and spi_sclk are asynchronous clock domains
set_clock_groups -asynchronous \
    -group [get_clocks clkA] \
    -group [get_clocks spi_sclk]


############################################################
# 3. CLOCK QUALITY
############################################################

# Clock uncertainty (jitter + skew assumptions)
#set_clock_uncertainty 0.2 [get_clocks clkA]
#set_clock_uncertainty 0.5 [get_clocks spi_sclk]

# Clock transition times
#set_clock_transition 0.1 [get_clocks clkA]
#set_clock_transition 0.2 [get_clocks spi_sclk]


############################################################
# 4. RESET
############################################################

# Active-high asynchronous reset
# Used only for initialization, not part of functional timing
#set_false_path -from [get_ports reset]
#set_ideal_network [get_ports reset]


############################################################
# 5. INPUT DELAYS
############################################################

# Serial data input (synchronous to clkA)
#set_input_delay 5 -clock clkA [get_ports x_serial]

# SPI inputs (synchronous to spi_sclk)
#set_input_delay 10 -clock spi_sclk [get_ports spi_mosi]
#set_input_delay 10 -clock spi_sclk [get_ports spi_ss_n]


############################################################
# 6. OUTPUT DELAYS
###########################