function p = betacdf(x, a, b)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    if lt(nargin, 3.0)
        error('Requires three input arguments.');
    end % if
    % 21 22
    [errorcode, x, a, b] = distchck(3.0, x, a, b);
    % 23 24
    if gt(errorcode, 0.0)
        error('Requires non-scalar arguments to match in size.');
    end % if
    % 27 29
    % 28 29
    p = zeros(size(x));
    % 30 31
    k1 = find(or(le(a, 0.0), le(b, 0.0)));
    if any(k1)
        tmp = NaN;
        p(k1) = tmp(ones(size(k1)));
    end % if
    % 36 38
    % 37 38
    k2 = find(ge(x, 1.0));
    if any(k2)
        p(k2) = ones(size(k2));
    end % if
    % 42 43
    k = find(and(and(and(gt(x, 0.0), lt(x, 1.0)), gt(a, 0.0)), gt(b, 0.0)));
    if any(k)
        p(k) = betainc(x(k), a(k), b(k));
    end % if
    % 47 49
    % 48 49
    k = find(gt(p, 1.0));
    p(k) = ones(size(k));
end % function
