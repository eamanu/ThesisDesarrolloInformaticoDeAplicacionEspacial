#!/usr/bin/python3

import csv
import matplotlib.pyplot as plt
import numpy as np

a_datas = np.array([])
a_years = np.array([])

with open('Scopus-2047-Analyze-Year.csv', 'r') as csvfile:
    reader = csv.reader(csvfile, delimiter=',', quotechar='"')

    with open('Scopus-753-Analyze-Year.csv', 'r') as csvfile2:
        reader2 = csv.reader(csvfile2, delimiter=',', quotechar='"')
        
        d, d2 = dict(), dict()
        for row in reader:
            if(len(row) == 2):
                if(row[0] != 'YEAR'):
                    d[row[0]]=int(row[1])
        for row2 in reader2:
            if(len(row2) == 2):
                if(row2[0] != 'YEAR'):
                    d2[row2[0]] = int(row2[1])

        if(len(d) > len(d2)): # d es mayor que d2
            datas = d.copy()
            d2_keys = list(d2.keys())
            for k in d2_keys:
                datas[k] = datas[k] + d2[k]
        else:
            datas = d2.copy()
            d_keys = list(d.keys())
            for k in d_keys:
                datas[k] = datas[k] + d[k]

        
        datas = sorted(datas.items())
        for i in datas:
            a_years = np.append(a_years, i[0])
            a_datas = np.append(a_datas, i[1])

plt.plot(a_years, a_datas, 'k')
plt.title('Cantidad de papers con palabras clave: "COTS satellite"')
plt.xlabel('Año')
plt.xticks([1970, 1980, 1990, 2000, 2010, 2016])
plt.ylabel('Cantidad de papers')
plt.show()
