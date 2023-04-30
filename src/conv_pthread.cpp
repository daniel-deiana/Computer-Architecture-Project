/*
 * Multithread implementation of convolution (pthread.h version)
 */

#include "utility.h"
#include <pthread.h>

struct task
{
    int *output, *input, *kernel;
    int start_row, end_row;
    int output_columns;
    int input_rows;
    int kernel_size;
};

void convolute(void *argument)
{
    struct task *__task = (struct task *)argument;

    auto output = __task->output;
    auto kernel = __task->kernel;
    auto input = __task->input;
    auto start = __task->start_row;
    auto end = __task->end_row;
    auto out_size_y = __task->output_columns;
    auto in_size_x = __task->input_rows;
    auto kernel_size = __task->kernel_size;

#ifdef DEBUG
    std::cout << "convolute() => thread[" << pthread_self() << "] - start_row: " << start << ", end_row: " << end << std::endl;
#endif

    int convolute = 0;
    int t0 = clock();

    for (int x = start; x < end; x++) {
        for (int y = 0; y < out_size_y; y++) {
            for (int kx = 0; kx < kernel_size; kx++) {
                for (int ky = 0; ky < kernel_size; ky++)
                    output[x * out_size_y + y] += input[(x + kx) * in_size_x + y + ky] 
                    * kernel[kx * kernel_size + ky];
            }
        //output[x * out_size_y + y] = convolute;
        //convolute = 0;
      }
    }
    //printf("CPU time of thread %li\n",clock()-t0);
    pthread_exit(NULL);
}

void convolution_pthread(int *output, int *input, int *kernel, int input_rows, int input_columns, int kernel_size, int n_thread)
{
    auto out_size_x = input_rows - kernel_size + 1;
    auto out_size_y = input_columns - kernel_size + 1;

    pthread_t thread_id[n_thread];
    struct task thread_task[n_thread];

    void (*convolute_ptr)(void *) = &convolute;

    auto task_size = (int)ceil(((float)out_size_x) / ((float)n_thread));

    for (auto i = 0; i < n_thread; i++)
    {
        thread_task[i].output = output;
        thread_task[i].kernel = kernel;
        thread_task[i].input = input;
        thread_task[i].start_row = i * task_size;
        thread_task[i].end_row = (out_size_x > (i + 1) * task_size) ? (i + 1) * task_size : out_size_x;
        thread_task[i].output_columns = out_size_y;
        thread_task[i].input_rows = input_rows;
        thread_task[i].kernel_size = kernel_size;

        if (pthread_create(&thread_id[i], NULL, (void *(*)(void *))convolute_ptr, (void *)&thread_task[i]))
            exit(-1);
    }

    for (auto i = 0; i < n_thread; i++)
        pthread_join(thread_id[i], NULL);
}

