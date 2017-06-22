function y = betapdf(x, a, b)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    if lt(nargin, 3.0)
        error('Requires three input arguments.');
    end % if
    % 19 20
    [errorcode, x, a, b] = distchck(3.0, x, a, b);
    % 21 22
    if gt(errorcode, 0.0)
        error('Requires non-scalar arguments to match in size.');
    end % if
    % 25 27
    % 26 27
    y = zeros(size(x));
    % 28 30
    % 29 30
    k1 = find(or(le(a, 0.0), le(b, 0.0)));
    if any(k1)
        tmp = NaN;
        y(k1) = tmp(ones(size(k1)));
    end % if
    % 35 38
    % 36 38
    % 37 38
    k2 = find(or(and(eq(x, 0.0), lt(a, 1.0)), and(eq(x, 1.0), lt(b, 1.0))));
    if any(k2)
        tmp = Inf;
        y(k2) = tmp(ones(size(k2)));
    end % if
    % 43 45
    % 44 45
    k = find(not(or(or(or(le(a, 0.0), le(b, 0.0)), le(x, 0.0)), ge(x, 1.0))));
    if any(k)
        % 47 48
        tmp(k) = minus(plus(times(minus(a(k), 1.0), log(x(k))), times(minus(b(k), 1.0), log(minus(1.0, x(k))))), betaln(a(k), b(k)));
        y(k) = exp(tmp(k));
    end % if
end % function
