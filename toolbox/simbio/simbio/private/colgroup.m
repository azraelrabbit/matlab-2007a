function gout = colgroup(S)
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
    [m, n] = size(S);
    [i, j] = find(S);
    T = sparse(i, j, 1.0, m, n);
    % 18 21
    % 19 21
    if any(eq(sum(T, 2.0), n))
        gout = ctranspose(1.0:n);
        return
    end
    % 24 26
    TT = tril(T' * T);
    % 26 29
    % 27 29
    g = zeros(n, 1.0);
    groupnum = 0.0;
    J = ctranspose(1.0:n);
    while length(J)
        groupnum = plus(groupnum, 1.0);
        g(J(1.0)) = groupnum;
        col = full(TT(:, J(1.0)));
        for k=ctranspose(J)
            if eq(col(k), 0.0)
                col = plus(col, TT(:, k));
                g(k) = groupnum;
            end
        end % for
        J = find(eq(g, 0.0));
    end % while
    % 43 46
    % 44 46
    p = colamd(T);
    p = p(n:-1.0:1.0);
    T = T(:, p);
    TT = tril(T' * T);
    % 49 52
    % 50 52
    g2 = zeros(n, 1.0);
    groupnum2 = 0.0;
    J = ctranspose(1.0:n);
    while length(J)
        groupnum2 = plus(groupnum2, 1.0);
        g2(J(1.0)) = groupnum2;
        col = full(TT(:, J(1.0)));
        for k=ctranspose(J)
            if eq(col(k), 0.0)
                col = plus(col, TT(:, k));
                g2(k) = groupnum2;
            end
        end % for
        J = find(eq(g2, 0.0));
    end % while
    % 66 69
    % 67 69
    if le(groupnum, groupnum2)
        gout = g;
    else
        q(p) = 1.0:n;
        gout = g2(q);
    end
end
