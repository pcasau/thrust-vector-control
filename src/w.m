function [wv,Dwv] = w(pe,ve)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% [wv,Dw] = w(pe,ve) - saturated feedback law
%  pe - position tracking error
%  ve - velocity tracking error
%  wv - w(pe,ve)
%  Dw = Dw/Dpv
% globals
%  K - 3x6 real matrix
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    global K
    wv = zeros(3,1);
    Dwv= zeros(3);
    for I = 1:3
        x = K*[pe;ve];
        [v,Dv] = sat(x(I));
        wv(I) = v;
        Dwv(I,I) = Dv;
    end
    Dwv = Dwv*K;
end

    