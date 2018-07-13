function [rhoz, Drhoz] = rho(z)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% out = rho(z) - commanded thrust vector
%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    global g
    ddot_pd = z(1:3);
    pe = z(4:6);
    ve = z(7:9);
    [wv,Dw] = w(pe,ve);
    vin = wv-g+ddot_pd;
    rhoz = vin/norm(vin);
    Drhoz = -S(rhoz)^2*[eye(3) Dw]/norm(vin);