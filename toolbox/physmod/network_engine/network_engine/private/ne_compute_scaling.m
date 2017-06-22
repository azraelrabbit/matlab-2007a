function [dr, dl] = ne_compute_scaling(J)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    [m, n] = size(J);
    [i, j, s] = find(J);
    nz = find(s);
    i = i(nz);
    j = j(nz);
    s = s(nz);
    J = sparse(i, j, s, m, n);
    % 16 19
    % 17 19
    Jsp = spones(J);
    % 19 22
    % 20 22
    Jlog = spfun(@(t)log2(abs(t)), J);
    % 22 25
    % 23 25
    A = vertcat(horzcat(Jsp, diag(sum(Jsp, 2.0))), horzcat(diag(sum(Jsp, 1.0)), ctranspose(Jsp)));
    % 25 27
    b = uminus(vertcat(sum(Jlog, 2.0), ctranspose(sum(Jlog, 1.0))));
    % 27 33
    % 28 33
    % 29 33
    % 30 33
    % 31 33
    x = mldivide(plus(A' * A, mtimes(sqrt(2.220446049250313e-16), speye(plus(m, n), plus(m, n)))), A' * b);
    % 33 36
    % 34 36
    dr = full(x(1.0:n));
    dl = full(x(plus(n, 1.0):plus(n, m)));
end
