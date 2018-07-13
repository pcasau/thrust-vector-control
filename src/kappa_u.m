function out = kappa_u(z,R)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% out = kappa_u(z,R) - thrust feedback law
%  z = (ddot_pd,pe,ve)
%  R - Rotation matrix
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    global g r
    ddot_pd = z(1:3);
    pe = z(4:6);
    ve = z(7:9);
    wv = w(pe,ve);
    vin = wv-g+ddot_pd;
    out = r'*R'*vin;