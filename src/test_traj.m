function [M_2,M_3,td,xd] = test_traj
    global rpm radi 
    options = odeset('RelTol',1e-6,'abstol',1e-6);
    TSPAN = [0 60];
    [p0,v0,a0] = circle(0);
    x0 = [p0;v0;a0];
    [td,xd] = ode45(@f,TSPAN,x0,options);
    plot(td,xd);
    M_2 = (rpm*2*pi/60)^2*radi;
    M_3 = (rpm*2*pi/60)^3*radi;
end
function dx = f(t,x)
    [~,~,~,jd] = circle(t);
    dx = [x(4:9);jd];
end