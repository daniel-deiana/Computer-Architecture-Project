import matplotlib.pyplot as plt
import numpy as np
import pandas as pd 

data0 = pd.read_csv("../64_4.csv")
data1 = pd.read_csv("../256_4.csv")
data2 = pd.read_csv("../512_4.csv")
data3 = pd.read_csv("../1024_4.csv")
data4 = pd.read_csv("../2048_4.csv")

arr = np.asarray(data0)

plt.plot([1, 2, 3, 4, 5, 6, 7, 8], data0, label="64x64")
plt.plot([1, 2, 3, 4, 5, 6, 7, 8], data1, label="256x256")
plt.plot([1, 2, 3, 4, 5, 6, 7, 8], data2, label="512x512")
plt.plot([1, 2, 3, 4, 5, 6, 7, 8], data3, label="1024x1024")
plt.plot([1, 2, 3, 4, 5, 6, 7, 8], data4, label="2048x2048")

plt.legend()
plt.show()
