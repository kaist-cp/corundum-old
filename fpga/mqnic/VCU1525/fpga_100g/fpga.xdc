# Bitstream Generation for QSPI                              
set_property CONFIG_VOLTAGE 1.8                        [current_design]
set_property BITSTREAM.CONFIG.CONFIGFALLBACK Enable    [current_design]                  ;# Golden image is the fall back image if  new bitstream is corrupted.    
set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN disable [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 63.8          [current_design] 
#set_property BITSTREAM.CONFIG.CONFIGRATE 85.0          [current_design]                 ;# Customer can try but may not be reliable over all conditions.
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4           [current_design]  
set_property BITSTREAM.GENERAL.COMPRESS TRUE           [current_design]  
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES        [current_design]
set_property BITSTREAM.CONFIG.SPI_OPCODE 8'h6B         [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR Yes       [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN Pullup         [current_design]

set_property -dict {PACKAGE_PIN BC21 IOSTANDARD LVCMOS12       } [get_ports {led[0]}  ]; # Bank 64 VCCO - VCC1V2 Net "STATUS_LED0_FPGA"    - IO_L17N_T2U_N9_AD10N_64
set_property -dict {PACKAGE_PIN BB21 IOSTANDARD LVCMOS12       } [get_ports {led[1]}  ]; # Bank 64 VCCO - VCC1V2 Net "STATUS_LED1_FPGA"    - IO_L17P_T2U_N8_AD10P_64
set_property -dict {PACKAGE_PIN BA20 IOSTANDARD LVCMOS12       } [get_ports {led[2]}  ]; # Bank 64 VCCO - VCC1V2 Net "STATUS_LED2_FPGA"    - IO_L16N_T2U_N7_QBC_AD3N_64

# TODO
# DIP switches
set_property -dict {LOC AN22 IOSTANDARD LVCMOS12} [get_ports {sw[0]}]
set_property -dict {LOC AM19 IOSTANDARD LVCMOS12} [get_ports {sw[1]}]
set_property -dict {LOC AL19 IOSTANDARD LVCMOS12} [get_ports {sw[2]}]
set_property -dict {LOC AP20 IOSTANDARD LVCMOS12} [get_ports {sw[3]}]

#
# QSFP28 Interfaces (QSFP0)
#
set_property PACKAGE_PIN N3  [get_ports qsfp0_rx1_n]; # Bank 231  - MGTYRXN0_231
set_property PACKAGE_PIN N4  [get_ports qsfp0_rx1_p]; # Bank 231  - MGTYRXP0_231
set_property PACKAGE_PIN M1  [get_ports qsfp0_rx2_n]; # Bank 231  - MGTYRXN1_231
set_property PACKAGE_PIN M2  [get_ports qsfp0_rx2_p]; # Bank 231  - MGTYRXP1_231
set_property PACKAGE_PIN L3  [get_ports qsfp0_rx3_n]; # Bank 231  - MGTYRXN2_231
set_property PACKAGE_PIN L4  [get_ports qsfp0_rx3_p]; # Bank 231  - MGTYRXP2_231
set_property PACKAGE_PIN K1  [get_ports qsfp0_rx4_n]; # Bank 231  - MGTYRXN3_231
set_property PACKAGE_PIN K2  [get_ports qsfp0_rx4_p]; # Bank 231  - MGTYRXP3_231
set_property PACKAGE_PIN N8  [get_ports qsfp0_tx1_n]; # Bank 231  - MGTYTXN0_231
set_property PACKAGE_PIN N9  [get_ports qsfp0_tx1_p]; # Bank 231  - MGTYTXP0_231
set_property PACKAGE_PIN M6  [get_ports qsfp0_tx2_n]; # Bank 231  - MGTYTXN1_231
set_property PACKAGE_PIN M7  [get_ports qsfp0_tx2_p]; # Bank 231  - MGTYTXP1_231
set_property PACKAGE_PIN L8  [get_ports qsfp0_tx3_n]; # Bank 231  - MGTYTXN2_231
set_property PACKAGE_PIN L9  [get_ports qsfp0_tx3_p]; # Bank 231  - MGTYTXP2_231
set_property PACKAGE_PIN K6  [get_ports qsfp0_tx4_n]; # Bank 231  - MGTYTXN3_231
set_property PACKAGE_PIN K7  [get_ports qsfp0_tx4_p]; # Bank 231  - MGTYTXP3_231
set_property PACKAGE_PIN K10 [get_ports qsfp0_mgt_refclk_1_n]; # Bank 231 Net "QSFP0_CLOCK_N"        - MGTREFCLK1N_231
set_property PACKAGE_PIN K11 [get_ports qsfp0_mgt_refclk_1_p]; # Bank 231 Net "QSFP0_CLOCK_P"        - MGTREFCLK1P_231
set_property -dict {PACKAGE_PIN BE17 IOSTANDARD LVCMOS12       } [get_ports qsfp0_resetl      ]; # Bank 64 VCCO - VCC1V2 Net "QSFP0_RESETL_LS"     - IO_L22P_T3U_N6_DBC_AD0P_64
set_property -dict {PACKAGE_PIN BE20 IOSTANDARD LVCMOS12       } [get_ports qsfp0_modprsl     ]; # Bank 64 VCCO - VCC1V2 Net "QSFP0_MODPRSL_LS"    - IO_L21N_T3L_N5_AD8N_64
set_property -dict {PACKAGE_PIN BE21 IOSTANDARD LVCMOS12       } [get_ports qsfp0_intl        ]; # Bank 64 VCCO - VCC1V2 Net "QSFP0_INTL_LS"       - IO_L21P_T3L_N4_AD8P_64
set_property -dict {PACKAGE_PIN BD18 IOSTANDARD LVCMOS12       } [get_ports qsfp0_lpmode      ]; # Bank 64 VCCO - VCC1V2 Net "QSFP0_LPMODE_LS"     - IO_L20N_T3L_N3_AD1N_64
set_property -dict {PACKAGE_PIN BE16 IOSTANDARD LVCMOS12       } [get_ports qsfp0_modsell     ]; # Bank 64 VCCO - VCC1V2 Net "QSFP0_MODSELL_LS"    - IO_L22N_T3U_N7_DBC_AD0N_64
set_property -dict {PACKAGE_PIN AT20 IOSTANDARD LVCMOS12       } [get_ports {qsfp0_fs[0]}     ]; # Bank 64 VCCO - VCC1V2 Net "QSFP0_FS0"           - IO_L10P_T1U_N6_QBC_AD4P_64
set_property -dict {PACKAGE_PIN AU22 IOSTANDARD LVCMOS12       } [get_ports {qsfp0_fs[1]}     ]; # Bank 64 VCCO - VCC1V2 Net "QSFP0_FS1"           - IO_L9N_T1L_N5_AD12N_64
set_property -dict {PACKAGE_PIN AT22 IOSTANDARD LVCMOS12       } [get_ports qsfp0_refclk_reset]; # Bank 64 VCCO - VCC1V2 Net "QSFP0_REFCLK_RESET"  - IO_L9P_T1L_N4_AD12P_64


#
# QSFP28 Interfaces (QSFP1)
#
set_property PACKAGE_PIN U3  [get_ports qsfp1_rx1_n]; # Bank 230  - MGTYRXN0_230
set_property PACKAGE_PIN U4  [get_ports qsfp1_rx1_p]; # Bank 230  - MGTYRXP0_230
set_property PACKAGE_PIN T1  [get_ports qsfp1_rx2_n]; # Bank 230  - MGTYRXN1_230
set_property PACKAGE_PIN T2  [get_ports qsfp1_rx2_p]; # Bank 230  - MGTYRXP1_230
set_property PACKAGE_PIN R3  [get_ports qsfp1_rx3_n]; # Bank 230  - MGTYRXN2_230
set_property PACKAGE_PIN R4  [get_ports qsfp1_rx3_p]; # Bank 230  - MGTYRXP2_230
set_property PACKAGE_PIN P1  [get_ports qsfp1_rx4_n]; # Bank 230  - MGTYRXN3_230
set_property PACKAGE_PIN P2  [get_ports qsfp1_rx4_p]; # Bank 230  - MGTYRXP3_230
set_property PACKAGE_PIN U8  [get_ports qsfp1_tx1_n]; # Bank 230  - MGTYTXN0_230
set_property PACKAGE_PIN U9  [get_ports qsfp1_tx1_p]; # Bank 230  - MGTYTXP0_230
set_property PACKAGE_PIN T6  [get_ports qsfp1_tx2_n]; # Bank 230  - MGTYTXN1_230
set_property PACKAGE_PIN T7  [get_ports qsfp1_tx2_p]; # Bank 230  - MGTYTXP1_230
set_property PACKAGE_PIN R8  [get_ports qsfp1_tx3_n]; # Bank 230  - MGTYTXN2_230
set_property PACKAGE_PIN R9  [get_ports qsfp1_tx3_p]; # Bank 230  - MGTYTXP2_230
set_property PACKAGE_PIN P6  [get_ports qsfp1_tx4_n]; # Bank 230  - MGTYTXN3_230
set_property PACKAGE_PIN P7  [get_ports qsfp1_tx4_p]; # Bank 230  - MGTYTXP3_230
set_property PACKAGE_PIN P10 [get_ports qsfp1_mgt_refclk_1_n]; # Bank 230 Net "QSFP1_CLOCK_N"        - MGTREFCLK1N_230
set_property PACKAGE_PIN P11 [get_ports qsfp1_mgt_refclk_1_p]; # Bank 230 Net "QSFP1_CLOCK_P"        - MGTREFCLK1P_230

set_property -dict {PACKAGE_PIN BC18 IOSTANDARD LVCMOS12      } [get_ports qsfp1_resetl      ]; # Bank 64 VCCO - VCC1V2 Net "QSFP1_RESETL_LS"     - IO_L15N_T2L_N5_AD11N_64
set_property -dict {PACKAGE_PIN BC19 IOSTANDARD LVCMOS12      } [get_ports qsfp1_modprsl     ]; # Bank 64 VCCO - VCC1V2 Net "QSFP1_MODPRSL_LS"    - IO_L15P_T2L_N4_AD11P_64
set_property -dict {PACKAGE_PIN AV21 IOSTANDARD LVCMOS12      } [get_ports qsfp1_intl       ]; # Bank 64 VCCO - VCC1V2 Net "QSFP1_INTL_LS"       - IO_L14N_T2L_N3_GC_64
set_property -dict {PACKAGE_PIN AV22 IOSTANDARD LVCMOS12      } [get_ports qsfp1_lpmode      ]; # Bank 64 VCCO - VCC1V2 Net "QSFP1_LPMODE_LS"     - IO_L14P_T2L_N2_GC_64
set_property -dict {PACKAGE_PIN AY20 IOSTANDARD LVCMOS12      } [get_ports qsfp1_modsell     ]; # Bank 64 VCCO - VCC1V2 Net "QSFP1_MODSELL_LS"    - IO_L16P_T2U_N6_QBC_AD3P_64
set_property -dict {PACKAGE_PIN AR22 IOSTANDARD LVCMOS12       } [get_ports {qsfp1_fs[0]}    ]; # Bank 64 VCCO - VCC1V2 Net "QSFP1_FS0"           - IO_L8P_T1L_N2_AD5P_64
set_property -dict {PACKAGE_PIN AU20 IOSTANDARD LVCMOS12       } [get_ports {qsfp1_fs[1]}    ]; # Bank 64 VCCO - VCC1V2 Net "QSFP1_FS1"           - IO_L7N_T1L_N1_QBC_AD13N_64
set_property -dict {PACKAGE_PIN AR21 IOSTANDARD LVCMOS12       } [get_ports qsfp1_refclk_reset]; # Bank 64 VCCO - VCC1V2 Net "QSFP1_REFCLK_RESET"  - IO_L8N_T1L_N3_AD5N_64

# I2C
set_property -dict {PACKAGE_PIN BF20 IOSTANDARD LVCMOS12       } [get_ports i2c_scl      ]; # Bank 64 VCCO - VCC1V2 Net "I2C_FPGA_SCL_LS"     - IO_L19P_T3L_N0_DBC_AD9P_64
set_property -dict {PACKAGE_PIN BF17 IOSTANDARD LVCMOS12       } [get_ports i2c_sda      ]; # Bank 64 VCCO - VCC1V2 Net "I2C_FPGA_SDA_LS"     - IO_T2U_N12_64

# PCIe 
set_property PACKAGE_PIN AF1 [get_ports {pcie_rx_n[0]}  ]; # Bank 227  - MGTYrxN3_227
set_property PACKAGE_PIN AF2 [get_ports {pcie_rx_p[0]}  ]; # Bank 227  - MGTYrxP3_227
set_property PACKAGE_PIN AG3 [get_ports {pcie_rx_n[1]}  ]; # Bank 227  - MGTYrxN2_227
set_property PACKAGE_PIN AG4 [get_ports {pcie_rx_p[1]}  ]; # Bank 227  - MGTYrxP2_227
set_property PACKAGE_PIN AH1 [get_ports {pcie_rx_n[2]}  ]; # Bank 227  - MGTYrxN1_227
set_property PACKAGE_PIN AH2 [get_ports {pcie_rx_p[2]}  ]; # Bank 227  - MGTYrxP1_227
set_property PACKAGE_PIN AJ3 [get_ports {pcie_rx_n[3]}  ]; # Bank 227  - MGTYrxN0_227
set_property PACKAGE_PIN AJ4 [get_ports {pcie_rx_p[3]}  ]; # Bank 227  - MGTYrxP0_227
set_property PACKAGE_PIN AF6 [get_ports {pcie_tx_n[0]}  ]; # Bank 227  - MGTYtxN3_227
set_property PACKAGE_PIN AF7 [get_ports {pcie_tx_p[0]}  ]; # Bank 227  - MGTYtxP3_227
set_property PACKAGE_PIN AG8 [get_ports {pcie_tx_n[1]}  ]; # Bank 227  - MGTYtxN2_227
set_property PACKAGE_PIN AG9 [get_ports {pcie_tx_p[1]}  ]; # Bank 227  - MGTYtxP2_227
set_property PACKAGE_PIN AH6 [get_ports {pcie_tx_n[2]}  ]; # Bank 227  - MGTYtxN1_227
set_property PACKAGE_PIN AH7 [get_ports {pcie_tx_p[2]}  ]; # Bank 227  - MGTYtxP1_227
set_property PACKAGE_PIN AJ8 [get_ports {pcie_tx_n[3]}  ]; # Bank 227  - MGTYtxN0_227
set_property PACKAGE_PIN AJ9 [get_ports {pcie_tx_p[3]}  ]; # Bank 227  - MGTYtxP0_227
set_property PACKAGE_PIN AK1 [get_ports {pcie_rx_n[4]}  ]; # Bank 226  - MGTYrxN3_226
set_property PACKAGE_PIN AK2 [get_ports {pcie_rx_p[4]}  ]; # Bank 226  - MGTYrxP3_226
set_property PACKAGE_PIN AL3 [get_ports {pcie_rx_n[5]}  ]; # Bank 226  - MGTYrxN2_226
set_property PACKAGE_PIN AL4 [get_ports {pcie_rx_p[5]}  ]; # Bank 226  - MGTYrxP2_226
set_property PACKAGE_PIN AM1 [get_ports {pcie_rx_n[6]}  ]; # Bank 226  - MGTYrxN1_226
set_property PACKAGE_PIN AM2 [get_ports {pcie_rx_p[6]}  ]; # Bank 226  - MGTYrxP1_226
set_property PACKAGE_PIN AN3 [get_ports {pcie_rx_n[7]}  ]; # Bank 226  - MGTYrxN0_226
set_property PACKAGE_PIN AN4 [get_ports {pcie_rx_p[7]}  ]; # Bank 226  - MGTYrxP0_226
set_property PACKAGE_PIN AK6 [get_ports {pcie_tx_n[4]}  ]; # Bank 226  - MGTYtxN3_226
set_property PACKAGE_PIN AK7 [get_ports {pcie_tx_p[4]}  ]; # Bank 226  - MGTYtxP3_226
set_property PACKAGE_PIN AL8 [get_ports {pcie_tx_n[5]}  ]; # Bank 226  - MGTYtxN2_226
set_property PACKAGE_PIN AL9 [get_ports {pcie_tx_p[5]}  ]; # Bank 226  - MGTYtxP2_226
set_property PACKAGE_PIN AM6 [get_ports {pcie_tx_n[6]}  ]; # Bank 226  - MGTYtxN1_226
set_property PACKAGE_PIN AM7 [get_ports {pcie_tx_p[6]}  ]; # Bank 226  - MGTYtxP1_226
set_property PACKAGE_PIN AN8 [get_ports {pcie_tx_n[7]}  ]; # Bank 226  - MGTYtxN0_226
set_property PACKAGE_PIN AN9 [get_ports {pcie_tx_p[7]}  ]; # Bank 226  - MGTYtxP0_226
set_property PACKAGE_PIN AT1 [get_ports {pcie_rx_n[10]} ]; # Bank 225  - MGTYrxN1_225
set_property PACKAGE_PIN AT2 [get_ports {pcie_rx_p[10]} ]; # Bank 225  - MGTYrxP1_225
set_property PACKAGE_PIN AU3 [get_ports {pcie_rx_n[11]} ]; # Bank 225  - MGTYrxN0_225
set_property PACKAGE_PIN AU4 [get_ports {pcie_rx_p[11]} ]; # Bank 225  - MGTYrxP0_225
set_property PACKAGE_PIN AP1 [get_ports {pcie_rx_n[8]}  ]; # Bank 225  - MGTYrxN3_225
set_property PACKAGE_PIN AP2 [get_ports {pcie_rx_p[8]}  ]; # Bank 225  - MGTYrxP3_225
set_property PACKAGE_PIN AR3 [get_ports {pcie_rx_n[9]}  ]; # Bank 225  - MGTYrxN2_225
set_property PACKAGE_PIN AR4 [get_ports {pcie_rx_p[9]}  ]; # Bank 225  - MGTYrxP2_225
set_property PACKAGE_PIN AT6 [get_ports {pcie_tx_n[10]} ]; # Bank 225  - MGTYtxN1_225
set_property PACKAGE_PIN AT7 [get_ports {pcie_tx_p[10]} ]; # Bank 225  - MGTYtxP1_225
set_property PACKAGE_PIN AU8 [get_ports {pcie_tx_n[11]} ]; # Bank 225  - MGTYtxN0_225
set_property PACKAGE_PIN AU9 [get_ports {pcie_tx_p[11]} ]; # Bank 225  - MGTYtxP0_225
set_property PACKAGE_PIN AP6 [get_ports {pcie_tx_n[8]}  ]; # Bank 225  - MGTYtxN3_225
set_property PACKAGE_PIN AP7 [get_ports {pcie_tx_p[8]}  ]; # Bank 225  - MGTYtxP3_225
set_property PACKAGE_PIN AR8 [get_ports {pcie_tx_n[9]}  ]; # Bank 225  - MGTYtxN2_225
set_property PACKAGE_PIN AR9 [get_ports {pcie_tx_p[9]}  ]; # Bank 225  - MGTYtxP2_225
set_property PACKAGE_PIN AV1 [get_ports {pcie_rx_n[12]} ]; # Bank 224  - MGTYrxN3_224
set_property PACKAGE_PIN AV2 [get_ports {pcie_rx_p[12]} ]; # Bank 224  - MGTYrxP3_224
set_property PACKAGE_PIN AW3 [get_ports {pcie_rx_n[13]} ]; # Bank 224  - MGTYrxN2_224
set_property PACKAGE_PIN AW4 [get_ports {pcie_rx_p[13]} ]; # Bank 224  - MGTYrxP2_224
set_property PACKAGE_PIN BA1 [get_ports {pcie_rx_n[14]} ]; # Bank 224  - MGTYrxN1_224
set_property PACKAGE_PIN BA2 [get_ports {pcie_rx_p[14]} ]; # Bank 224  - MGTYrxP1_224
set_property PACKAGE_PIN BC1 [get_ports {pcie_rx_n[15]} ]; # Bank 224  - MGTYrxN0_224
set_property PACKAGE_PIN BC2 [get_ports {pcie_rx_p[15]} ]; # Bank 224  - MGTYrxP0_224
set_property PACKAGE_PIN AV6 [get_ports {pcie_tx_n[12]} ]; # Bank 224  - MGTYtxN3_224
set_property PACKAGE_PIN AV7 [get_ports {pcie_tx_p[12]} ]; # Bank 224  - MGTYtxP3_224
set_property PACKAGE_PIN BB4 [get_ports {pcie_tx_n[13]} ]; # Bank 224  - MGTYtxN2_224
set_property PACKAGE_PIN BB5 [get_ports {pcie_tx_p[13]} ]; # Bank 224  - MGTYtxP2_224
set_property PACKAGE_PIN BD4 [get_ports {pcie_tx_n[14]} ]; # Bank 224  - MGTYtxN1_224
set_property PACKAGE_PIN BD5 [get_ports {pcie_tx_p[14]} ]; # Bank 224  - MGTYtxP1_224
set_property PACKAGE_PIN BF4 [get_ports {pcie_tx_n[15]} ]; # Bank 224  - MGTYtxN0_224
set_property PACKAGE_PIN BF5 [get_ports {pcie_tx_p[15]} ]; # Bank 224  - MGTYtxP0_224
set_property PACKAGE_PIN AM10             [get_ports pcie_refclk_n ]; # Bank 226 Net "PEX_REFCLK_C_N" - MGTREFCLK0N_226
set_property PACKAGE_PIN AM11             [get_ports pcie_refclk_p ]; # Bank 226 Net "PEX_REFCLK_C_P" - MGTREFCLK0P_226
set_property -dict {PACKAGE_PIN BD21 IOSTANDARD LVCMOS12       } [get_ports pcie_reset_n        ]; # Bank 64 VCCO - VCC1V2 Net "PCIE_PERST_LS"       - IO_L23P_T3U_N8_64

create_clock -period 10 -name pcie_mgt_refclk_1 [get_ports pcie_refclk_p]
