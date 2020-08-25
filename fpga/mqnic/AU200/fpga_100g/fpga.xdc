############################################################################
##DISCLAIMER:
##  XILINX IS DISCLOSING THIS USER GUIDE, MANUAL, RELEASE NOTE,
##  SCHEMATIC, AND/OR SPECIFICATION (THE �DOCUMENTATION�)TO YOU SOLELY
##  FOR USE IN THE DEVELOPMENT OF DESIGNS TO OPERATE WITH XILINX
##  HARDWARE DEVICES. YOU MAY NOT REPRODUCE, DISTRIBUTE, REPUBLISH,
##  DOWNLOAD, DISPLAY, POST, OR TRANSMIT THE DOCUMENTATION IN ANY FORM
##  OR BY ANY MEANS INCLUDING, BUT NOT LIMITED TO, ELECTRONIC,
##  MECHANICAL, PHOTOCOPYING, RECORDING, OR OTHERWISE, WITHOUT THE
##  PRIOR WRITTEN CONSENT OF XILINX. XILINX EXPRESSLY DISCLAIMS ANY
##  LIABILITY ARISING OUT OF YOUR USE OF THE DOCUMENTATION.
##  XILINX RESERVES THE RIGHT, AT ITS SOLE DISCRETION, TO CHANGE THE
##  DOCUMENTATION WITHOUT NOTICE AT ANY TIME. XILINX ASSUMES NO
##  OBLIGATION TO CORRECT ANY ERRORS CONTAINED IN THE DOCUMENTATION,
##  OR TO ADVISE YOU OF ANY CORRECTIONS OR UPDATES. XILINX EXPRESSLY
##  DISCLAIMS ANY LIABILITY IN CONNECTION WITH TECHNICAL SUPPORT OR
##  ASSISTANCETHAT MAY BE PROVIDED TO YOU IN CONNECTION WITH THE
##  DOCUMENTATION.
##  THE DOCUMENTATION IS DISCLOSED TO YOU �AS-IS� WITH NO WARRANTY OF
##  ANY OF THIRD-PARTY RIGHTS. IN NO EVENT WILL XILINX BE LIABLE FOR ANY
##  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, OR
##  NONINFRINGEMENT STATUTORY, REGARDING THEDOCUMENTATION, INCLUDING
##  ANY WARRANTIES OF KIND.
##  XILINX MAKES NO OTHER WARRANTIES, WHETHER EXPRESS, IMPLIED, OR THE
##  DOCUMENTATION. INCLUDING ANY LOSS OF DATA OR LOST PROFITS, ARISING
##  FROM YOUR USE OF CONSEQUENTIAL, INDIRECT, EXEMPLARY, SPECIAL, OR
##  INCIDENTAL DAMAGES, INCLUDING ANY LOSS OF DATA OR LOST PROFITS,
##  ARISING FROM YOUR USE OF THE DOCUMENTATION.
##
##
##   AU200/250 - Master XDC
##
##       FPGA PIN reference are with respect to the U200 FPGA Bank naming
##            The FPGA A200 and A250 are pin for pin compatible devices.
##               +----------------+---------------+---------------+---------------+
##               | A250 Bank      | A200 Bank     | Usage         | Voltage       |
##               +----------------+---------------+---------------+---------------+
##               | Bank 61,62,63  | Bank 40,41,42 | DDR4 C0 Int.  | 1.2V          |
##               +----------------+---------------+---------------+---------------+
##               | Bank 65,66,67  | Bank 65,66,67 | DDR4 C1 Int.  | 1.2V          |
##               +----------------+---------------+---------------+---------------+
##               | Bank 69,70,71  | Bank 46,47,48 | DDR4 C2 Int.  | 1.2V          |
##               +----------------+---------------+---------------+---------------+
##               | Bank 72,73,74  | Bank 70,71,72 | DDR4 C3 Int.  | 1.2V          |
##               +----------------+---------------+---------------+---------------+
##               | Bank 64        | Bank 64       | Misc. IO      | 1.2V          |
##               +----------------+---------------+---------------+---------------+
##               | Bank 231       | Bank 231      | QSFP0         | NA            |
##               +----------------+---------------+---------------+---------------+
##               | Bank 230       | Bank 230      | QSFP1         | NA            |
##               +----------------+---------------+---------------+---------------+
##               | Bank 224-227   | Bank 224-227  | PCIE          | NA            |
##               +----------------+---------------+---------------+---------------+
##
##
##   Key Notes:
##       1) Power warning constraint set to warn user if design exceeds 160 Watts
##       3) Refer to XAPP1321 for DDR4 Self refresh and fast calibration.
##
##   Clock Trees
##
##    1) SI570 - SiLabs 570BAB000544DG @ 156.250Mhz Programmable Oscillator (Re-programming I2C access via Bank 64 I2C )
##
##      - OUT---> SI570_OUTPUT_P/SI570_OUTPUT_N @ 156.250Mhz LVDS
##           |
##           |--> SI53340-B-GM --> OUT0  USER_SI570_CLOCK_P/USER_SI570_CLOCK_N 156.250Mhz - General Perpose System Clock.
##                             |   PINS: IO_L12P_T1U_N10_GC_64_AU19/IO_L12N_T1U_N11_GC_64_AV19
##                             |
##                             |-> OUT1  Not Connected
##                             |   PINS: NA
##                             |
##                             |-> OUT2  MGT_SI570_CLOCK0_C_P/MGT_SI570_CLOCK0_C_N 156.250Mhz - QSFP0 REFCLK0
##                             |   PINS: MGTREFCLK0P_231_M11/MGTREFCLK0N_231_M10
##                             |
##                             |-> OUT3  MGT_SI570_CLOCK1_C_P/MGT_SI570_CLOCK1_C_N 156.250Mhz - QSFP0 REFCLK1
##                                 PINS: MGTREFCLK0P_230_T11/MGTREFCLK0N_230_T10
##
##    2) SI335A - SiLabs SI5335A-B06201-GM Selectable output Oscillator 156.2500Mhz/161.1328125Mhz For QSFP0 REFCLK1
##
##      - FS[1:0] <-- Clock Select Pin FS[1:0] = 1X -> 161.132812 MHz 1.8V LVDS (default when FPGA pin Hi-Z due to 10K pullups)
##                                     FS[1:0] = 01 -> 156.250000 MHz 1.8V LVDS
##                PINS: "QSFP0_FS[0]"         - IO_L10P_T1U_N6_QBC_AD4P_64_AT20
##                PINS: "QSFP0_FS[1]"         - IO_L9N_T1L_N5_AD12N_64_AU22
##
##      - RESET <-- Device Reset - Asserting this pin (driving high) is required to change FS1,FS0 pin setting.
##                PINS: "QSFP0_RECLK_RESET"   - IO_L9P_T1L_N4_AD12P_64_AT22
##
##      - OUT0--> SYSCLK_300_P/SYSCLK_300_N @ 300.0000Mhz to 1-to-4 Clock buffer (Fixed and Unchanged by FS[1:0])
##           |
##           |--> SI53340-B-GM --> OUT0  SYSCLK0_300_P/SYSCLK0_300_N 300.000Mhz - System Clock for first DDR4 MIG interface
##                             |   PINS: IO_L13P_T2L_N0_GC_QBC_63_AY37/IO_L13N_T2L_N1_GC_QBC_63_AY38
##                             |
##                             |-> OUT1  SYSCLK1_300_P/SYSCLK1_300_N 300.000Mhz - System Clock for second DDR4 MIG interface.
##                             |   PINS: IO_L11P_T1U_N8_GC_64_AW20/IO_L11N_T1U_N9_GC_64_AW19
##                             |
##                             |-> OUT2  SYSCLK2_300_P/SYSCLK2_300_N 300.000Mhz - System Clock for third DDR4 MIG interface.
##                             |   PINS: IO_L13P_T2L_N0_GC_QBC_70_F32/IO_L13N_T2L_N1_GC_QBC_70_E32
##                             |
##                             |-> OUT3  SYSCLK3_300_P/SYSCLK3_300_N 300.000Mhz - System Clock for fourth DDR4 MIG interface.
##                                 PINS: IO_L13P_T2L_N0_GC_QBC_72_J16/IO_L13N_T2L_N1_GC_QBC_72_H16
##
##
##      - OUT1--> QSFP0_CLOCK_P/QSFP0_CLOCK_N @ 161.1328125Mhz (Selectable based on state of FS[1:0])
##                PINS: MGTREFCLK1P_231_K11/MGTREFCLK1N_231_K10
##
##      - OUT2--> QSFP0_CLOCK_P/QSFP0_CLOCK_N @ 90.0000Mhz (Fixed and Unchanged by FS[1:0])
##                PINS: Not Connected
##
##      - OUT3--> QSFP0_CLOCK_P/QSFP0_CLOCK_N @ 33.0000Mhz (Fixed and Unchanged by FS[1:0])
##                PINS: Not Connected
##
##    3) SI335A - SiLabs SI5335A-B06201-GM Selectable output Oscillator 156.2500Mhz/161.1328125Mhz For QSFP1 REFCLK1
##
##      - FS[1:0] <-- Clock Select Pin FS[1:0] = 1X -> 161.132812 MHz 1.8V LVDS (default when FPGA pin Hi-Z due to 10K pullups)
##                                     FS[1:0] = 01 -> 156.250000 MHz 1.8V LVDS
##                PINS: "QSFP1_FS[0]"         - IO_L8P_T1L_N2_AD5P_64_AR22
##                PINS: "QSFP1_FS[1]"         - IO_L7N_T1L_N1_QBC_AD13N_64_AU20
##
##      - RESET <-- Device Reset - Asserting this pin (driving high) is required to change FS1,FS0 pin setting.
##                PINS: "QSFP1_RECLK_RESET"   - IO_L8N_T1L_N3_AD5N_64_AR21
##
##      - OUT0--> 300.0000Mhz (Fixed and Unchanged by FS[1:0])
##                PINS: Not Connected
##
##      - OUT1--> QSFP1_CLOCK_P/QSFP1_CLOCK_N @ 161.1328125Mhz (Selectable based on state of FS[1:0])
##                PINS: MGTREFCLK1P_230_P11/MGTREFCLK1N_230_P10
##
##      - OUT2--> 90.0000Mhz (Fixed and Unchanged by FS[1:0])
##                PINS: Not Connected
##
##      - OUT3--> 33.0000Mhz (Fixed and Unchanged by FS[1:0])
##                PINS: Not Connected
##
##   4) PCIE Fingers PEX_REFCLK_P/PEX_REFCLK_P 100.000Mhz
##           PINS: MGTREFCLK0P_226_AM11/MGTREFCLK0N_226_AM10
##
##  Revision 1.00 - Intial Release for AU200/250
##  Revision 2.00 - Updated XDC with card details.
##  Revision 2.01 - Fixed modified QSFP1 IO Standards from POD12_DCI to LVCMOS18
##                  Added Configuration Constraints
##  Revision 2.02 - Fixed Bank 64 IOstandards from LVCMOS18 to LVCMOS12.
##
#################################################################################
# Bitstream Generation for QSPI
set_property CONFIG_VOLTAGE 1.8 [current_design]
set_property BITSTREAM.CONFIG.CONFIGFALLBACK Enable [current_design]
set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN disable [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 63.8 [current_design]
#set_property BITSTREAM.CONFIG.CONFIGRATE 85.0          [current_design]                 ;# Customer can try but may not be reliable over all conditions.
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]
set_property BITSTREAM.CONFIG.SPI_OPCODE 8'h6B [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR Yes [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN Pullup [current_design]

#
# Power Constraint to warn User if Design will possibly be over cards power limit, this assume the 2x4 PCIe AUX power is connected to the board.
#
set_operating_conditions -design_power_budget 160

# LEDs
set_property PACKAGE_PIN BC21 [get_ports status_led0_fpga]
set_property PACKAGE_PIN BB21 [get_ports status_led1_fpga]
set_property PACKAGE_PIN BA20 [get_ports status_led2_fpga]

set_property PACKAGE_PIN AL20 [get_ports cpu_reset_fpga_n]
set_property PACKAGE_PIN AM11 [get_ports pcie_refclk_p]

set_property IOSTANDARD LVCMOS12 [get_ports cpu_reset_fpga_n]
set_property IOSTANDARD LVCMOS12 [get_ports status_led0_fpga]
set_property IOSTANDARD LVCMOS12 [get_ports status_led1_fpga]
set_property IOSTANDARD LVCMOS12 [get_ports status_led2_fpga]

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
set_property PACKAGE_PIN M10 [get_ports qsfp0_mgt_refclk_0_n]; # Bank 231 Net "MGT_SI570_CLOCK0_C_N" - MGTREFCLK0N_231
set_property PACKAGE_PIN M11 [get_ports qsfp0_mgt_refclk_0_p]; # Bank 231 Net "MGT_SI570_CLOCK0_C_P" - MGTREFCLK0P_231

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

# TODO needed?
#create_clock -period 10 -name pcie_mgt_refclk_1 [get_ports pcie_refclk_p]