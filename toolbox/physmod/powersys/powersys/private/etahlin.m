function H2 = etahlin(ninput, noutput, freq, lines)
    % 1 91
    % 2 91
    % 3 91
    % 4 91
    % 5 91
    % 6 91
    % 7 91
    % 8 91
    % 9 91
    % 10 91
    % 11 91
    % 12 91
    % 13 91
    % 14 91
    % 15 91
    % 16 91
    % 17 91
    % 18 91
    % 19 91
    % 20 91
    % 21 91
    % 22 91
    % 23 91
    % 24 91
    % 25 91
    % 26 91
    % 27 91
    % 28 91
    % 29 91
    % 30 91
    % 31 91
    % 32 91
    % 33 91
    % 34 91
    % 35 91
    % 36 91
    % 37 91
    % 38 91
    % 39 91
    % 40 91
    % 41 91
    % 42 91
    % 43 91
    % 44 91
    % 45 91
    % 46 91
    % 47 91
    % 48 91
    % 49 91
    % 50 91
    % 51 91
    % 52 91
    % 53 91
    % 54 91
    % 55 91
    % 56 91
    % 57 91
    % 58 91
    % 59 91
    % 60 91
    % 61 91
    % 62 91
    % 63 91
    % 64 91
    % 65 91
    % 66 91
    % 67 91
    % 68 91
    % 69 91
    % 70 91
    % 71 91
    % 72 91
    % 73 91
    % 74 91
    % 75 91
    % 76 91
    % 77 91
    % 78 91
    % 79 91
    % 80 91
    % 81 91
    % 82 91
    % 83 91
    % 84 91
    % 85 91
    % 86 91
    % 87 91
    % 88 91
    % 89 91
    w = mtimes(6.283185307179586, freq);
    j = sqrt(-1.0);
    [nline, ncol] = size(lines);
    H2 = zeros(ninput, noutput);
    % 94 99
    % 95 99
    % 96 99
    % 97 99
    for iline=1.0:nline
        nphase = lines(iline, 1.0);
        noinp = lines(iline, 2.0);
        noout = lines(iline, 3.0);
        long = lines(iline, 4.0);
        icol = 5.0;
        Zmode = lines(iline, icol:minus(plus(icol, nphase), 1.0));
        icol = plus(icol, nphase);
        Rmode = lines(iline, icol:minus(plus(icol, nphase), 1.0));
        icol = plus(icol, nphase);
        Smode = lines(iline, icol:minus(plus(icol, nphase), 1.0));
        t0mode = rdivide(long, Smode);
        icol = plus(icol, nphase);
        Ti = reshape(lines(iline, icol:minus(plus(icol, mpower(nphase, 2.0)), 1.0)), nphase, nphase);
        Zimp = zeros(nphase, nphase);
        for imode=1.0:nphase
            Zimp(imode, imode) = plus(Zmode(imode), mrdivide(mtimes(Rmode(imode), long), 4.0));
        end % for
        Y = mtimes(Ti, inv(Zimp)) * Ti';
        % 117 119
        n1 = plus(nphase, 1.0);
        n2 = mtimes(2.0, nphase);
        Ysr = zeros(n2, n2);
        Ysr(1.0:nphase, 1.0:nphase) = Y;
        Ysr(n1:n2, n1:n2) = Y;
        DD = zeros(n2, n2);
        DD(1.0:nphase, 1.0:nphase) = uminus(eye(nphase, nphase));
        DD(n1:n2, n1:n2) = eye(nphase, nphase);
        TTi = zeros(n2, n2);
        TTi(1.0:nphase, 1.0:nphase) = Ti;
        TTi(n1:n2, n1:n2) = Ti;
        TTv = TTi;
        % 130 135
        % 131 135
        % 132 135
        % 133 135
        Ym = zeros(1.0, n2);
        for imode=1.0:nphase
            gamal = mrdivide(mtimes(mrdivide(mtimes(j, w), Smode(imode)), long), 2.0);
            A1 = cosh(gamal);
            B1 = mtimes(Zmode(imode), sinh(gamal));
            C1 = mtimes(mrdivide(1.0, Zmode(imode)), sinh(gamal));
            D1 = A1;
            ML = vertcat(horzcat(A1, B1), horzcat(C1, D1));
            MR1 = vertcat(horzcat(1.0, mrdivide(mtimes(Rmode(imode), long), 4.0)), [0.0 1.0]);
            MR2 = vertcat(horzcat(1.0, mrdivide(mtimes(Rmode(imode), long), 2.0)), [0.0 1.0]);
            M = mtimes(mtimes(mtimes(mtimes(MR1, ML), MR2), ML), MR1);
            Ym(imode, imode) = mrdivide(M(1.0, 1.0), M(1.0, 2.0));
            Ym(plus(imode, nphase), plus(imode, nphase)) = mrdivide(uminus(M(1.0, 1.0)), M(1.0, 2.0));
            Ym(imode, plus(imode, nphase)) = mrdivide(-1.0, M(1.0, 2.0));
            Ym(plus(imode, nphase), imode) = mrdivide(1.0, M(1.0, 2.0));
        end % for
        % 150 154
        % 151 154
        % 152 154
        H2(noinp:minus(plus(noinp, mtimes(2.0, nphase)), 1.0), noout:minus(plus(noout, mtimes(2.0, nphase)), 1.0)) = plus(Ysr, mtimes(mtimes(DD, TTi), Ym) * TTi');
    end % for
end
