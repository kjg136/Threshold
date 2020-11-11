function  [d,t] = MB19model(x0,T)
theta = [5.23 .34 .1 1.75]';
xbar = theta(1);
D = theta(2);
Ts = theta(4);

T=T*1000;
dt = 1; % kyr
t = (0:dt:T-dt)*1e-3; % in Myr
Steps = round(T/dt);
X = zeros(Steps,1);
X(1) = x0; % Use 5.8?
x = X(1);
for kk=2:Steps
    k1 = v(x,theta);
    k2 = v(x+dt/2*k1,theta);
    k3 = v(x+dt/2*k2,theta);
    k4 = v(x+dt*k3,theta);
    x = x+dt/6*(k1+2*k2+2*k3+k4)+sqrt(2*dt*D)*randn;
    X(kk) = x;
end
%Xs = smooth(X,2*Ts);

mu=4.5865;  % Average intensity from long, unscaled run
d=X./mu;
t=t'.*1000;
