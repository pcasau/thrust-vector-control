function [yminV,minVy] = minV(x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% [yminV,minVy] = minV(x) 
%  x - unitary vector
%  yminV = argmin{V(x,y): y\in Q}
%  minVy = min{V(x,y): y\in Q}
% globals
%  r - reference unitary vector
%  gamma - scalar between -1 and 1
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    global gamma r
    if  x'*r == 1
        yminV = rand*2-1;
        yminV = yminV/norm(yminV);
    elseif r'*x >= -gamma
        yminV = -x;
    elseif r'*x < -gamma && r'*x>-1
        yminV = sigma(r'*x)*PT(x)*r/norm(PT(x)*r)+alpha(r'*x)*x;
    else
        yminV = rand*2-1;
        yminV = sqrt(1-gamma^2)*PT(r)*yminV/norm(PT(r)*yminV)+gamma*r;
    end
    minVy = V(x,yminV);
end
function out = sigma(v)
    global gamma
    out = gamma*sqrt(1-v^2)+v*sqrt(1-gamma^2);
end
function out = alpha(v)
    global gamma
    out = gamma*v-sqrt((1-v^2)*(1-gamma^2));
end