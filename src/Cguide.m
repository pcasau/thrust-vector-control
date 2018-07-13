function [K,kp,P] = Cguide(H,Q,R,lambda1,b,bark1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% [K,kp,P] = Cguide(H,Q,R,lambda1,b,bark1) - implementation of (C1)-(C4)
%  H,Q,P - positive definite 6x6 matrix
%  R - positive definite 3x3 matrix
%  lambda1,b,bark1,k - positive scalars
%  K - 3x6 matrix
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    A     = [zeros(3),eye(3);zeros(3,6)];
    B     = [zeros(3);eye(3)];
    ell_P = (1+bark1)^2;
    cvx_begin
        variable Y(6,6) symmetric
        variable L(3,6)
        minimize trace_inv(Y)
        subject to
            [-(A*Y+B*L)'-(A*Y+B*L), Y, L';Y, Q^-1 zeros(6,3);L,zeros(3,6),R^-1] == semidefinite(15)
            [Y,L';L,b^2/ell_P*eye(3)] == semidefinite(9)
            -H^-1+Y == semidefinite(6)
    cvx_end
    K = L*Y^(-1);
    P = Y^(-1);
    kp= 1.1/(bark1*lambda1);