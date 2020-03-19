function [q0, p0] = Leapfrog_step( q0, p0,  Hq, Hp, Hqp, h)
    
% Stroemer-Verlet scheme / generalized Leapfrog / involves fsolve

persistent options

options = optimoptions(@fsolve,...
                            'Display','none',...
                            'SpecifyObjectiveGradient',true);
               %             'FunctionTolerance',1e-16,...
               %             'MaxFunctionEvaluations',1e10,...   
               %             'OptimalityTolerance',1e-16,...
               %             'StepTolerance',1e-16,...
               
   
        obj1 = @(p12) p0-h/2*Hq(q0,p12)-p12;
        Dobj1 = @(p12) -h/2*Hqp(q0,p12)-eye(length(p0));        
        p12 = fsolve(@(z)comb(z,obj1,Dobj1),p0,options);
        
        
        obj2 = @(q1) q0 + h/2*(Hp(q0,p12)+Hp(q1,p12))-q1;
        Dobj2 = @(q1) h/2*Hqp(q1,p12)'-eye(length(q0));
        q0 = fsolve(@(z) comb(z,obj2,Dobj2),q0,options);
        
        p0 = p12-h/2*Hq(q0,p12);
   
end

