#----------------------------------------
#-- Establecer nombre del componente
#----------------------------------------
# NAME = scicad1
# DEPS = uart_tx.v baudgen.v

NAME2 = top
DEPS2 = uart_tx.v baudgen.v dividerp1.v

#-------------------------------------------------------
#-- Objetivo por defecto: hacer simulacion y sintesis
#-------------------------------------------------------
all: sim sint

sim: $(NAME2)_tb.vcd

#-----------------------------------------------
#-  make sint
#-----------------------------------------------
#-  Objetivo para realizar la sintetis completa
#- y dejar el diseno listo para su grabacion en
#- la FPGA
#-----------------------------------------------
sint: $(NAME2).bin

#-------------------------------
#-- Compilacion y simulacion
#-------------------------------
$(NAME2)_tb.vcd: $(NAME2).v $(DEPS2) $(NAME2)_tb.v

	#-- Compilar
	iverilog $^ -o $(NAME2)_tb.out

	#-- Simular
	./$(NAME2)_tb.out

	#-- Ver visualmente la simulacion con gtkwave
	gtkwave $@ $(NAME2)_tb.gtkw &

#------------------------------
#-- Sintesis completa
#------------------------------
$(NAME2).bin: $(NAME2).pcf $(NAME2).v $(DEPS2)

	#-- Sintesis
	# yosys -p "synth_ice40 -blif $(NAME2).blif" $(NAME2).v $(DEPS2)
	yosys -p 'synth_ice40 -top $(NAME2) -json $(NAME2).json' $(NAME2).v $(DEPS2)

	#-- Place & route
	#arachne-pnr -d 1k -p $(NAME2).pcf $(NAME2).blif -o $(NAME2).txt
	nextpnr-ice40 --hx8k --package tq144:4k --json $(NAME2).json --pcf $(NAME2).pcf --asc $(NAME2).asc

	#-- Generar binario final, listo para descargar en fgpa
	icepack $(NAME2).asc $(NAME2).bin

#------------------------------
#-- Upload the bitsream to board
#------------------------------
flash:
		iceprog -d i:0x0403:0x6010:0 $(NAME2).bin


#-- Limpiar todo
clean:
	rm -f *.bin *.asc *.json *.out *.vcd *~

.PHONY: all clean
