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
## @deftypefn {} {@var{retval} =} Biseccion (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: lusau <lusau@LUCAS>
## Created: 2023-04-25

function [p,it,r,t] = Biseccion (f,a,b,tolerancia,maxit)
  tic();

  it = 1;
  pant = a;
  while it < maxit
    p = a + (b-a)/2;

    %elegimos una condicion de corte
    %   error absoluto: abs(p-pant)
    %   error relativo: abs(p-pant)/abs(p)
    %   cercanica al eje x (el peor): abs(f(p))
    r(it) = (p-pant)/p;
    if p == 0 || abs(p-pant)/abs(p) < tolerancia
      break;
    endif

    if f(p)*f(b) < 0
      a = p;
    else
      b = p;
    endif

    pant = p;
    it = it + 1;
  endwhile

  if it == maxit
    disp("no se encontro raiz en maxit iteraciones");
  endif

  t = toc();
endfunction
