LDFLAGS= -lc -lm -lcudadevrt -lcudart_static -lrt -ldl -o main -L/usr/local/cuda/lib64 

default: main.bc

%.o: %.cu
	gclang -O2 -g $< -c -o $@

main: kernel.o main.o
	gclang main.o kernel.o $(LDFLAGS) -o main

main.bc: main
	@get-bc main

.PHONY: clean
clean:
	-rm -f *.bc *.ll *.o .*.bc .*.ll .*.o main
