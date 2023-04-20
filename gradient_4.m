function out=gradient_4(psi,datos);

kxs=datos.kxs;
kys=datos.kys;

F2=fft2(psi);
Dx=ifft2(F2.*(1i*kxs));
Dy=ifft2(F2.*(1i*kys));

out=abs(Dx).^2+abs(Dy).^2;

end