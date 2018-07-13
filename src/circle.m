function [pd,vd,ad,jd] = circle(t)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% [pd,vd,ad,jd] = circle(t)
%  t - time [s];
%  pd - position
%  vd - velocity
%  ad - acceleration
%  jd - jerk
% globals
%  rpm - revolutions per minute
%  radi - radius
%  h - height
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    global rpm radi h
    pd= radi*[cos((rpm*2*pi/60)*t);sin((rpm*2*pi/60)*t);-h];
    vd= (rpm*2*pi/60)*radi*[-sin((rpm*2*pi/60)*t);cos((rpm*2*pi/60)*t);0];
    ad= (rpm*2*pi/60)^2*radi*[-cos((rpm*2*pi/60)*t);-sin((rpm*2*pi/60)*t);0];
    jd= (rpm*2*pi/60)^3*radi*[sin((rpm*2*pi/60)*t);-cos((rpm*2*pi/60)*t);0];
    
    