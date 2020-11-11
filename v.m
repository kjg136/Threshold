function out = v(x,theta)
% theta = [xbar D g Ts a]';
xbar = theta(1);
g = theta(3);

if x>0
    out = -g*(x-xbar)*(x/xbar);
else
    out = g*(-x-xbar)*(-x/xbar);
end
    


