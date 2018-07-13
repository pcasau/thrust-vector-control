function [Vpv,gradV] = Vp(pe,ve)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% [Vpv,gradV] = Vp(pe,ve) - Lyapunov function for the position subsystem
%
%  pe - position tracking error
%  ve - velocity tracking error
%
% globals
%  P - 6x5 positive definite matrix
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    global P
    Vpv = [pe' ve']*P*[pe;ve];
    gradV = 2*P*[pe;ve];
    