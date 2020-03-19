%% Plots trajectory of exact and modified system as well as conserved quantities and corrected conserved quantities
% Relies on data specified in Potentials.m

%zinit = [20 10 -10 100];
zinit = [-1 2 -1 1];

Potentials

tau = 100;
N=1e5;
h = tau/N;
epochLength = 1000;

z = NaN(4,N+1); z(:,1) = zinit';
zmod = NaN(4,N+1); zmod(:,1) = zinit';
Hz = NaN(1,N+1);
Hzmod = NaN(1,N+1);

%% Plots
figure(1)
clf
subplot(4,1,1)
l1 = line(z(1,:),z(2,:));
xlabel('\phi_1')
ylabel('\phi_2')

subplot(4,1,2)
l2 = line(linspace(0,tau,N+1),Hz);
xlabel('t')
ylabel('H')

subplot(4,1,3)
l3 = line(z(1,:),z(2,:));
xlabel('\phi_1')
ylabel('\phi_2')

subplot(4,1,4)
l4 = line(linspace(0,tau,N+1),Hzmod);
xlabel('t')
ylabel('H')

figure(1)
%% Implicit Midpoint with fixpoint iterations
%%{

for k = 1:N
     z(:,k+1) = ImplMidptFixPointIter( z(:,k),DH,h,k);
     
     if mod(k,epochLength) == 0
         epoch = k/epochLength;
         Hz((epoch-1)*epochLength+1:k) = H(z(:,(epoch-1)*epochLength+1:k));
         l1.XData = z(1,:);
         l1.YData = z(2,:);
         l2.YData = Hz;
         drawnow
     end
     
end


%}

%%

%%{
JBig = [0     0    -1     0;     0     0     0    -1;     1     0     0     0;     0     1     0     0];
FSkew  = @(z) JBig*FModEq(z); %compatibility to ImplMidptFixPointIter


for k = 1:N
     zmod(:,k+1) = ImplMidptFixPointIter( zmod(:,k),FSkew,h,k);
     if mod(k,epochLength) == 0
         epoch = k/epochLength;
         Hzmod((epoch-1)*epochLength+1:k) = H(zmod(:,(epoch-1)*epochLength+1:k));
         l3.XData = zmod(1,:);
         l3.YData = zmod(2,:);
         l4.YData = Hzmod;
         drawnow
     end
end

%}


%% Leapfrog + FSolve with Jacobian
%{

q = NaN(2,N+1); q(:,1) = zinit(1:2)';
p = NaN(2,N+1); p(:,1) = zinit(3:4)';

for k = 1:N
     [q(:,k+1), p(:,k+1)] = Leapfrog_step(q(:,k),p(:,k), Hq, Hp, Hqp,h);
end

%figure
subplot(2,1,1)
plot(q(1,:),q(2,:))
xlabel('\phi_1')
ylabel('\phi_2')

subplot(2,1,2)
plot(linspace(0,tau,N+1),H([q;p]))
xlabel('t')
ylabel('H')
%}


%% ODE45
%{

zsol = ode45(F,[0 tau],zinit);

figure
subplot(2,1,1)
plot(zsol.y(1,:),zsol.y(2,:))
%plot(q(1,:),q(2,:))
xlabel('\phi_1')
ylabel('\phi_2')

subplot(2,1,2)
plot(zsol.x(1,:),H(zsol.y))
%plot(linspace(0,tau,N+1),H([q;p]))
xlabel('t')
ylabel('H')

%}

%% Behaviour of conserved quantity due to rotational invarance

J=[0 1;-1 0];

figure;
subplot(2,1,1)
plot(linspace(0,tau,N+1),dot((J*z(3:4,:)),z(1:2,:)))
xlabel('time')
ylabel('conserved quantity')
title('Rotational invarance - exact system')

subplot(2,1,2)
plot(linspace(0,tau,N+1),dot((J*zmod(3:4,:)),zmod(1:2,:)))
xlabel('time')
ylabel('conserved quantity')
title('Rotational invarance - modified system')

%% Plot modified quantity for H up to 4th order

figure

plot(linspace(0,tau,N+1),H(zmod),linspace(0,tau,N+1),Imod(zmod))
legend('H','H corrected')
xlabel('time')
ylabel('H')
title('Energy behaviour modified system')

%orient landscape; print('HvsHmod','-dpdf','-fillpage')

