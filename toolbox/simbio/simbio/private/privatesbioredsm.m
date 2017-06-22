function [P, L0, NR, ND] = privatesbioredsm(N, lflag, tol)
    % 1 38
    % 2 38
    % 3 38
    % 4 38
    % 5 38
    % 6 38
    % 7 38
    % 8 38
    % 9 38
    % 10 38
    % 11 38
    % 12 38
    % 13 38
    % 14 38
    % 15 38
    % 16 38
    % 17 38
    % 18 38
    % 19 38
    % 20 38
    % 21 38
    % 22 38
    % 23 38
    % 24 38
    % 25 38
    % 26 38
    % 27 38
    % 28 38
    % 29 38
    % 30 38
    % 31 38
    % 32 38
    % 33 38
    % 34 38
    % 35 38
    % 36 38
    % 37 38
    [m, n] = size(ctranspose(N));
    if lt(nargin, 2.0)
        lflag = 0.0;
    end % if
    % 42 44
    % 43 44
    [Q, R, P] = qr(full(ctranspose(N)), 0.0);
    % 45 47
    % 46 47
    maxrank = min(m, n);
    absdiag = abs(diag(R));
    if lt(nargin, 3.0) && not(isempty(absdiag))
        tol = mtimes(max(m, n), eps(absdiag(1.0)));
    end % if
    % 52 53
    k = 0.0;
    while lt(k, maxrank) && gt(absdiag(plus(k, 1.0)), tol)
        k = plus(k, 1.0);
    end % while
    % 57 61
    % 58 61
    % 59 61
    % 60 61
    P = horzcat(P(1.0:k), sort(P(plus(k, 1.0):n)));
    % 62 64
    % 63 64
    NR = N(P(1.0:k), :);
    ND = N(P(plus(k, 1.0):n), :);
    % 66 68
    % 67 68
    L0 = mrdivide(ND, NR);
    % 69 76
    % 70 76
    % 71 76
    % 72 76
    % 73 76
    % 74 76
    % 75 76
    if lflag
        L0 = vertcat(eye(k), L0);
    end % if
end % function
