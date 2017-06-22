function sz = sptsizes
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    sz.ih = 47.0;
    sz.iw = 42.0;
    sz.lw = 130.0;
    sz.fus = 5.0;
    sz.ffs = 5.0;
    sz.lfs = 3.0;
    if not(isempty(findstr(computer, 'PC')))
        sz.lh = plus(get(0.0, 'defaultuicontrolfontsize'), 10.0);
    else
        sz.lh = plus(get(0.0, 'defaultuicontrolfontsize'), 4.0);
    end % if
    sz.uh = 20.0;
    sz.rw = 130.0;
    sz.rih = 40.0;
    sz.riw = mrdivide(minus(minus(sz.rw, mtimes(2.0, sz.ffs)), mtimes(2.0, sz.fus)), 2.0);
    sz.rh = minus(plus(mtimes(2.0, sz.uh), mtimes(3.0, sz.fus)), 3.0);
    sz.pmw = 14.0;
    sz.lbs = 3.0;
    sz.as = [50.0 40.0 20.0 30.0];
    % 28 29
    scalefactor = mpower(mrdivide(get(0.0, 'screenpixelsperinch'), 72.0), .5);
    sz.as = mtimes(sz.as, scalefactor);
    % 31 32
    if ispc
        tweak = 5.0;
    else
        tweak = 0.0;
    end % if
    sz.ph = plus(35.0, tweak);
    % 38 39
    sz.bw = 110.0;
end % function
