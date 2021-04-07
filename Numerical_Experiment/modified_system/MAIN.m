%% Plots trajectory of exact and modified system as well as conserved quantities and corrected conserved quantities

global a c dt dx V0Fun V1Fun V2Fun V3Fun

% data
dx = 0.1;
dt = 0.15;
a = 0.3;
c = 2;


%Potential
cc=-0.1;
V0Fun = @(s) cc*s.^4+s;
V1Fun = @(s) cc*4*s.^3+ones(size(s));
V2Fun = @(s) cc*12*s.^2;
V3Fun = @(s) cc*12*s;


zinit = 0.1*[-1.1 -0.1 -1 1];

tau = 4000;
N=1e5;
h = tau/N;          % step size                      
epochLength = 1e3;

zmod = NaN(4,N+1); zmod(:,1) = zinit';      % q and p data modfied system
Hz = NaN(1,N+1);                            % exact H on exact system
Hzmod = NaN(1,N+1);                         % exact H on modified system
Hmodz = NaN(1,N+1);                         % exact Hmod on modified system
pl=gobjects(3,1);

%% Plots
%%{
f(1)=figure(1);
clf

subplot(2,1,1)
l3 = line(zmod(1,:),zmod(2,:));
xlabel('q')
ylabel('p')

subplot(2,1,2)
l4 = line(linspace(0,tau,N+1),Hzmod);
xlabel('t')
ylabel('H')

figure(1)
%}

%% modified system
%%{
for k = 1:N
     zmod(:,k+1) = ImplMidptFixPointIter( zmod(:,k),@(z) F(z,1),h,k);
     
     % live plot
     if mod(k,epochLength) == 0
         epoch = k/epochLength;
         Hzmod((epoch-1)*epochLength+1:k) = H(zmod(:,(epoch-1)*epochLength+1:k),0);
         l3.XData = zmod(1,:);
         l3.YData = zmod(2,:);
         l4.YData = Hzmod;
         drawnow
     end
     
end
%}



%% ODE45
%{

zsol = ode45(@(~,z) F(z,1),[0 tau],zinit);

figure
subplot(2,1,1)
plot(zsol.y(1,:),zsol.y(2,:))
%plot(q(1,:),q(2,:))
xlabel('q_1')
ylabel('q_2')

subplot(2,1,2)
plot(zsol.x(1,:),H(zsol.y,1))
%plot(linspace(0,tau,N+1),H([q;p]))
xlabel('t')
ylabel('H')

%}

%% Behaviour of conserved quantities
%%{
J=[0 1;-1 0];
tt = linspace(0,tau,N+1);

f(2)=figure;

pl(1:2)=plot(tt,I(zmod,0),tt,I(zmod,1));
legend('I','Imod')
xlabel('time')
ylabel('conserved quantity')
title('Rotational invarance - modified system')

%% Plot modified quantity for H up to 4th order

f(3)=figure;

pl(3:4)=plot(tt,H(zmod,0),tt,H(zmod,1));
legend('H','H mod')
xlabel('time')
ylabel('H')
title('Energy behaviour modified system')
%}

%% Replot phase

f(4)=figure;
pl(5)=plot(zmod(1,:),zmod(2,:));
xlabel('$q_1$','Interpreter','Latex')
ylabel('$q_2$','Interpreter','Latex')

%% Print
%{
orient(f(2),'landscape'); print(f(2),'./figs/IDyn.pdf','-dpdf','-fillpage')
orient(f(3),'landscape'); print(f(3),'./figs/HDyn.pdf','-dpdf','-fillpage')
orient(f(4),'landscape'); print(f(4),'./figs/Phase.pdf','-dpdf','-fillpage')
%}
