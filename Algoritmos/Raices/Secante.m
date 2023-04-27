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
## @deftypefn {} {@var{retval} =} Secante (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: lusau <lusau@LUCAS>
## Created: 2023-04-27

function [p,it,r,t] = Secante (f,p0,p1,tolerancia,maxit)
  tic();

  %p0 vendria a ser p(n-1)
  %p1 vendria a ser p(n-2)

  p = p0;
  it=1;

  while it < maxit

    p = p0 - ( f(p0)*(p0-p1) )/( f(p0)-f(p1) );

    %usamos una condicion de corte
    %   abs(f(p)) < tolerancia
    %   abs(p-p0) < tolerancia
    %   abs(p-p0)/abs(p) < tolerancia
    r(it) = p-p0;
    if abs(p-p0) < tolerancia
      break;
    endif

    it = it+1;
    p1 = p0;
    p0 = p;
  endwhile

  t = toc();
endfunction
