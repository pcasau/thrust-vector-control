function out = f(state,input)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% out = f(state,input) - dynamical model for a vectored thrust vehicle
%  p = state(1:3): position in the inertial reference frame (IRF)
%  v = state(4:6): velocity in the inertial reference frame (IRF)
%  R = reshape(state(7:15),[3 3]): Rotation matrix from BRF to IRF
%  u = input(1): magnitude of the thrust (in m/s^2)
%  omg = input(2:4): angular velocity
% globals
%  g - gravity vector (in m/s^2)
%  r - thrust vector (|r|=1)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    global r g
    p = state(1:3);
    v = state(4:6);
    R = reshape(state(7:15),[3 3]);
    u = input(1);
    omg = input(2:4);
    
    dp = v;
    dv = R*r*u+g;
    dR = R*S(omg);
    
    out = [dp;dv;dR(:)];