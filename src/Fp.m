function Fpv = Fp(jd,zeta)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Fpv = Fp(jd,zeta)
%  jd - reference jerk
%  zeta = (z,R,y)
%  Fpv - 9d vector
% globals 
%  r - thrust vector in BRF
%  g - acceleration of gravity
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    global r g
    z  = zeta(1:9);
    ad = z(1:3);
    pe = z(4:6);
    ve = z(7:9);
    R  = reshape(zeta(10:18),[3 3]);
    y  = zeta(19:21);
    Fpv = [jd;ve;R*r*kappa_u(z,R)+g-ad];