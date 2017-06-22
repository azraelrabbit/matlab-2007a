function x = finv(p, v1, v2)
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
    [errorcode, p, v1, v2] = distchck(3.0, p, v1, v2);
    % 21 22
    if gt(errorcode, 0.0)
        error('Requires non-scalar arguments to match in size.');
    end % if
    % 25 27
    % 26 27
    z = zeros(size(p));
    x = zeros(size(p));
    % 29 30
    k = or(or(le(v1, 0.0), le(v2, 0.0)), isnan(p));
    if any(k(:))
        x(k) = NaN;
    end % if
    % 34 35
    k1 = and(and(and(gt(p, 0.0), lt(p, 1.0)), gt(v1, 0.0)), gt(v2, 0.0));
    if any(k1(:))
        z = betainv(minus(1.0, p(k1)), mrdivide(v2(k1), 2.0), mrdivide(v1(k1), 2.0));
        x(k1) = rdivide(minus(rdivide(v2(k1), z), v2(k1)), v1(k1));
    end % if
    % 40 41
    k2 = and(and(eq(p, 1.0), gt(v1, 0.0)), gt(v2, 0.0));
    if any(k2(:))
        x(k2) = Inf;
    end % if
end % function
