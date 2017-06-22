function [m, num_diff] = ne_dae_M(sys, t, x, u)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    x = x(:);
    u = u(:);
    % 10 11
    mi1 = sys.M1_I(t, ctranspose(x), ctranspose(u));
    m = zeros(length(mi1), 1.0);
    m(find(mi1)) = sys.M1(t, ctranspose(x), ctranspose(u));
    mi2 = sys.M2_I(t, ctranspose(x), ctranspose(u));
    m(find(mi2)) = plus(m(find(mi2), :), sys.M2(t, ctranspose(x), ctranspose(u)));
    mi = or(mi1, mi2);
    num_diff = nnz(mi);
    % 18 19
    if any(mi(plus(num_diff, 1.0):end))
        error('internal error: ne_dae_M: bad mass matrix structure.');
    end % if
end % function
