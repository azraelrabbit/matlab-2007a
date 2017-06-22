function dydt = sbioodefile(time, Y0_, model, ODEDATA, simobj, cs)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    nstates = length(ODEDATA.XNames);
    Y0_ = vertcat(Y0_(1.0:nstates), 1.0, Y0_(plus(nstates, 1.0):end));
    % 17 18
    switch ODEDATA.Code.fcnHandleMode
    case 0.0
        P0_ = ctranspose(ODEDATA.P);
        v = eval(ODEDATA.Code.vStr);
        rrule = eval(ODEDATA.Code.rRuleStr);
        arule = eval(ODEDATA.Code.aRuleStr);
    case 1.0
        P0_ = ctranspose(ODEDATA.P);
        v = ODEDATA.Code.vStr(time, Y0_, P0_);
        rrule = ODEDATA.Code.rRuleStr(time, Y0_, P0_);
        arule = ODEDATA.Code.aRuleStr(time, Y0_, P0_);
    case 2.0
        v = ODEDATA.Code.vStr(time, Y0_);
        rrule = ODEDATA.Code.rRuleStr(time, Y0_);
        arule = ODEDATA.Code.aRuleStr(time, Y0_);
        % 33 34
    end % switch
    % 35 36
    const = ODEDATA.Code.constStr;
    % 37 40
    % 38 40
    % 39 40
    dydt = vertcat(mtimes(ODEDATA.Stoich, v), rrule, arule, const);
    % 41 42
    dydt = dydt(ODEDATA.perm);
    % 43 46
    % 44 46
    % 45 46
    if ODEDATA.SensitivityAnalysis
        dRdt = ODEDATA.SensdRdtfh(Y0_, time);
        dRdt = reshape(dRdt, nstates, []);
        dRdt = dRdt(ODEDATA.perm, :);
        dydt = vertcat(dydt, dRdt(:));
    end % if
end % function
