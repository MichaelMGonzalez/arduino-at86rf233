OUTNAME = test_radio
LIBS = -lpiduino
CC = g++
OBJS = at86rf2xx.o at86rf2xx-internal.o at86rf2xx-getset.o arduino-at86rf233.o
INO_AS_CPP =  -x c++
FLAGS = $(LIBS) -o $(OUTNAME) $(OBJS)

$(OUTNAME): $(OBJS) 
	$(CC) $(FLAGS) 
%.o: %.ino
	$(CC) $(INO_AS_CPP) -c $<
%.o: %.s
	$(CC)  -c $<
%.s: %.cpp
	$(CC)  -S $<
.PHONY: clean
clean:
	rm -f *.o
