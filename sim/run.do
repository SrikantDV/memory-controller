vlog mc.svh +incdir+D:/Srikanta_DV/DV_contents/uvm/MEMORY_CTLR/memory-controller/design-RTL/verilog \
+incdir+D:/Srikanta_DV/DV_contents/uvm/uvm-1.2/src \
+incdir+D:/Srikanta_DV/DV_contents/uvm/MEMORY_CTLR/memory-controller/mem_cont_uvc/top \
+incdir+D:/Srikanta_DV/DV_contents/uvm/MEMORY_CTLR/memory-controller/mem_cont_uvc/wishbone \
+incdir+D:/Srikanta_DV/DV_contents/uvm/MEMORY_CTLR/memory-controller/mem_cont_uvc/mem 

set testname wb_wr_rd_test
variable time [format "%s" [clock format [clock seconds] -format %Y%m%d_%H%M]]
set log_f "$testname\_$time\.log"

vsim -coverage -novopt -suppress 12110 -sv_lib C:/questasim64_10.7c/uvm-1.2/win64/uvm_dpi top +UVM_TESTNAME=$testname -l $log_f
do wave.do
run -all
