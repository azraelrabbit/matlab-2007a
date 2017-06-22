function [Phi, Gamma] = c2d(a, b, t)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    error(nargchk(3.0, 3.0, nargin));
    error(abcdchk(a, b));
    % 21 22
    [m, n] = size(a);
    [m, nb] = size(b);
    s = expm(vertcat(mtimes(horzcat(a, b), t), zeros(nb, plus(n, nb))));
    Phi = s(1.0:n, 1.0:n);
    Gamma = s(1.0:n, plus(n, 1.0):plus(n, nb));
end % function
