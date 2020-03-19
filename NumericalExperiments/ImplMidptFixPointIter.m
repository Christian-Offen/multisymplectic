function [y1,err,count] = ImplMidptFixPointIter( y0,DH,h,k )
%ImplMidStep Implicit midpoint rule
%   y0 initial value
%   h step size
%   DH gradient of H, anonymous function with output same dimensions as y0

    n = length(y0)/2;
    Jinv = -sparse([n+1:2*n 1:n],1:2*n,[ones(1,n) -ones(1,n)]);

   %Pre-conditioning for Burgers' equation and constant initial data (H=1/2*m^2)
   dy = [h*ones(n,1); zeros(n,1)]; 

   tol = 1e-14;
   maxiter = 1e4;
   e = 1;
   eold = 1;
   count = 0;
   
   while (e>tol || e<eold) && count<maxiter
       count = count+1;
       dyold = dy;
       eold = e;
       dy = h*Jinv*DH(y0+dy/2); 
       e = max(abs(dy-dyold));
       
   end
   
   y1 = y0+dy;
   err = e;
   
   if e>eold
   y1 = y0+dyold;
   err = eold;
   end
 
   if count==maxiter
       disp({['Convergence issue at t=' mat2str(k*h) ': max. iterations exceeded'],...
           ['e > tol : ' mat2str(e>tol) ', e < eold : ' mat2str(e<eold) ]})
   end
   

end