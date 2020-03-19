function [fval,Dfval] = comb(z,f,Df)
    fval = f(z);
    Dfval = Df(z);
end