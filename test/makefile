all:conv_main create_input

conv_main:./../src/conv_main.c
	gcc -Wall ./../src/conv_main.c ./../src/conv_seq.c ./../src/conv_multithread.c ./../src/utility.c -fopenmp -o conv

create_input:./../src/create_input.c
	gcc -Wall ./../src/create_input.c ./../src/utility.c -o create_input

clean: 
	rm *o conv create_input validate
