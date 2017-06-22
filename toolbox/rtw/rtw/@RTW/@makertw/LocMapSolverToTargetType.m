function output = LocMapSolverToTargetType(h, hModel, solver, tlcTargetType)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    switch solver
    case {'FixedStepDiscrete','ode1','ode2','ode3','ode4','ode5','ode14x'}
        % 12 14
        output = 'RT';
    case {'VariableStepDiscrete','ode45','ode23','ode113','ode15s','ode23s','ode23t','ode23tb'}
        % 15 17
        output = 'NRT';
        if strcmp(tlcTargetType, 'RT')
            msg = DAStudio.message('RTW:makertw:invalidSolverOption');
            cmd = sprintf('slCfgPrmDlg(''%s'', ''Open'');slCfgPrmDlg(''%s'', ''TurnToPage'', ''Solver'');', h.ModelName, h.ModelName);
            % 20 24
            % 21 24
            % 22 24
            slprivate('slNagOpenFcn', 'set', msg, cmd);
            DAStudio.error('RTW:makertw:invalidSolverOption');
        end % if
    otherwise
        % 27 29
        DAStudio.error('RTW:makertw:unknownSolver', solver);
    end % switch
