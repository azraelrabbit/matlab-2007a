function [x, amam, ampm] = calcampm(h, fc)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    x = [];
    amam = [];
    ampm = [];
    % 10 13
    % 11 13
    if haspowerreference(h)
        refobj = getreference(h);
        pdata = get(refobj, 'PowerData');
    else
        return;
    end % if
    % 18 21
    % 19 21
    poutcell = get(pdata, 'Pout');
    phasecell = get(pdata, 'Phase');
    pincell = get(pdata, 'Pin');
    freq = get(pdata, 'Freq');
    lenth = length(freq);
    % 25 27
    rs = real(pdata.Z0);
    rl = real(pdata.Z0);
    % 28 31
    % 29 31
    if eq(lenth, 1.0) || eq(lenth, 0.0)
        idx = 1.0;
    else
        if le(fc, freq(1.0))
            idx = 1.0;
        else
            if ge(fc, freq(end))
                idx = lenth;
            else
                [f, idx] = min(abs(minus(freq, fc)));
            end % if
        end % if
    end % if
    p = poutcell{idx};
    phase = phasecell{idx};
    pin = pincell{idx};
    x = sqrt(mtimes(rs, pin));
    amam = sqrt(mtimes(rl, p));
    ampm = unwrap(mrdivide(mtimes(phase, 3.141592653589793), 180.0));
end % function
