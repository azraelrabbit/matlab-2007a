function sz = gui_sizes(hSuper)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pf = mrdivide(get(0.0, 'screenpixelsperinch'), 96.0);
    if isunix
        pf = 1.0;
    end % if
    sz.pixf = pf;
    % 12 15
    % 13 15
    sz.vfus = mtimes(5.0, pf);
    sz.hfus = mtimes(10.0, pf);
    sz.ffs = mtimes(5.0, pf);
    sz.vffs = mtimes(15.0, pf);
    sz.lfs = mtimes(10.0, pf);
    sz.uuvs = mtimes(10.0, pf);
    sz.uuhs = mtimes(10.0, pf);
    % 21 24
    % 22 24
    sz.ebw = mtimes(90.0, pf);
    sz.bh = mtimes(20.0, pf);
    sz.tw = mtimes(100.0, pf);
    % 26 29
    % 27 29
    if ispc
        sz.fontsize = 8.0;
    else
        sz.fontsize = 10.0;
    end % if
    lang = get(0.0, 'language');
    if strncmpi(lang, 'ja', 2.0)
        sz.fontsize = plus(sz.fontsize, 2.0);
    end % if
    sz.lh = mtimes(plus(sz.fontsize, 10.0), pf);
    sz.uh = sz.lh;
    sz.lblTweak = mtimes(3.0, pf);
    sz.popwTweak = mtimes(22.0, pf);
    sz.rbwTweak = mtimes(22.0, pf);
end % function
