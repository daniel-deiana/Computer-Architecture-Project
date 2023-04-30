make
rm -r data/*.csv

# 64 
for n_thread in {1..8}
do
    for n_rep in {1..100}
    do
        ./"create_input" input.txt 67 67 kernel.txt 4 4 $n_rep
        ./"conv" input.txt kernel.txt $n_thread >> "data/data_$n_thread.csv"
    done
done
python3 ./py/analise.py 67 4
rm -r data/*.csv

#256
for n_thread in {1..8}
do
    for n_rep in {1..30}
    do
        ./"create_input" input.txt 259 259 kernel.txt 4 4 $n_rep
        ./"conv" input.txt kernel.txt $n_thread >> "data/data_$n_thread.csv"
    done
done
python3 ./py/analise.py 259 4
rm -r data/*.csv


# 512
for n_thread in {1..8}
do
    for n_rep in {1..30}
    do
        ./"create_input" input.txt 515 515 kernel.txt 4 4 $n_rep
        ./"conv" input.txt kernel.txt $n_thread >> "data/data_$n_thread.csv"
    done
done
python3 ./py/analise.py 515 4
rm -r data/*.csv

# 1024
for n_thread in {1..8}
do
    for n_rep in {1..30}
    do
        ./"create_input" input.txt 1027 1027 kernel.txt 4 4 $n_rep
        ./"conv" input.txt kernel.txt $n_thread >> "data/data_$n_thread.csv"
    done
done
python3 ./py/analise.py 1027 4
rm -r data/*.csv

# 2048
for n_thread in {1..8}
do
    for n_rep in {1..30}
    do
        ./"create_input" input.txt 2051 2051 kernel.txt 4 4 $n_rep
        ./"conv" input.txt kernel.txt $n_thread >> "data/data_$n_thread.csv"
    done
done
python3 ./py/analise.py 2051 4
rm -r data/*.csv


# 2048
for n_thread in {1..8}
do
    for n_rep in {1..30}
    do
        ./"create_input" input.txt 4099 4099 kernel.txt 4 4 $n_rep
        ./"conv" input.txt kernel.txt $n_thread >> "data/data_$n_thread.csv"
    done
done
python3 ./py/analise.py 4099 4
rm -r data/*.csv

