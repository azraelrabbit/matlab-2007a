function [algEqns, restEqns] = ne_get_ic_indices(sys, t, x, u)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    m = ne_dae_M(sys, t, x, u);
    algEqns = ctranspose(find(eq(m, 0.0)));
    if gt(nargout, 1.0)
        restEqns = ctranspose(find(ne(m, 0.0)));
    end % if
end % function
