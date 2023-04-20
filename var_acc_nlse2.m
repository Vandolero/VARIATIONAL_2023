function out=var_acc_nlse2(x,datos)

% Número total de variables
numvar=length(x);
% Parametros de delta
h=1e-6;
% Parametro de suma parcial
%total=0;

% Ciclo en base al número de coeficientes a optimzar (total=2 para a y b)
    %for nn=1:1:numvar
     %   y=x;
      %  z=x;
      %  y(nn)=x(nn)-h;
     %   z(nn)=x(nn)+h;
     
     AF=lagrangiano_3([x(1)+h,x(2)],datos);
     NN=lagrangiano_3([x(1),x(2)],datos);
     BF=lagrangiano_3([x(1),x(2)+h],datos);
     %BP=lagrangiano_3([x(1),x(2)],datos);
     
     DA=(AF-NN);
     DB=(BF-NN);
     
     out=abs(DA).^2+abs(DB).^2;
      %  partial=abs(lagrangiano_3(z,datos)-lagrangiano_3(y,datos)).^2/(2*h);
     %   total=total+partial;
    %end

% Resultado de la suma
    %out=total;
end