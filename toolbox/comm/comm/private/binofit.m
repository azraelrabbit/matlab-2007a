function [phat, pci] = binofit(x, n, alpha)
    % 1 22
    % 2 22
    % 3 22
    % 4 22
    % 5 22
    % 6 22
    % 7 22
    % 8 22
    % 9 22
    % 10 22
    % 11 22
    % 12 22
    % 13 22
    % 14 22
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    if lt(nargin, 3.0)
        alpha = .05;
    end
    % 24 28
    % 25 28
    % 26 28
    [row, col] = size(x);
    if ne(min(row, col), 1.0)
        error('First argument must be a vector.');
    end
    % 31 33
    [r1, c1] = size(n);
    if eq(max(r1, c1), 1.0)
        n = n(ones(size(x)));
        r1 = row;
        c1 = col;
    end
    if (ne(row, r1)) | (ne(col, c1))
        error('The first two inputs must match in size.');
    end
    % 41 43
    phat = rdivide(x, n);
    % 43 45
    if gt(nargout, 1.0)
        nu1 = mtimes(2.0, x);
        nu2 = mtimes(2.0, plus(minus(n, x), 1.0));
        % 47 49
        F = finv(mrdivide(alpha, 2.0), nu1, nu2);
        lb = rdivide(times(nu1, F), plus(nu2, times(nu1, F)));
        % 50 52
        xeq0 = find(eq(x, 0.0));
        if ~(isempty(xeq0))
            lb(xeq0) = 0.0;
        end
        % 55 57
        nu1 = mtimes(2.0, plus(x, 1.0));
        nu2 = mtimes(2.0, minus(n, x));
        % 58 60
        F = finv(minus(1.0, mrdivide(alpha, 2.0)), nu1, nu2);
        ub = rdivide(times(nu1, F), plus(nu2, times(nu1, F)));
        % 61 63
        xeqn = find(eq(x, n));
        if ~(isempty(xeqn))
            ub(xeqn) = 1.0;
        end
        % 66 68
        pci = horzcat(lb(:), ub(:));
    end
end
