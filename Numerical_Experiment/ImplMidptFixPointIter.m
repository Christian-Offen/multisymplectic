function [y1,err,count] = ImplMidptFixPointIter( y0,FF,h,k )
%ImplMidStep Implicit midpoint rule
%   y0 initial value
%   h step size
%   FF vectorfield, anonymous function with output same dimensions as y0

    n = length(y0)/2;
   

   %Pre-conditioning 
   %dy = [h*ones(n,1); zeros(n,1)]; 
   dy = zeros(2*n,1); 

   tol = 1e-14;
   maxiter = 1e4;
   e = 1;
   eold = 1;
   count = 0;
   
   while (e>tol || e<eold) && count<maxiter
       count = count+1;
       dyold = dy;
       eold = e;
       dy = h*FF(y0+dy/2); 
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