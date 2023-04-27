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
## @deftypefn {} {@var{retval} =} wOptimo (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: lusau <lusau@LUCAS>
## Created: 2023-04-23

function [w] = wOptimo (A,b,x0,tolerancia,maxit)

  aux=100000;
  w=0.01;
  for i=0.1:0.1:2.0
    [x,it,r,t]=SOR(A,b,x0,tolerancia,maxit,i);
    if(it<aux)
      w=i;
      aux=it;
    endif
  endfor

endfunction
