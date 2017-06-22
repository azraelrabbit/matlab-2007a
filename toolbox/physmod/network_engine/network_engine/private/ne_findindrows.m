function [indrows, deprows, T] = ne_findindrows(J, order)
    % 1 30
    % 2 30
    % 3 30
    % 4 30
    % 5 30
    % 6 30
    % 7 30
    % 8 30
    % 9 30
    % 10 30
    % 11 30
    % 12 30
    % 13 30
    % 14 30
    % 15 30
    % 16 30
    % 17 30
    % 18 30
    % 19 30
    % 20 30
    % 21 30
    % 22 30
    % 23 30
    % 24 30
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    % 29 30
    numrows = length(order);
    numrowsJ = size(J, 1.0);
    if gt(numrows, size(J, 2.0))
        error('ne_findindrows: internal error: too many rows in J(order,:).');
    end % if
    if not(strcmp(class(J), 'double')) || not(strcmp(class(order), 'double'))
        error('ne_findindrows: internal error: wrong class J or order');
    end % if
    % 38 40
    % 39 40
    A = J(order, :);
    % 41 42
    if not(issparse(A))
        A = sparse(A);
    end % if
    R = qr(ctranspose(A), 0.0);
    % 46 47
    numindrows = 0.0;
    indrows = [];
    for i=1.0:numrows
        if any(R(plus(numindrows, 2.0):end, i))
            error('internal error: not in staircase form!');
        end % if
        if lt(numindrows, size(A, 2.0))
            if ne(R(plus(numindrows, 1.0), i), 0.0)
                numindrows = plus(numindrows, 1.0);
                indrows(numindrows) = i;
            end % if
        else
            break
        end % if
    end % for
    % 62 63
    tvec = ones(1.0, numrows);
    tvec(indrows) = 0.0;
    deprows = find(tvec);
    % 66 71
    % 67 71
    % 68 71
    % 69 71
    % 70 71
    Rsect = R(1.0:numindrows, indrows);
    if isempty(Rsect)
        % 73 74
        s = warning('off', 'MATLAB:singularMatrix');
    end % if
    % 76 78
    % 77 78
    ind2dep = mldivide(Rsect, R(1.0:numindrows, deprows));
    if isempty(Rsect)
        warning(s);
    end % if
    % 82 84
    % 83 84
    indrows = order(indrows);
    deprows = order(deprows);
    numdep = length(deprows);
    T = sparse(numdep, numrowsJ);
    % 88 90
    % 89 90
    ind2dep(find(lt(abs(ind2dep), 1e-14))) = 0.0;
    % 91 92
    T(:, deprows) = eye(length(deprows));
    % 93 96
    % 94 96
    % 95 96
    T(:, indrows) = uminus(full(ctranspose(ind2dep)));
end % function
