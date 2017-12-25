all: build/blinky.bin

build/blinky.bin: build/blinky.asc  
	icepack $< $@

build/blinky.asc: blinky.pcf build/blinky.blif  
	arachne-pnr -d 1k -P tq144 -o $@ -p $^

build/blinky.blif: blinky.v  
	yosys -p "synth_ice40 -top top -blif $@" $^

prog: build/blinky.bin  
	iceprog build/blinky.bin

clean:  
	rm build/*

.PHONY: prog clean
