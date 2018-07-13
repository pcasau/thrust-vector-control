function muxy = mu(x,y)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% muxy = mu(x,y) - synergy gap function
%  x - 3d unitary vector
%  y - 3d unitary vector
%  muxy - nonnegative scalar
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [~,minVy] = minV(x);
    muxy = V(x,y) - minVy;
end