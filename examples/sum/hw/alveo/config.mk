VHDL_FILES = $(shell python3 -m vhdeps dump krnl_fletcher_rtl \
               -i wrapper \
               -i ../vhdl \
               -msyn -v93 | cut -d ' ' -f 4-)

VIVADO := $(XILINX_VIVADO)/bin/vivado
$(XCLBIN)/fletcher.$(TARGET).$(XSA).xo: ../kernel.xml scripts/package_kernel.tcl scripts/gen_xo.tcl $(VHDL_FILES)
	mkdir -p $(XCLBIN)
	rm -rf all-sources
	mkdir -p all-sources
	cp -t all-sources $(VHDL_FILES)
	$(info    XSA is $(XSA))
	$(VIVADO) -mode batch -source scripts/gen_xo.tcl -tclargs $(XCLBIN)/fletcher.$(TARGET).$(XSA).xo fletcher $(TARGET) $(DEVICE) $(XSA)
