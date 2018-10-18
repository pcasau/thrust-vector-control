global rpm radi h g r bark1 K kp P b gamma delta k k1 svmaxP lbar_aa M_2 lambda1
%reference
rpm  = 3;
radi = 1;
h    = 1;
[M_2,M_3,td,pd] = test_traj;
%partial attitude controller
gamma     = 0.5;
k         = 1;
lbar_aa   = (2*(1+k+sqrt(1+2*k*gamma+k^2)))^(-1);
ubar_aa   = (2*(1+k-sqrt(1+2*k*gamma+k^2)))^(-1);
delta_max = k*(1+gamma)/(2+k*(1+gamma));
delta     = 0.01*delta_max;
Vstar     = delta+2/(2+k*(1+gamma));
k1        = 12;
%position controller
g       = [0;0;9.81];
r       = [0 0 -1]';
bark1   = 8;
lambda1 = 2*k*(1-Vstar)*(1-gamma)/(1+k+sqrt(1+2*k*gamma+k^2))^2;
b     = 0.99*(norm(g)-M_2);
Q     = blkdiag(diag([100 100 100]),diag([100 100 1]));
R     = diag([10 10 10]);
H     = blkdiag(500*eye(3),100*eye(3));
[K,kp,P] = Cguide(H,Q,R,lambda1,b,bark1);
svmaxP   = max(svd([zeros(3) eye(3)]*P^(1/2)));
%% Simulation
rule       = 1;
JSPAN      = [0 10];
TSPAN      = [0 6];
[zeta0,t0] = init(H);
W1_0       = W_1(zeta0);
options = odeset('reltol',1e-6,'abstol',1e-6);
[t,j,x] = HyEQsolver(@(x) [F_1(x(23),x(1:21));1],...
    @(x) [G_1(x);x(22)],@C_1,@D_1,[zeta0;W1_0;t0],TSPAN,JSPAN,rule,options);
%Plot Results
N = numel(t);
W1 = zeros(N,1);
for I = 1:N
    W1(I) = W_1(x(I,1:21)');
end
plot(t,[W1 x(:,22)])