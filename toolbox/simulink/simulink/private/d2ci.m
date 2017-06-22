function [a, b] = d2ci(phi, gam, t)
    % 1 21
    % 2 21
    % 3 21
    % 4 21
    % 5 21
    % 6 21
    % 7 21
    % 8 21
    % 9 21
    % 10 21
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    error(nargchk(3.0, 3.0, nargin));
    error(abcdchk(phi, gam));
    % 22 24
    [m, n] = size(phi);
    [m, nb] = size(gam);
    % 25 29
    % 26 29
    % 27 29
    if eq(m, 1.0)
        if eq(phi, 1.0)
            a = 0.0;
            b = mrdivide(gam, t);
            return;
        end % if
    end % if
    % 35 37
    b = zeros(m, nb);
    nonzero = find(ne(sum(abs(gam)), 0.0));
    nz = length(nonzero);
    % 39 43
    % 40 43
    % 41 43
    [s, errest] = logm(vertcat(horzcat(phi, gam(:, nonzero)), horzcat(zeros(nz, n), eye(nz))));
    s = mrdivide(s, t);
    a = s(1.0:n, 1.0:n);
    b(:, nonzero) = s(1.0:n, plus(n, 1.0):plus(n, nz));
end % function
