make
rm -r data/*.csv

# 64 
for n_thread in {1..8}
do
    for n_rep in {1..100}
    do
        ./"create_input" input.txt 64 64 kernel.txt 4 4 $n_rep
        ./"conv" input.txt kernel.txt $n_thread >> "data/data_$n_thread.csv"
    done
done
python3 ./py/analise.py 64 4
rm -r data/*.csv

#256
for n_thread in {1..8}
do
    for n_rep in {1..30}
    do
        ./"create_input" input.txt 256 256 kernel.txt 4 4 $n_rep
        ./"conv" input.txt kernel.txt $n_thread >> "data/data_$n_thread.csv"
    done
done
python3 ./py/analise.py 256 4
rm -r data/*.csv


# 512
for n_thread in {1..8}
do
    for n_rep in {1..30}
    do
        ./"create_input" input.txt 512 512 kernel.txt 4 4 $n_rep
        ./"conv" input.txt kernel.txt $n_thread >> "data/data_$n_thread.csv"
    done
done
python3 ./py/analise.py 512 4
rm -r data/*.csv

# 1024
for n_thread in {1..8}
do
    for n_rep in {1..30}
    do
        ./"create_input" input.txt 1024 1024 kernel.txt 4 4 $n_rep
        ./"conv" input.txt kernel.txt $n_thread >> "data/data_$n_thread.csv"
    done
done
python3 ./py/analise.py 1024 4
rm -r data/*.csv

# 2048
for n_thread in {1..8}
do
    for n_rep in {1..30}
    do
        ./"create_input" input.txt 2048 2048 kernel.txt 4 4 $n_rep
        ./"conv" input.txt kernel.txt $n_thread >> "data/data_$n_thread.csv"
    done
done
python3 ./py/analise.py 2048 4
rm -r data/*.csv


# 2048
for n_thread in {1..8}
do
    for n_rep in {1..30}
    do
        ./"create_input" input.txt 4096 4096 kernel.txt 4 4 $n_rep
        ./"conv" input.txt kernel.txt $n_thread >> "data/data_$n_thread.csv"
    done
done
python3 ./py/analise.py 4096 4
rm -r data/*.csv


