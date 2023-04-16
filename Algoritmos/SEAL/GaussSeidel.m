## Copyright (C) 2023 lusau
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} GaussSeidel (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: lusau <lusau@LUCAS>
## Created: 2023-04-13

function [x,it,r] = GaussSeidel (A,b,x0,tolerancia,maxit)
  n=length(A(1,:));

  x=x0;
  it=0;
  %usamos x0 para almacenar el x de la iteracion anterior
  while (it < maxit)
    for i=1:n
      x(i) = (b(i) - A(i,1:i-1)*x(1:i-1) - A(i,i+1:n)*x0(i+1:n))/A(i,i);
                 %Gauss-Seidel  ^^^^^^^^
    endfor

    r(it+1) = norm(A*x-b);
    if r(it+1) < tolerancia
      break;
    endif

    x0=x;
    it=it+1;
  endwhile
endfunction
