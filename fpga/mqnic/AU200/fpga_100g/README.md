# Corundum mqnic for Alveo U200

## Introduction

This design targets the Xilinx Alveo U200 FPGA board.

* FPGA: xcu200-fsgd2104-2-e
* MAC: Xilinx 100G CMAC
* PHY: 100G CAUI-4 CMAC and internal GTY transceivers

## How to build

Run make to build.  Ensure that the Xilinx Vivado toolchain components are
in PATH.

Run make to build the driver.  Ensure the headers for the running kernel are
installed, otherwise the driver cannot be compiled.

## How to test

Run make program to program the Alveo U50 board with Vivado.  Then load the
driver with insmod mqnic.ko.  Check dmesg for output from driver
initialization.

### Testing with ping

Make sure if routing entry and ARP entry on both sender and receiver sides has 
been properly set, if problems like below happens. (FYI. These are actually basic 
networking issues)

* Receiver has received ICMP echo request, but reply packets are not being sent.
* Sender received ICMP echo reply packets, but ping process does not print anything.

```shell
# Assuming sender's MAC address is 00:00:00:00, and IP address is 10.50.0.1,
# and receiver's MAC address is 00:00:00:01. and IP address is 10.50.1.1, and both 
# are cross connected

# Receiver side
root@host:~# ifconfig eth0 10.50.0.1/24
root@host:~# ip route add 10.50.1.1 dev eth0
root@host:~# arp -i eth0 -s 10.50.1.1 00:00:00:01

# Sender side
root@host:~# ifconfig eth0 10.50.1.1/24
root@host:~# ip route add 10.50.0.1 dev eth0
root@host:~# arp -i eth0 -s 10.50.0.1 00:00:00:00
```
