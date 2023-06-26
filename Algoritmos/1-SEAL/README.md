# Algoritmos de resolución de SEAL's

## Métodos directos
**FactLUPP** - Devuelve una matriz que contiene la factorización de Doolitle de A por pivoteo parcial.\
**GaussLUPP** - Resuelve Ax=b por factorización LU (con la factorización de FactLUPP).

## Métodos iterativos
**Jacobi** - Resuelve Ax=b por el método de Jacobi.\
**GaussSeidel** - Resuelve Ax=b por el método de GaussSeidel.\
**SOR** - Resuelve Ax=b por el metodo SOR.\
**wOptimo** - Encuentra el parámetro de relajación óptimo para el método SOR (exhaustivo).
