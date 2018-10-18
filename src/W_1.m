function [fx,Dfx] = W_1(zeta)
    global bark1
    z  = zeta(1:9);
    ad = z(1:3);
    pe = z(4:6);
    ve = z(7:9);
    R  = reshape(zeta(10:18),[3 3]);
    y  = zeta(19:21);
    [Vpv,gradVp] = Vp(pe,ve);
    [Vxy,gradVy] = V(R'*rho(z),y);
    fx = sqrt(Vpv)+bark1*sqrt(Vxy);
    if Vpv > 1e-6
        Dfx = 0.5*gradVp/sqrt(Vpv);
    else
        Dfx = zeros(6,1);
    end
    if Vxy > 1e-6
        Dfx = [Dfx;0.5*bark1*gradVy/sqrt(Vxy)];
    else
        Dfx = [Dfx;zeros(3,1)];
    end