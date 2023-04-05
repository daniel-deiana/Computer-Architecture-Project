make
rm data*
for n_thread in {1..4}
do
    for n_rep in {1..30}
    do
        ./"create_input" input.txt 512 512 kernel.txt 2 2 $n_rep
        ./"conv" input.txt kernel.txt $n_thread >> "data_$n_thread.csv"
    done
done
