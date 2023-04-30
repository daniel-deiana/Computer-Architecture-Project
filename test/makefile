all:conv_main create_input

conv_main:./../src/conv_main.c
	g++ ./../src/conv_main.c ./../src/conv_seq.c ./../src/conv_pthread.cpp ./../src/utility.c -pthread -o conv 

create_input:./../src/create_input.c
	g++ ./../src/create_input.c ./../src/utility.c -o create_input

	rm *o conv create_input validate
