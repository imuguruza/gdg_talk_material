NAME = blinky
PATH_TB = .
SIM_PATH = build/sim
BOARD1 = alhambra
BOARD2 = ulx3s


all: sint sim

sint_$(BOARD1): $(NAME)_$(BOARD1).bin
sint_$(BOARD2): $(NAME)_$(BOARD2).bin

sim: $(NAME)_tb.vcd

$(NAME)_tb.vcd: rtl/$(NAME).v tb/$(NAME)_tb.v

	#-- Compile
	iverilog $^ -o $(NAME)_tb.out

	#-- Simulate
	./$(NAME)_tb.out

	#-- Check sim using gtkwave
	gtkwave $@ $(NAME)_tb.gtkw &

$(NAME)_$(BOARD1).bin: constraints/$(BOARD1).pcf rtl/$(NAME).v

	mkdir -p build/$(BOARD1)
	cd build/$(BOARD1)
	#-- Sinth
	yosys -p 'synth_ice40 -top $(NAME) -json build/$(BOARD1)/$(NAME).json' rtl/$(NAME).v


	#-- Place & route
	nextpnr-ice40 --hx8k --package tq144:4k --json build/$(BOARD1)/$(NAME).json --pcf constraints/$(BOARD1).pcf --asc build/$(BOARD1)/$(NAME)_$(BOARD1).asc

	#-- Type `$ make flash` to upload bistream
	icepack build/$(BOARD1)/$(NAME)_$(BOARD1).asc build/$(BOARD1)/$(NAME)_$(BOARD1).bin


$(NAME)_$(BOARD2).bin:

	mkdir -p build/$(BOARD2)
#	cd build/$(BOARD1)
	yosys rtl/blinky.v -p "synth_ecp5 -json build/$(BOARD2)/$(NAME).json" \
	&& nextpnr-ecp5 --85k --json build/$(BOARD2)/$(NAME).json --lpf constraints/ulx3s.lpf --textcfg build/$(BOARD2)/ulx3s_out.config --package CABGA381 \
	&& ecppack build/$(BOARD2)/ulx3s_out.config build/$(BOARD2)/ulx3s.bit

review_$(NAME)_$(BOARD1):

	nextpnr-ice40 build/alhambra/blinky.json --gui --package tq144

review_$(NAME)_$(BOARD2):

	nextpnr-ecp5 build/ulx3s/blinky.json --gui --package CABGA381
#------------------------------
#-- Upload the bitsream to board
#------------------------------
flash_alhambra:
		iceprog -d i:0x0403:0x6010:0 build/$(BOARD1)/$(NAME)_$(BOARD1).bin

flash_uls3x:
		fujprog build/$(BOARD2)/$(NAME)_$(BOARD2).bin

clean:
	#rm -f *.bin *.asc *.json *.out *.vcd *~
	rm -r build

.PHONY: all clean
