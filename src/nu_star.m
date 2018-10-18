function nuv = nu_star(z)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% nuv = nu_star(z) - controller gain adaptation
%
%  z = (ad,pe,ve) - 9d vector
%  nuv - nonnegative scalar
%
% globals
%  svmaxP - nonnegative scalar
%  lbar_aa - positive scalar
%  g - acceleration of gravity
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    global svmaxP lbar_aa g
    ddot_pd = z(1:3);
    pe = z(4:6);
    ve = z(7:9);
    nuv = 4*svmaxP*norm(w(pe,ve)+g-ddot_pd)/sqrt(lbar_aa);