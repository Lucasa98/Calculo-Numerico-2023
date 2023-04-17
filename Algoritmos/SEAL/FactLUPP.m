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
## @deftypefn {} {@var{retval} =} FactLUPP (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: lusau <lusau@LUCAS>
## Created: 2023-04-09

function [LU,P] = FactLUPP (A)
  n=length(A(1,:));
  r=1:n;
  tolerancia = 1e-9;
  for k=1:n-1
    [pmax,p] = max(abs(A(r(k:n),k))); %el max entre Aik, con i=k,k+1,...,n en el orden de r

    if(pmax<tolerancia)
      display("todos chiquitos");
    endif

    p=p + k-1;
    if(p~=k)
      r([p k])=r([k p]);  %permutacion
    endif

    %L y U
    A(r(k+1:n),k) = A(r(k+1:n),k)/A(r(k),k);                            %L para todo lo que esta debajo de Akk
    A(r(k+1:n),k+1:n) = A(r(k+1:n),k+1:n)-A(r(k+1:n),k)*A(r(k),k+1:n);  %U para todo lo que esta a la derecha de Akk
  endfor

  LU=A(r(:),:);
  P=eye(n)(r,:);
endfunction
