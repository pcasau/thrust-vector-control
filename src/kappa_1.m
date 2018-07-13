function kappav = kappa_1(jd,zeta)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% kappav = kappa_1(jd,zeta) - angular velocity feedback
%
%  jd - reference jerk
%  zeta = (z,R,y)
%  kappav - 3d vector
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    global kp k1
    z  = zeta(1:9);
    ad = z(1:3);
    pe = z(4:6);
    ve = z(7:9);
    R  = reshape(zeta(10:18),[3 3]);
    y  = zeta(19:21);
    [rhoz,Drhoz] = rho(z);
    [~,gradVy] = V(R'*rhoz,y);
    kappav = S(R'*rhoz)*(R'*Drhoz*Fp(jd,zeta)+(k1+kp*nu_star(z))*gradVy);