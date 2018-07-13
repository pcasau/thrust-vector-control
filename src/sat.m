function [v,Dv] = sat(x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% [v,Dv] = sat(x) - continuously differentiable strictly increasing
% function satisfying sat(x)=x for -b<=x<=b and (M_2-|g|)<sat(x)<(|g|-M_2)
% 
% globals
%  g - acceleration of gravity
%  M_2 - positive scalar smaller than |g|
%  b - positive scalar smaller than |g|-M_2
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    global b M_2 g
    if abs(x) <= b
        v = x;
        Dv= 1;
    elseif x>b
        a = 2*(norm(g)-M_2-b)/pi;
        v = b+a*atan((x-b)/a);
        Dv= (1+((x-b)/a)^2)^(-1);
    else
        a = 2*(norm(g)-M_2-b)/pi;
        v = b+a*atan((x+b)/a);
        Dv= (1+((x+b)/a)^2)^(-1);
    end