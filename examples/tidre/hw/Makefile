.PHONY: clean sim gui

all:
	python data-gen.py
	fletchgen -n Tidre -r input.rb -s memory.srec -l vhdl --axi --static-vhdl --mmio-offset 16

sim:
	rm -f vhdl/Tidre.gen.vhd
	vhdeps -i ${FLETCHER_DIR}/hardware -i . ghdl SimTop_tc

gui:
	rm -f vhdl/Tidre.gen.vhd
	vhdeps -i ${FLETCHER_DIR}/hardware -i . --gui ghdl SimTop_tc

clean:
	# input files
	rm -f input.rb
	# vhdmmio stuff	
	rm -rf vhdmmio-doc
	rm -f fletchgen.mmio.yaml
	rm -f vhdmmio.log
	# fletchgen stuff
	rm -f memory.srec
	rm -rf dot
	rm -f vhdl/*.gen.vhd
