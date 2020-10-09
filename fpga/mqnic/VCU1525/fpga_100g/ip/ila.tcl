create_ip -name ila -vendor xilinx.com -library ip -module_name ila_axis

set_property -dict [list \
    CONFIG.C_NUM_OF_PROBES {6} \
    CONFIG.C_TRIGOUT_EN {TRUE} \
    CONFIG.C_TRIGIN_EN {TRUE} \
    CONFIG.C_PROBE0_WIDTH {256} \
    CONFIG.C_PROBE1_WIDTH {8} \
    CONFIG.C_PROBE2_WIDTH {1} \
    CONFIG.C_PROBE3_WIDTH {1} \
    CONFIG.C_PROBE4_WIDTH {1} \
    CONFIG.C_PROBE5_WIDTH {60}
] [get_ips ila_axis]

# create_ip -name ila -vendor xilinx.com -library ip -module_name ila_axis_desc

# set_property -dict [list \
#     CONFIG.C_NUM_OF_PROBES {6} \
#     CONFIG.C_TRIGOUT_EN {TRUE} \
#     CONFIG.C_TRIGIN_EN {TRUE} \
#     CONFIG.C_PROBE0_WIDTH {59} \
#     CONFIG.C_PROBE1_WIDTH {1} \
#     CONFIG.C_PROBE2_WIDTH {1} \
#     CONFIG.C_PROBE3_WIDTH {1} \
#     CONFIG.C_PROBE4_WIDTH {31} \
#     CONFIG.C_PROBE5_WIDTH {1}
# ] [get_ips ila_axis_desc]

create_ip -name ila -vendor xilinx.com -library ip -module_name ila_ram

set_property -dict [list \
    CONFIG.C_NUM_OF_PROBES {6} \
    CONFIG.C_TRIGOUT_EN {TRUE} \
    CONFIG.C_TRIGIN_EN {TRUE} \
    CONFIG.C_PROBE0_WIDTH {2} \
    CONFIG.C_PROBE1_WIDTH {1} \
    CONFIG.C_PROBE2_WIDTH {2} \
    CONFIG.C_PROBE3_WIDTH {10} \
    CONFIG.C_PROBE4_WIDTH {10} \
    CONFIG.C_PROBE5_WIDTH {256}
] [get_ips ila_ram]

create_ip -name ila -vendor xilinx.com -library ip -module_name ila_packet

set_property -dict [list \
    CONFIG.C_NUM_OF_PROBES {2} \
    CONFIG.C_TRIGOUT_EN {TRUE} \
    CONFIG.C_TRIGIN_EN {TRUE} \
    CONFIG.C_PROBE0_WIDTH {256} \
    CONFIG.C_PROBE1_WIDTH {1} \
] [get_ips ila_packet]