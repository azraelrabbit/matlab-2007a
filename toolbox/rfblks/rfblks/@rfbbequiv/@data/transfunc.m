function transf = transfunc(h)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    transf = [];
    % 10 12
    z0 = get(h, 'Z0');
    zs = get(h, 'ZS');
    zl = get(h, 'ZL');
    if eq(real(z0), 0.0) && eq(imag(z0), 0.0)
        z0 = 2.220446049250313e-16;
    end % if
    if eq(real(zs), 0.0) && eq(imag(zs), 0.0)
        zs = 2.220446049250313e-16;
    end % if
    if eq(real(zl), 0.0) && eq(imag(zl), 0.0)
        zl = 2.220446049250313e-16;
    end % if
    sparams = h.S_Parameters;
    if isempty(sparams)
        transf = rdivide(zl, plus(zs, zl));
    else
        if all(eq(sparams(1.0, 1.0, :), 0.0)) && all(eq(sparams(1.0, 2.0, :), 1.0)) && all(eq(sparams(2.0, 1.0, :), 1.0)) && all(eq(sparams(2.0, 2.0, :), 0.0))
            transf = rdivide(zl, plus(zs, zl));
        else
            if all(eq(sparams(1.0, 1.0, :), sparams(1.0, 1.0, 1.0))) && all(eq(sparams(1.0, 2.0, :), sparams(1.0, 2.0, 1.0))) && all(eq(sparams(2.0, 1.0, :), sparams(2.0, 1.0, 1.0))) && all(eq(sparams(2.0, 2.0, :), sparams(2.0, 2.0, 1.0)))
                s11 = sparams(1.0, 1.0, 1.0);
                s12 = sparams(1.0, 2.0, 1.0);
                s21 = sparams(2.0, 1.0, 1.0);
                s22 = sparams(2.0, 2.0, 1.0);
                gammaL = mrdivide(minus(zl, z0), plus(zl, z0));
                gammaS = mrdivide(minus(zs, z0), plus(zs, z0));
                gammaIn = plus(s11, mrdivide(mtimes(mtimes(s12, s21), gammaL), minus(1.0, mtimes(s22, gammaL))));
                transf = rdivide(mrdivide(mtimes(mtimes(mtimes(.5, s21), plus(1.0, gammaL)), minus(1.0, gammaS)), minus(1.0, mtimes(s22, gammaL))), minus(1.0, times(gammaIn, gammaS)));
            else
                [m1, m2, m3] = size(sparams);
                tf = zeros(1.0, 1.0, m3);
                gammaL = rdivide(minus(zl, z0), plus(zl, z0));
                gammaS = rdivide(minus(zs, z0), plus(zs, z0));
                gammaIn = plus(sparams(1.0, 1.0, :), rdivide(times(times(sparams(1.0, 2.0, :), sparams(2.0, 1.0, :)), gammaL), minus(1.0, times(sparams(2.0, 2.0, :), gammaL))));
                transf = rdivide(rdivide(times(times(mtimes(.5, sparams(2.0, 1.0, :)), plus(1.0, gammaL)), minus(1.0, gammaS)), minus(1.0, times(sparams(2.0, 2.0, :), gammaL))), minus(1.0, times(gammaIn, gammaS)));
            end % if
        end % if
    end % if
end % function
