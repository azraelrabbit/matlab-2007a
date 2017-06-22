function [transf_mat, am, freq, asatout] = processp2d(h, simfreq)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    myref = getreference(h);
    myp2d = myref.P2DData;
    intptype = lower(h.IntpType);
    ls11 = interp(myp2d, 'ls11', intptype, simfreq);
    ls21 = interp(myp2d, 'ls21', intptype, simfreq);
    ls12 = interp(myp2d, 'ls12', intptype, simfreq);
    [ls22, freq, pin] = interp(myp2d, 'ls22', intptype, simfreq);
    % 15 18
    % 16 18
    z0 = h.Z0;
    zs = h.ZS;
    zl = h.ZL;
    transf_mat = zeros(length(pin), length(simfreq));
    for ii=1.0:length(pin)
        sparam = zeros(2.0, 2.0, length(simfreq));
        sparam(1.0, 1.0, :) = ls11(ii, :);
        sparam(2.0, 1.0, :) = ls21(ii, :);
        sparam(1.0, 2.0, :) = ls12(ii, :);
        sparam(2.0, 2.0, :) = ls22(ii, :);
        transf_mat(ii, :) = s2tf(sparam, z0, zs, zl);
    end % for
    R0 = real(z0);
    am = sqrt(mtimes(R0, pin));
    % 31 33
    pout_max = max(unique(cat(1.0, myp2d.P2{:})));
    asatout = sqrt(mtimes(R0, pout_max));
end % function
