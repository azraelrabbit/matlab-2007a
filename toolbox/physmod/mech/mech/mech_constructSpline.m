function res = mech_constructSpline(xy, endConditions)
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
    switch endConditions
    case 'natural'
        requiredPoints = 2.0;
    case 'not-a-knot'
        requiredPoints = 4.0;
    case 'periodic'
        if not(isequal(xy(:, 1.0), xy(:, end)))
            xy = horzcat(xy, xy(:, 1.0));
        end % if
        requiredPoints = 3.0;
    otherwise
        error('physmod:mech:mech_constructSpline:UnrecognizedEndConditionsType', 'Unrecognized end-conditions type: %s', endConditions);
        % 29 31
    end % switch
    % 31 33
    [xyd, n] = size(xy);
    % 33 35
    if lt(n, requiredPoints)
        error('physmod:mech:mech_constructSpline:NotEnoughBreakpoints', 'Not enough breakpoints to construct the spline.')
        % 36 38
    end % if
    % 38 40
    t = splineParametrize(xy);
    t = t(:);
    dt = diff(t);
    % 42 44
    if any(eq(dt, 0.0))
        error('physmod:mech:mech_constructSpline:BreakpointsNotUnique', 'Breakpoints are not unique.');
        % 45 47
    end % if
    % 47 49
    dd = ones(1.0, xyd);
    % 49 51
    xyi = transpose(xy);
    divdif = rdivide(diff(xyi), dt(:, dd));
    % 52 55
    % 53 55
    b = zeros(n, xyd);
    b(2.0:minus(n, 1.0), :) = mtimes(3.0, plus(times(dt(2.0:minus(n, 1.0), dd), divdif(1.0:minus(n, 2.0), :)), times(dt(1.0:minus(n, 2.0), dd), divdif(2.0:minus(n, 1.0), :))));
    c = spdiags(horzcat(vertcat(dt(2.0:minus(n, 1.0)), 0.0, 0.0), vertcat(0.0, mtimes(2.0, plus(dt(2.0:minus(n, 1.0)), dt(1.0:minus(n, 2.0)))), 0.0), vertcat(0.0, 0.0, dt(1.0:minus(n, 2.0)))), [-1.0 0.0 1.0], n, n);
    % 57 61
    % 58 61
    % 59 61
    switch endConditions
    case 'natural'
        b(1.0, :) = mtimes(3.0, divdif(1.0, :));
        c(1.0, 1.0) = 2.0;
        c(1.0, 2.0) = 1.0;
        b(n, :) = mtimes(3.0, divdif(minus(n, 1.0), :));
        c(n, minus(n, 1.0)) = 1.0;
        c(n, n) = 2.0;
    case 'not-a-knot'
        t31 = minus(t(3.0), t(1.0));
        tn = minus(t(n), t(minus(n, 2.0)));
        b(1.0, :) = mrdivide(plus(mtimes(mtimes(plus(dt(1.0), mtimes(2.0, t31)), dt(2.0)), divdif(1.0, :)), mtimes(mpower(dt(1.0), 2.0), divdif(2.0, :))), t31);
        c(1.0, 1.0) = dt(2.0);
        c(1.0, 2.0) = t31;
        b(n, :) = mrdivide(plus(mtimes(mpower(dt(minus(n, 1.0)), 2.0), divdif(minus(n, 2.0), :)), mtimes(mtimes(plus(mtimes(2.0, tn), dt(minus(n, 1.0))), dt(minus(n, 2.0))), divdif(minus(n, 1.0), :))), tn);
        c(n, minus(n, 1.0)) = tn;
        c(n, n) = dt(minus(n, 2.0));
    case 'periodic'
        b(1.0, :) = 0.0;
        c(1.0, 1.0) = 1.0;
        c(1.0, n) = -1.0;
        b(n, :) = mtimes(3.0, plus(mtimes(dt(minus(n, 1.0)), divdif(1.0, :)), mtimes(dt(1.0), divdif(minus(n, 1.0), :))));
        c(n, 1.0) = mtimes(2.0, dt(minus(n, 1.0)));
        c(n, 2.0) = dt(minus(n, 1.0));
        c(n, minus(n, 1.0)) = dt(1.0);
        c(n, n) = mtimes(2.0, dt(1.0));
    end % switch
    % 87 90
    % 88 90
    mmdflag = spparms('autommd');
    spparms('autommd', 0.0);
    lw = lastwarn;
    lastwarn('');
    ws = warning('off');
    s = mldivide(c, b);
    warning(ws);
    spparms('autommd', mmdflag);
    if not(isempty(lastwarn))
        error('physmod:mech:mech_constructSpline:CannotConstructSpline', 'Cannot construct the spline, %s', lastwarn);
    end % if
    % 100 103
    % 101 103
    c4 = rdivide(minus(plus(s(1.0:minus(n, 1.0), :), s(2.0:n, :)), mtimes(2.0, divdif(1.0:minus(n, 1.0), :))), dt(:, dd));
    c3 = minus(rdivide(minus(divdif(1.0:minus(n, 1.0), :), s(1.0:minus(n, 1.0), :)), dt(:, dd)), c4);
    pp = mkpp(transpose(t), reshape(horzcat(transpose(rdivide(c4, dt(:, dd))), transpose(c3), transpose(s(1.0:minus(n, 1.0), :)), transpose(xyi(1.0:minus(n, 1.0), :))), mtimes(minus(n, 1.0), xyd), 4.0), xyd);
    % 105 108
    % 106 108
    res = pp;
function u = splineParametrize(xyz)
    % 109 122
    % 110 122
    % 111 122
    % 112 122
    % 113 122
    % 114 122
    % 115 122
    % 116 122
    % 117 122
    % 118 122
    % 119 122
    % 120 122
    du = sum(transpose(power(diff(transpose(xyz)), 2.0)));
    u = cumsum(horzcat(0.0, power(du, .25)));
    if eq(u(end), 0.0)
        error('physmod:mech:mech_constructSpline:BreakpointsNotUnique', 'Breakpoints are not unique.');
        % 125 127
    end % if
    u = mrdivide(u, u(end));
