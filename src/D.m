function v = D(x,y)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% v = D(x,y) - jump set for synergistic hybrid feedback
%  x - 3d unitary vector
%  y - 3d unitary vector
%  v = 1 if (x,y)\in C and 0 otherwise
% globals
%  delta - positive scalar
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    global delta
    if mu(x,y) >= delta
        v = 1;
    else
        v = 0;
    end
        