#!/usr/bin/env bash

## test 1 function
test1___dofufa_kbdate() {
    echo 'TEST INPUT:' $@
    node . $@
    echo;
}

## NOTE: results may differ by locale
## Locale tests may be required.

## REFERENCE
## documentation for Date.parse(str)

## bad input
## handled by Date.parse
test1___dofufa_kbdate 2024-99-22 05:25
test1___dofufa_kbdate 2024-99-99 99:99

## very bad input
## handled by Authors
test1___dofufa_kbdate 9999
test1___dofufa_kbdate 9999-01-01
test1___dofufa_kbdate 9999-01-01 5:15


## word dates
test1___dofufa_kbdate May 4, 2025 03:00
test1___dofufa_kbdate 4 May, 2025 08:00
test1___dofufa_kbdate 4 May 2025 23:00
test1___dofufa_kbdate 4-May 2025 5:00

# just after a new year, dots
test1___dofufa_kbdate 2024.1.1 00:00
test1___dofufa_kbdate 2024.01.01 00:00
test1___dofufa_kbdate 2024.01.01
test1___dofufa_kbdate 2024.01

# just after a new year, dots
test1___dofufa_kbdate 2024/1/1 00:00
test1___dofufa_kbdate 2024/01/01 00:00
test1___dofufa_kbdate 2024/01/01
test1___dofufa_kbdate 2024/01

## just after a new year
test1___dofufa_kbdate 2024-01-01 00:00
test1___dofufa_kbdate 2024-01-01 02:00
test1___dofufa_kbdate 2024-01-01 5:00
test1___dofufa_kbdate 2024-01-01
test1___dofufa_kbdate 2024-01
test1___dofufa_kbdate 2024

## just before a new year
test1___dofufa_kbdate 2023-12-31 23:59
test1___dofufa_kbdate 2023-12-31

