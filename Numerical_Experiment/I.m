function zout = I(z,h)
%I Evaluation of conserved rotational quantity
%   expression in the variables q,p of the original system.
%   h=0 is the exact quantity, h=1 the modified quantity

global V1Fun a c dt dx

qnorm = z(1,:).^2+z(2,:).^2;

V1 = V1Fun(qnorm);

zout=(-1).*z(2,:).*z(3,:)+z(1,:).^2.*a.*c+z(1,:).*(z(4,:)+(-1).*z(1,:).*a.*c)+(1/6).*((-1)+c.^2).^(-3).*h.^2.*(z(3,:).^2.*a.*c.*(c.^2.*dt.^2+(-1).*dx.^2)+z(4,:).^2.*a.*c.*(c.^2.*dt.^2+(-1).*dx.^2)+(z(1,:).^2+z(2,:).^2).*a.*c.*(a.^2.*((1+2.*c.^2).*dt.^2+(-1).*(2+c.^2).*dx.^2)+(-2).*((-1)+c.^2).*(c.^2.*dt.^2+(-1).*dx.^2).*V1)+z(2,:).*z(3,:).*(a.^2.*(c.^4.*dt.^2+(-1).*dx.^2+3.*c.^2.*(dt.^2+(-1).*dx.^2))+(-1).*((-1)+c.^2).*(c.^4.*dt.^2+(-1).*dx.^2).*V1)+z(1,:).*z(4,:).*(a.^2.*((-1).*c.^4.*dt.^2+dx.^2+(-3).*c.^2.*(dt.^2+(-1).*dx.^2))+((-1)+c.^2).*(c.^4.*dt.^2+(-1).*dx.^2).*V1));

end

