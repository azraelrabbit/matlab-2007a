function [ad, bd, cd, dd] = mblkczp(g, xz, wz, xp, wp, ts)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    error(nargchk(5.0, 6.0, nargin));
    if lt(nargin, 6.0)
        ts = [];
    end % if
    if isempty(ts)
        ts = 0.0;
    end % if
    if isempty(wz)
        k = mtimes(g, prod(power(wp, 2.0)));
    else
        k = mrdivide(mtimes(g, prod(power(wp, 2.0))), prod(power(wz, 2.0)));
    end % if
    xz = xz(:);
    wz = wz(:);
    xp = xp(:);
    wp = wp(:);
    imZ = sqrt(minus(power(xz, 2.0), 1.0));
    Z = vertcat(times(plus(uminus(xz), imZ), wz), times(minus(uminus(xz), imZ), wz));
    imP = sqrt(minus(power(xp, 2.0), 1.0));
    P = vertcat(times(plus(uminus(xp), imP), wp), times(minus(uminus(xp), imP), wp));
    [a, b, c, d] = zp2ss(Z, P, k);
    if eq(ts, 0.0)
        ad = a;
        bd = b;
        cd = c;
        dd = d;
    else
        [nx, na] = size(a);
        [nb, nu] = size(b);
        I = eye(nx);
        P = inv(minus(I, mrdivide(times(a, ts), 2.0)));
        ad = mtimes(plus(I, mrdivide(times(a, ts), 2.0)), P);
        bd = mtimes(P, b);
        cd = mtimes(mtimes(ts, c), P);
        dd = plus(mrdivide(mtimes(cd, b), 2.0), d);
    end % if
    return;
end % function
