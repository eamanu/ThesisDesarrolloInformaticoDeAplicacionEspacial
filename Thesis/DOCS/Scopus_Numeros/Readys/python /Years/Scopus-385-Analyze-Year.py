#!/usr/bin/python3

import csv
import matplotlib.pyplot as plt
import numpy as np

a_datas = np.array([])
a_years = np.array([])

with open('Scopus-385-Analyze-Year.csv', 'r') as csvfile:
    reader = csv.reader(csvfile, delimiter=',', quotechar='"')
    for row in reader:
        if(len(row) == 2):
            if(row[0] != 'YEAR'):
                a_years = np.append(a_years, row[0])
                a_datas = np.append(a_datas, row[1])

plt.plot(a_years, a_datas, 'k')
plt.title('Cantidad de papers con palabras clave: "fault tolerance satellite"')
plt.xlabel('Año')
plt.xticks([1970, 1980, 1990, 2000, 2010, 2016])
plt.ylabel('Cantidad de papers')
plt.show()
