#!/bin/sh

rm -rf obj_dir
rm -f counter.vcd

# Compile verilator
verilator -Wall --cc --trace top.sv counter.sv bin2bcd.sv --exe top_tb.cpp

#make the Vcounter
make -j -C obj_dir/ -f Vtop.mk Vtop

#run the object
sudo obj_dir/Vtop
