#!/usr/bin/python3

import csv
import matplotlib.pyplot as plt
import numpy as np

a_datas = np.array([])
a_country = np.array([])
N  = 10 # Cantidad de Países

d = dict()

with open('Scopus-188-Analyze-Country.csv', 'r') as csvfile:
    reader = csv.reader(csvfile, delimiter=',', quotechar='"')
    for row in reader:
        if(len(row) == 2):
            if(row[0] != 'COUNTRY/TERRITORY'):
                # a_country = np.append(a_country, row[0])
                # a_datas = np.append(a_datas, row[1])
                d[row[0]] = row[1]

d = sorted(d.items())
for i in d:
    a_country = np.append(a_country, i[0])
    a_datas = np.append(a_datas, i[1])
    
a_country = a_country[::-1]
a_datas = a_datas[::-1]

a_country = a_country[:N]
a_datas = a_datas[:N]

ind = np.arange(N)

fig, ax = plt.subplots()

ax.bar(ind, a_datas, color='r')
ax.set_xticks(range(len(a_datas)))
ax.set_xticklabels(a_country, rotation='45', size='xx-small', animated='True')
#plt.set_xticklabels(('G1', 'G2', 'G3', 'G4', 'G5', 'G6', 'G7'))
plt.title('Cantidad de papers con palabras clave: "cots fault tolerance"')
plt.xlabel('Países')
plt.ylabel('Cantidad de papers')
plt.show()
