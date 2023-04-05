#include <math.h>
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define RED "\033[0;31m"
#define GREEN "\033[32m"
#define COLOR_RESET "\e[0m"

#define ERROR(e)        \
    printf(RED);        \
    printf("[ERROR] "); \
    printf(e);          \
    printf(COLOR_RESET);

#define ERROR_(e, d)    \
    printf(RED);        \
    printf("[ERROR] "); \
    printf(e, d);       \
    printf(COLOR_RESET);

#define SUCCESS(i)                       \
    printf(GREEN);                       \
    printf("[TEST %d-th] SUCCESS\n", i); \
    printf(COLOR_RESET);

#define ITOA(i, s, l)               \
    l = snprintf(NULL, 0, "%d", i); \
    s = (char *)malloc(l + 1);      \
    snprintf(s, l + 1, "%d", i);

#define FERROR(f_p, f_n)                                       \
    if (ferror(f_p))                                           \
    {                                                          \
        ERROR_("Something goes wrong while reading '%s'", f_n) \
        fclose(f_p);                                           \
        return;                                                \
    }

#define PRINT(m)                                               \
    printf("+-------------------------------------------+\n"); \
    printf("\t");                                              \
    printf(m);                                                 \
    printf("\n");                                              \
    printf("+-------------------------------------------+\n");

#define DEBUG_0
// #define SEQ
#define THREAD
#define TEST
#define SIMULATION

struct data
{
    int rows;
    int columns;
    int *raw_data;
};

void print(int *, int, int);
void validate(int *, int *, int, int);

void convolution_seq(int *, int *, int *, int, int, int);
void convolution_thread(int *, int *, int *, int, int, int, int);

int write_file(char *, int *, int);
int write_execution_time(char *, int, double);
int get_dimensions(char *, char *, int *, int *, int *, int *);
int set_dimensions(char *, char *, char *, char *, char *, char *);
int read_file(char *, char *, int, int, int, int, int *, int *);