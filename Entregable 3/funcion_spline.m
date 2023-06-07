function [S,dS]=funcion_spline(x1,y1,df1=0,df2=0)

    % extremos sujetos
    [a,b,c,d] = cubic_spline_clamped(x1,y1,df1,df2);
    % extremos libres
    %[a,b,c,d] = cubic_spline_natural(x1,y1);

    S=@(x) a(1)*(x==x1(1));

    M=[d c b a];
    dM=[];
    dS= @(x) 0;
    for i=1:length(x1)-1
        dM=[dM;polyder(M(i,:))];
        S=@(x) S(x) + polyval(M(i,:),x-x1(i)).*(x>x1(i)).*(x<=x1(i+1));
        dS=@(x) dS(x) + polyval(dM(i,:),x-x1(i)).*(x>x1(i)).*(x<=x1(i+1));
    endfor
endfunction
