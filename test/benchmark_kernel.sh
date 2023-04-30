rm -r data/*.csv

# test: fixed image on different kernels:

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

for n_thread in {1..8}
do
    for n_rep in {1..30}
    do
        ./"create_input" input.txt 1024 1024 kernel.txt 8 8 $n_rep
        ./"conv" input.txt kernel.txt $n_thread >> "data/data_$n_thread.csv"
    done
done
python3 ./py/analise.py 1024 8
rm -r data/*.csv


for n_thread in {1..8}
do
    for n_rep in {1..30}
    do
        ./"create_input" input.txt 1024 1024 kernel.txt 12 12 $n_rep
        ./"conv" input.txt kernel.txt $n_thread >> "data/data_$n_thread.csv"
    done
done
python3 ./py/analise.py 1024 12
rm -r data/*.csv


for n_thread in {1..8}
do
    for n_rep in {1..30}
    do
        ./"create_input" input.txt 1024 1024 kernel.txt 16 16 $n_rep
        ./"conv" input.txt kernel.txt $n_thread >> "data/data_$n_thread.csv"
    done
done
python3 ./py/analise.py 1024 16
rm -r data/*.csv