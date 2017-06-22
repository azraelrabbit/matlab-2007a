function initStateODE = ne_dcanalyzenumeric(prob, probaux, initGuessODE, nonlinearSolver)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    prob = prob.setAnalysisType('dc');
    t = 0.0;
    [u, udot] = ne_evalinputsandknownderivs(t, probaux.u, prob.analysisType);
    wtd.whichToDiffIndicesIndex1 = zeros(1.0, 0.0);
    wtd.whichNotToDiffIndicesIndex1 = 1.0:probaux.nz;
    % 12 15
    % 13 15
    probDC = prob;
    % 15 17
    dcForcingFunction = @(y)ne_evalforcingfunction(t,y,u,udot,probDC,probaux,wtd);
    dcJacobianFunction = @(y)ne_evaljacobian(t,y,u,probDC,probaux,wtd);
    initStateODE = nonlinearSolver(initGuessODE, dcForcingFunction, dcJacobianFunction);
end
function probDC = dcErrorCheckNumeric(t, x, z, u, mode, prob, wtd)
    % 21 25
    % 22 25
    % 23 25
    probDC = prob;
    J = ne_evaljacobian(t, x, z, u, mode, prob, wtd);
    % 26 28
    [indrows, deprows, T] = findIndRows(J(horzcat(plus(prob.nx, 1.0):prob.n, 1.0:prob.nx), :));
    deprowsInM = minus(deprows, prob.nz);
    TJc = T(:, 1.0:prob.nz);
    TJm = T(:, plus(prob.nz, 1.0):prob.n);
    nbaddep = identifySingularities(TJc, TJm, deprows, @warning);
    % 32 37
    % 33 37
    % 34 37
    % 35 37
    CF = ne_getmatlabsparse(prob.CF_P(), prob.CF());
    CG = ne_getmatlabsparse(prob.CG_P(), prob.CG());
    DUF1 = ne_getmatlabsparse(prob.DUF1_P());
    DUG1 = ne_getmatlabsparse(prob.DUG1_P());
    for i=plus(nbaddep, 1.0):size(T, 1.0)
        Mind = find(gt(abs(TJm(i, :)), 1e-14))
        Cind = find(gt(abs(TJc(i, :)), 1e-14))
        Jmpattern = horzcat(ne_getmatlabsparse(prob.DXF1_P()), ne_getmatlabsparse(prob.DYF1_P()));
        Jcpattern = horzcat(ne_getmatlabsparse(prob.DXG1_P()), ne_getmatlabsparse(prob.DYG1_P()));
        Mpattern = prob.M2_P();
        tryintegrate = true;
        % 47 49
        if (any(plus(mtimes(TJm(i, Mind), CF(Mind, :)), mtimes(TJc(i, Cind), CG(Cind, :))))) | (any(any(vertcat(DUF1(Mind, :), DUG1(Cind, :)))))
            tryintegrate = false;
            warning('Possibly inconsistent inputs detected in DC solve.');
        end
        % 52 57
        % 53 57
        % 54 57
        % 55 57
        if (any(any(vertcat(Jmpattern(Mind, :), Jcpattern(Cind, :))))) | (any(Mpattern(Mind)))
            tryintegrate = false;
        end
        if tryintegrate
            'DP:tryintegrate'
            newrow = zeros(1.0, prob.nx);
            Mvec = ctranspose(prob.M1());
            newrow(1.0, Mind) = times(Mvec(1.0, Mind), TJm(i, Mind));
            'DP:newrow'
            newrow
            AF = ne_getmatlabsparse(prob.AF_P(), prob.AF());
            AF(deprowsInM(i), :) = newrow;
            [probDC.AF_P, probDC.AF] = makePrIrJcFunctions(AF);
        end
    end % for
end
