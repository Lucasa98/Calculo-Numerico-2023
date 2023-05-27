%ik = i+k
function c = DD(x,y,i,ik)
  %1er diferencia dividida
  if ik == i
    c = y(i);
    return;
  endif

  %2da diferencia dividida
  if ik == i+1
    c = (y(i+1) - y(i)) / (x(i+1) - x(i));
    return;
  endif

  %k-esima diferencia dividida
  c = (DD(x,y,i+1,ik) - DD(x,y,i,ik-1)) / (x(ik) - x(i));
endfunction
