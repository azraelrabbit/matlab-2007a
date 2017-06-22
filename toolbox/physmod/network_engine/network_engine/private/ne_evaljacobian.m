function [jval, jvalXX, jvalXZ, jvalZX, jvalZZ] = ne_evaljacobian(t, y, u, prob, probaux, wtd)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    if lt(nargin, 6.0)
        wtd.whichToDiffIndicesIndex1 = [];
        wtd.whichNotToDiffIndicesIndex1 = 1.0:prob.nz;
    end % if
    x = y(1.0:probaux.nx);
    z = y(plus(probaux.nx, 1.0):probaux.n);
    A = ne_tosparse(prob.A_P(), prob.A());
    B = ne_tosparse(prob.B_P(), prob.B());
    DXF1 = ne_tosparse(prob.DXF1_P(), prob.DXF1(x, z, u));
    DXF2 = ne_tosparse(prob.DXF2_P(), prob.DXF2(x, z, u));
    % 16 17
    jval = sparse(probaux.n, probaux.n);
    jvalXX = plus(A(1.0:probaux.nx, 1.0:probaux.nx), DXF1(:, 1.0:probaux.nx));
    jvalXZ = plus(A(1.0:probaux.nx, plus(probaux.nx, 1.0):probaux.n), DXF1(:, plus(probaux.nx, 1.0):probaux.n));
    jvalZX = plus(A(plus(probaux.nx, 1.0):probaux.n, 1.0:probaux.nx), DXF2(:, 1.0:probaux.nx));
    jvalZZ = plus(A(plus(probaux.nx, 1.0):probaux.n, plus(probaux.nx, 1.0):probaux.n), DXF2(:, plus(probaux.nx, 1.0):probaux.n));
    jvalZX(wtd.whichToDiffIndicesIndex1, :) = 0.0;
    jvalZZ(wtd.whichToDiffIndicesIndex1, :) = 0.0;
    jval = vertcat(horzcat(jvalXX, jvalXZ), horzcat(jvalZX, jvalZZ));
end % function
