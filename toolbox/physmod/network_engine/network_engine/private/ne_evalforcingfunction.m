function fval = ne_evalforcingfunction(t, y, u, udot, prob, probaux, wtd)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    x = y(1.0:probaux.nx);
    z = y(plus(probaux.nx, 1.0):probaux.n);
    fval = zeros(probaux.n, 1.0);
    A = ne_tosparse(prob.A_P(), prob.A());
    B = ne_tosparse(prob.B_P(), prob.B());
    fval = plus(plus(plus(mtimes(A, y), mtimes(B, u)), prob.G(t)), vertcat(prob.F1(x, z, u), prob.F2(x, z, u)));
    DUF2part = ne_tosparse(prob.DUF2_P(), prob.DUF2(x, z, u));
    DUF2part = DUF2part(wtd.whichToDiffIndicesIndex1, :);
    GDOTpart = prob.GDOT(t);
    GDOTpart = GDOTpart(plus(wtd.whichToDiffIndicesIndex1, probaux.nx), 1.0);
    Bpart = B(plus(wtd.whichToDiffIndicesIndex1, probaux.nx), :);
    fval(plus(wtd.whichToDiffIndicesIndex1, probaux.nx)) = minus(mtimes(minus(uminus(DUF2part), Bpart), udot), GDOTpart);
end % function
