function [A, B, C, D] = etafbak(A1, B1, C1, D1, a2, b2, c2, no_inp1, no_out1)
    % 1 52
    % 2 52
    % 3 52
    % 4 52
    % 5 52
    % 6 52
    % 7 52
    % 8 52
    % 9 52
    % 10 52
    % 11 52
    % 12 52
    % 13 52
    % 14 52
    % 15 52
    % 16 52
    % 17 52
    % 18 52
    % 19 52
    % 20 52
    % 21 52
    % 22 52
    % 23 52
    % 24 52
    % 25 52
    % 26 52
    % 27 52
    % 28 52
    % 29 52
    % 30 52
    % 31 52
    % 32 52
    % 33 52
    % 34 52
    % 35 52
    % 36 52
    % 37 52
    % 38 52
    % 39 52
    % 40 52
    % 41 52
    % 42 52
    % 43 52
    % 44 52
    % 45 52
    % 46 52
    % 47 52
    % 48 52
    % 49 52
    % 50 52
    % 51 52
    [n1, nu] = size(B1);
    % 53 54
    [ny, nu] = size(D1);
    [n2, nu2] = size(b2);
    % 56 59
    % 57 59
    % 58 59
    A2 = a2;
    B2 = zeros(n2, ny);
    B2(:, no_out1) = b2;
    C2 = zeros(nu, n2);
    C2(no_inp1, :) = c2;
    % 64 67
    % 65 67
    % 66 67
    A = zeros(plus(n1, n2), plus(n1, n2));
    A(1.0:n1, 1.0:n1) = A1;
    A(1.0:n1, plus(n1, 1.0):plus(n1, n2)) = mtimes(B1, C2);
    A(plus(n1, 1.0):plus(n1, n2), 1.0:n1) = mtimes(B2, C1);
    A(plus(n1, 1.0):plus(n1, n2), plus(n1, 1.0):plus(n1, n2)) = plus(A2, mtimes(mtimes(B2, D1), C2));
    % 72 73
    B = zeros(plus(n1, n2), nu);
    B(1.0:n1, :) = B1;
    B(plus(n1, 1.0):plus(n1, n2), :) = mtimes(B2, D1);
    % 76 77
    C = zeros(ny, plus(n1, n2));
    C(:, 1.0:n1) = C1;
    C(:, plus(n1, 1.0):plus(n1, n2)) = mtimes(D1, C2);
    % 80 81
    D = D1;
end % function
