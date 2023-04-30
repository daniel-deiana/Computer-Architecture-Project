make
rm -r data/*.csv

# 64 
for n_thread in {1..8}
do
    for n_rep in {1..100}
    do
        ./"create_input" input.txt 50 50 kernel.txt 4 4 $n_rep
        ./"conv" input.txt kernel.txt $n_thread >> "data/data_$n_thread.csv"
    done
done
python3 ./py/analise.py 50 4
rm -r data/*.csv

#256
for n_thread in {1..8}
do
    for n_rep in {1..100}
    do
        ./"create_input" input.txt 300 300 kernel.txt 4 4 $n_rep
        ./"conv" input.txt kernel.txt $n_thread >> "data/data_$n_thread.csv"
    done
done
python3 ./py/analise.py 300 4
rm -r data/*.csv


# 512
for n_thread in {1..8}
do
    for n_rep in {1..100}
    do
        ./"create_input" input.txt 522 522 kernel.txt 4 4 $n_rep
        ./"conv" input.txt kernel.txt $n_thread >> "data/data_$n_thread.csv"
    done
done
python3 ./py/analise.py 522 4
rm -r data/*.csv

# 1024
for n_thread in {1..8}
do
    for n_rep in {1..100}
    do
        ./"create_input" input.txt 1320 1320 kernel.txt 4 4 $n_rep
        ./"conv" input.txt kernel.txt $n_thread >> "data/data_$n_thread.csv"
    done
done
python3 ./py/analise.py 1320 4
rm -r data/*.csv

# 2048
for n_thread in {1..8}
do
    for n_rep in {1..100}
    do
        ./"create_input" input.txt 2080 2080 kernel.txt 4 4 $n_rep
        ./"conv" input.txt kernel.txt $n_thread >> "data/data_$n_thread.csv"
    done
done
python3 ./py/analise.py 2080 4
rm -r data/*.csv
