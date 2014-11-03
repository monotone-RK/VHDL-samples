SRCS = tb_counter.vhd counter.vhd
TARGET = tb_counter
OBJ = work-obj93.cf

GHDL = ghdl

GTK = gtkwave
VCD = uut.vcd

all:
	$(GHDL) -a --ieee=synopsys $(SRCS)
	$(GHDL) -e --ieee=synopsys $(TARGET)

run:
	$(GHDL) -r --ieee=synopsys $(TARGET) --vcd=$(VCD)

view:
	$(GTK) $(VCD) &

clean:
	rm -f $(OBJ) $(VCD)
