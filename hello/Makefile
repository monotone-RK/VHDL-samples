SRCS = hello.vhd
TARGET = hello_world
OBJ = work-obj93.cf

GHDL = ghdl

all:
	$(GHDL) -a $(SRCS)
	$(GHDL) -e $(TARGET)

run:
	$(GHDL) -r $(TARGET)

clean:
	rm -f $(OBJ)
