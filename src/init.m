function x0 = init(H)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% x0 = init(H) - random selection of initial conditions
%  
%  H - 6x6 positive definite matrix
%  x0 = (ad0,pe0,ve0,R0,y0,0), where the last 0 stands for the initial time
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    global gamma r 
    %Select an initial tracking error at random from 
    %{(pe,ve)\in R^6:[pe' ve']*H*[pe;ve]<=1}
    lvl = rand;
    v = rand(6,1)*2-1;
    v = v/norm(v);
    u0 = v/sqrt(v'*H*v/lvl);
    pe0 = u0(1:3);
    ve0 = u0(4:6);
    %Select initial acceleration
    t0 = 0;
    [~,~,ad0] = circle(t0);
    %Select initial attitude from SO(3)
    R0 = rand(3)*2-1;
    [U,S,V] = svd(R0'*R0);
    R0 = (U*S.^(1/2)*V')^(-1)*R0';
    R0 = R0*det(R0);
    %Select initial value of the logic variable y from
    %{y\in S^2:y'*r<=gamma}
    y0 = rand(3,1)*2-1;
    y0 = y0/norm(y0);
    if y0'*r>gamma
        y0 = PT(r)*y0/norm(PT(r)*y0)*sqrt(1-gamma^2)+gamma*r;
    end
    x0 = [ad0;pe0;ve0;R0(:);y0;t0];