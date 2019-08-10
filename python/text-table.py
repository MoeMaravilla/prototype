#!/usr/bin/python -u

import re

def print_table(table):
    col_width = [max(len(x) for x in col) for col in zip(*table)]

    print '+-' + '-+-'.join(['-' * col_width[i] for i in range(len(col_width))]) + '-+'
    for j, line in enumerate(table):
        print("| " + " | ".join("{:{}}".format(x, col_width[i])
                                for i, x in enumerate(line)) + " |")
        if j == 0:
            print '+-' + '-+-'.join(['-' * col_width[i] for i in range(len(col_width))]) + '-+'
    print '+-' + '-+-'.join(['-' * col_width[i] for i in range(len(col_width))]) + '-+'


table = []

table.append(['abc', 'defg', 'hijkl'])
table.append(['x', 'qrts', '10'])
table.append(['12', 'tn', 'bty'])

print_table(table)
