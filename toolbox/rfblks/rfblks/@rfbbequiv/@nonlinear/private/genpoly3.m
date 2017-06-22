function [method, am2pm, inputeffect, outputGain] = genpoly3(h, abslineargain, iip3, oip3)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    if isinf(iip3)
        iip3 = mrdivide(oip3, mpower(abslineargain, 2.0));
    end % if
    % 15 16
    z0 = h.Z0;
    R0 = real(z0);
    method = 3.0;
    am2pm = 0.0;
    inputeffect = sqrt(mrdivide(mrdivide(3.0, R0), iip3));
    outputGain = mrdivide(1.0, inputeffect);
end % function
