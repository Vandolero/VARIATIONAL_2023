function out=lagrangiano_3T(x,datos)
% definimos los datos
delh=1e-6;
a=x(1);b=x(2); 
%aT=[a+delh,a,a];% bT=[b,b+delh,b]; aTensor=reshape(aT,1,1,[]); bTensor=reshape(bT,1,1,[]);
dx=datos.dx; dy=datos.dy;
r=datos.r; th=datos.th;
lam=datos.lam;
% función del lagrangiano a ser usada;

m=0;
psi=a.*r.^m.*exp(-r.^2./b.^2).*exp(1i*th*m);
%p1=aTensor;
%p2=exp(-r.^2)%
%paux=bsxfun(@times,p1,p2);
%psi=bsxfun(@timex,paux,p3);

psi=a*exp(-r.^2/b.^2);

t1=lam*abs(psi).^2;
%[DX,DY]=gradient(psi,dx,dy);

t2=gradient_4(psi,datos);
%t2=abs(DX).^2+abs(DY).^2;
t3=-1/2*abs(psi).^4;

out=sum(sum(t1+t2+t3))*dx*dy;

end