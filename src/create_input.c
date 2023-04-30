#include "utility.h"

int main(int argc, char* argv[])
{
    if(argc != 8) {
        ERROR("Incorrect number of arguments. Correct usage: ./create_input input.txt 1920 1080 kernel.txt 3 3 1\n")
        exit(-1);
    }

    int seed        = atoi(argv[7]);
    int ker_rows    = atoi(argv[6]);
    int ker_columns = atoi(argv[5]);
    int img_rows    = atoi(argv[3]);
    int img_columns = atoi(argv[2]); 

    char* img_path  = (char*) malloc((size_t)sizeof(char)*strlen(argv[1]));
    char* ker_path  = (char*) malloc((size_t)sizeof(char)*strlen(argv[4]));

    strncpy(img_path, argv[1], strlen(argv[1]));
    strncpy(ker_path, argv[4], strlen(argv[4]));

    if(set_dimensions(img_path, ker_path, argv[3], argv[2], argv[6], argv[5]) == -1)
        exit(-1);

    srand(seed);

    int* img = (int*) malloc((size_t) sizeof(int)*img_rows*img_columns);

    for(int i = 0; i < img_rows*img_columns; i++) {
        if( i < img_rows*img_columns/2)
            *(img + i) = rand() % 256;
    }

    if(write_file(img_path, img, img_rows*img_columns) == -1)
        exit(-1);

    free(img);
    free(img_path);

    int* ker = (int*) malloc((size_t) sizeof(int)*ker_rows*ker_columns);

    for(int i = 0; i < ker_rows*ker_columns; i++)
        *(ker + i) = rand() % 256;

    if(write_file(ker_path, ker, ker_rows*ker_columns) == -1)
        exit(-1);

    free(ker_path);
    free(ker);

    exit(0);
}
