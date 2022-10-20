#!/bin/sh

rm -rf obj_dir
rm -f counter.vcd

# Compile verilator
verilator -Wall --cc --trace counter.sv --exe counter_tb.cpp

#make the Vcounter
make -j -C obj_dir/ -f Vcounter.mk Vcounter

#run the object
obj_dir/Vcounter