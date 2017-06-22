function [y1, y2, y3, y4, y5] = initdistline(psb, blknum)
    % 1 23
    % 2 23
    % 3 23
    % 4 23
    % 5 23
    % 6 23
    % 7 23
    % 8 23
    % 9 23
    % 10 23
    % 11 23
    % 12 23
    % 13 23
    % 14 23
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    j = sqrt(-1.0);
    % 23 36
    % 24 36
    % 25 36
    % 26 36
    % 27 36
    % 28 36
    % 29 36
    % 30 36
    % 31 36
    % 32 36
    % 33 36
    % 34 36
    nphase = psb.distline(blknum, 1.0);
    noinp = psb.distline(blknum, 2.0);
    noout = psb.distline(blknum, 3.0);
    long = psb.distline(blknum, 4.0);
    icol = 5.0;
    Zmode = psb.distline(blknum, icol:minus(plus(icol, nphase), 1.0));
    icol = plus(icol, nphase);
    Rmode = psb.distline(blknum, icol:minus(plus(icol, nphase), 1.0));
    icol = plus(icol, nphase);
    Smode = psb.distline(blknum, icol:minus(plus(icol, nphase), 1.0));
    % 45 48
    % 46 48
    t0max = mrdivide(long, min(Smode));
    tvec = 0.0:mrdivide(t0max, 5.0):t0max;
    n_time = length(tvec);
    % 50 53
    % 51 53
    t0mode = rdivide(long, Smode);
    icol = plus(icol, nphase);
    Ti = reshape(psb.distline(blknum, icol:minus(plus(icol, mpower(nphase, 2.0)), 1.0)), nphase, nphase);
    n1 = plus(nphase, 1.0);
    n2 = mtimes(2.0, nphase);
    TTi = zeros(n2, n2);
    TTi(1.0:nphase, 1.0:nphase) = Ti;
    TTi(n1:n2, n1:n2) = Ti;
    Vlinet = zeros(mtimes(2.0, nphase), n_time);
    Ilinet = zeros(mtimes(2.0, nphase), n_time);
    for ifreq=1.0:size(psb.yss, 2.0)
        % 63 65
        w = mtimes(6.283185307179586, psb.freq(ifreq));
        % 65 74
        % 66 74
        % 67 74
        % 68 74
        % 69 74
        % 70 74
        % 71 74
        % 72 74
        Vmode = TTi' * psb.yss(noout:minus(plus(noout, mtimes(2.0, nphase)), 1.0), ifreq);
        Vline = times(Vmode, exp(mtimes(uminus(j), w) * horzcat(t0mode, t0mode)'));
        if eq(w, 0.0)
            Vlinet = plus(Vlinet, real(mtimes(Vline, exp(mtimes(mtimes(j, w), tvec)))));
        else
            Vlinet = plus(Vlinet, imag(mtimes(Vline, exp(mtimes(mtimes(j, w), tvec)))));
        end
        % 80 86
        % 81 86
        % 82 86
        % 83 86
        % 84 86
        H2 = etahlin(size(psb.D, 2.0), size(psb.yss, 1.0), psb.freq(ifreq), psb.distline);
        u2 = mtimes(H2, psb.yss(:, ifreq));
        h = rdivide(minus(Zmode, mrdivide(mtimes(Rmode, long), 4.0)), plus(Zmode, mrdivide(mtimes(Rmode, long), 4.0)));
        Imode = mtimes(inv(TTi), u2(noinp:minus(plus(noinp, mtimes(2.0, nphase)), 1.0)));
        Iline = times(times(Imode, ctranspose(horzcat(h, h))), exp(mtimes(uminus(j), w) * horzcat(t0mode, t0mode)'));
        % 90 92
        if eq(w, 0.0)
            Ilinet = plus(Ilinet, real(mtimes(Iline, exp(mtimes(mtimes(j, w), tvec)))));
        else
            Ilinet = plus(Ilinet, imag(mtimes(Iline, exp(mtimes(mtimes(j, w), tvec)))));
        end
    end % for
    % 97 100
    % 98 100
    y1 = horzcat(ctranspose(tvec), ctranspose(Vlinet(1.0:nphase, :)));
    y2 = horzcat(ctranspose(tvec), ctranspose(Vlinet(plus(nphase, 1.0):mtimes(2.0, nphase), :)));
    y3 = horzcat(ctranspose(tvec), ctranspose(Ilinet(1.0:nphase, :)));
    y4 = horzcat(ctranspose(tvec), ctranspose(Ilinet(plus(nphase, 1.0):mtimes(2.0, nphase), :)));
    % 103 105
    y5 = t0max;
end
