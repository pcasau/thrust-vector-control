function [Vxy,gradVy] = V(x,y)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% [Vxy,gradVy] = V(x,y)
%  x,y - unitary vectors
%  Vxy = V(x,y) = (1-r' x)/(1-r' x+k(1-y' x))
%  gradVy = dV/dx
% globals
%  k - positive scalar
%  r - reference unitary vector
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    global k r
    Vxy = (1-r'*x)/(1-r'*x+k*(1-y'*x));
    gradVy = (k*Vxy*y-(1-Vxy)*r)/(1-r'*x+k*(1-y'*x));
    