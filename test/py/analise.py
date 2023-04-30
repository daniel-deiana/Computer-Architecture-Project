import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import sys

# first arg is image width, second is kernel width

image_width = sys.argv[1]
kernel_width = sys.argv[2]

n_threads=8
dir = "data/"
vals = []
x_axis = []
for i in range(1,n_threads+1):
    data = pd.read_csv(dir + "data_"+str(i)+".csv")
    median = np.median(data.iloc[0:])
    vals.append(median)
    x_axis.append(i)

speedups = []
for i in range(0,n_threads):
    speedups.append(vals[0]/vals[i])

arr = np.asarray(speedups)
pd.DataFrame(arr).to_csv("./"+str(image_width)+"_"+str(kernel_width)+".csv")

plt.plot(x_axis,speedups)
plt.ylim(0,5)
plt.title("dimensione immagine: " + str(image_width) + " dimensione kernel: " + str(kernel_width))
plt.savefig("speedup_"+str(image_width)+"_"+str(kernel_width)+".svg")