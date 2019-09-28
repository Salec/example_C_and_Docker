# Define required macros here
SHELL = /bin/sh

OBJS =  bankManagementSystem.c
CFLAG = -Wall -g
CC = gcc
INCLUDE =
LIBS = 

main:${OBJ}
	${CC} ${CFLAGS} ${INCLUDES} -o build/$@.out ${OBJS} ${LIBS}

clean:
	-rm -f *.o core *.core build/*

.cpp.o:
	${CC} ${CFLAGS} ${INCLUDES} -c $<
	