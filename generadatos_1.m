function datos=generadatos_1();

 lam=1;
 % Número de puntos en la ventana transversal.
       
       Nx=64;
       Ny=Nx;
     
       Lx=20;
       Ly=Lx;
     
       % Discretización en espacio de Fourier.
       dkx = 2*pi/Lx;
       dky = 2*pi/Ly;
        

        % Discretización en espacio 2-D.
        dx = Lx/Nx;
        dy = Ly/Ny;

        % Espacio numérico en 2-D, se manejan 2 vectores por si se
        % desean cuestiones asimétricas.
        
        gralspace1x=linspace(-Nx/2,Nx/2-1,Nx);
        gralspace1y=linspace(-Ny/2,Ny/2-1,Ny);
   
        
        % Vectores transversales en espacio 2-D
        xspace =gralspace1x*dx;
        yspace =gralspace1y*dy;

        % Vectores transversales en espacio de Fourier.
        kspacex=gralspace1x*dkx;
        kspacey=gralspace1y*dky;

        % Espacio en 2-D 
        [x,y] = meshgrid(xspace,-yspace);  
             
        % Espacio en Fourier
        [kx,ky] = meshgrid(kspacex,-kspacey);

        % Coordenadas cilíndricas.
        r=sqrt(x.^2+y.^2);
        th= atan2(y,x);

datos=struct('x',x,'y',y,'r',r,'th',th,...
            'kxs',fftshift(kx),'kys',fftshift(ky),'lam',lam,'dx',dx,'dy',dy);
        
        

end