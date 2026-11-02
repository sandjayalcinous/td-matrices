CC = gcc
CFLAGS = -std=c11 -Wall -Wextra -Wpedantic -g
LIB = matrice.c matrice_alloc.c
HDR = matrice.h matrice_alloc.h matrice_io.h matrice_calcul.h

all: demo_matrices test_ex1 test_ex2 test_ex3

demo_matrices: main.c $(LIB) matrice_io.c matrice_calcul.c $(HDR)
	$(CC) $(CFLAGS) main.c $(LIB) matrice_io.c matrice_calcul.c -o $@

test_ex1: test_ex1.c $(LIB) $(HDR)
	$(CC) $(CFLAGS) -DMAT_TEST_ALLOC test_ex1.c $(LIB) -o $@

test_ex2: test_ex2.c $(LIB) matrice_io.c $(HDR)
	$(CC) $(CFLAGS) -DMAT_TEST_ALLOC test_ex2.c $(LIB) matrice_io.c -o $@

test_ex3: test_ex3.c $(LIB) matrice_calcul.c $(HDR)
	$(CC) $(CFLAGS) -DMAT_TEST_ALLOC test_ex3.c $(LIB) matrice_calcul.c -o $@

clean:
	rm -f demo_matrices test_ex1 test_ex2 test_ex3

.PHONY: all clean
