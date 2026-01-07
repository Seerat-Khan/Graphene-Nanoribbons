  
   clc;clear;close;
   E0=0; 
   t=2.66; % in eV
  
   Ny=24;
   n=1000;
   T=zeros(Ny);
   d=t*ones(1,Ny-1);
   d0=E0*ones(1,Ny);
   H0=diag(d0)+diag(d,1)+diag(d,-1); %on-site matrix
   E=zeros(2*Ny,n);
   k=1;
   
   for kx=linspace(-pi,pi,1000) 
       for i=1:1:Ny
       for j=1:1:Ny      
            if i==j %coupling matrix
                   if mod(j,2)==0
                      T(i,j)=t*exp(1i*kx);  
                   else
                      T(i,j)=t;
                   end      
            end
       end
       end
       T1=flipud(T); % FLIP OR NOT
       T2=ctranspose(T1);
       W=[H0 T1;T2 H0];
       En=eig(W);
       E(:,k) = En;
       k=k+1;
   end
   %plotting
   kx_values=linspace(-pi,pi,1000); 
   hold
   for y=1:2*Ny
     plot(kx_values,E(y,:))
   end
   xlabel('k_xa') 
   ylabel('E(ev)')
   title(['N=' num2str(Ny)])
  grid on
    
  


   