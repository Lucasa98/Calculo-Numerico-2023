function [t,y] = CN_newton(f,dfdy,a,b,y0,N)
  tol=1e-9;           #tolerancia para Newton
  kmax=100;           #cantidad maxima de iteraciones para Newton
  h=(b-a)/N;
  t=linspace(a,b,N+1)';
  y=0*t;
  y(1)=y0;
	for n=1:N
		yi=y(n);          #valor inicial para Newton
		k=1;              #variable de iteraciones de Newton
    fn=f(t(n),y(n));
		while (k<kmax)    #lazo de Newton
			g = yi - y(n) - h/2*( fn + f(t(n+1),yi) ); 
			dg = 1 - h/2*dfdy(t(n+1),yi);
			y(n+1) = yi - g/dg; 
			if(abs(y(n+1)-yi)<tol)
				break;
			endif
			k+=1;
			yi=y(n+1);
		endwhile
	endfor
endfunction