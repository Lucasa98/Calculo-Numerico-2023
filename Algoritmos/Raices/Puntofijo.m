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
## @deftypefn {} {@var{retval} =} Puntofijo (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: lusau <lusau@LUCAS>
## Created: 2023-04-25

function [p,it,r,t] = Puntofijo (f,p0,tolerancia,maxit)
  tic();

  it=1;
  while it < maxit
    p = f(p0);

    r(it) = p-p0;
    if abs(p-p0) < tolerancia
      break;
    endif

    p0 = p;
    it = it + 1;
  endwhile

  if it == maxit
    disp("no se encontro punto fijo en maxit iteraciones");
  endif

  t = toc();
endfunction
