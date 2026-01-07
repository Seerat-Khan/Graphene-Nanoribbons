clc; clear; close;
E0=0; t=2.66; % in eV
   
   Ny=24;
   n=1000;
   T=zeros(Ny);
   d=t*ones(1,Ny-1);
   d0=E0*ones(1,Ny);
   
   H0=diag(d0)+diag(d,1)+diag(d,-1); %on-site matrix
   E=zeros(Ny,n);
   k=1;
   TR1=zeros(Ny);
   TR2=zeros(Ny);
   
   for kx=linspace(0,2*pi,1000) 
       for i=1:1:Ny
       for j=1:1:Ny      
            if i==j 
                    if mod(i,4)==2 
                        TR1(i,j-1)=t;
                    else
                        TR1(i,j)=0;
                    end
                            
                    if mod(j,4)==0
                        TR2(i-1,j)=t;
                    else
                        TR2(i,j)=0;
                    end
       
            end
       end
       end
       TR=TR1+TR2;
       H=H0+TR*exp(1i*kx)+ctranspose(TR)*exp(-1i*kx);
       En=eig(H);
       E(:,k) = En;
       k=k+1;
   end
   %plotting
   kx_values=linspace(0.5,1.5,1000); 
   hold
   for y=1:Ny
     plot(kx_values,E(y,:))
   end
  xlabel('k_xa') 
  ylabel('E(ev)')
 
  title(['N=' num2str(Ny)])
  grid on
   

   