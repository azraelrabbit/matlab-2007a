function dlgSchema = nesl_utility_createpmschema(hBlk)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    hBlk = pm_getsl_dblhandle(hBlk);
    dlgSchema = [];
    % 8 9
    subName = get_param(hBlk, 'SubClassName');
    switch subName
    case 'ps_input'
        dlgSchema = lGetInputBlkDlgSchema(hBlk);
    case 'ps_output'
        dlgSchema = lGetOutputBlkDlgSchema(hBlk);
    case 'solver'
        dlgSchema = lGetSolverBlkDlgSchema(hBlk);
    otherwise
    end % switch
end % function
function retSchema = lGetInputBlkDlgSchema(hSlBlk)
    % 21 23
    % 22 23
    retSchema = [];
    % 24 25
    descPnl = PMDialogs.PmDescriptionPanel(hSlBlk);
    convertPnl = NetworkEngine.PmNePSConvertPanel(hSlBlk, 'Unit', 'in');
    paramPanel = PMDialogs.PmGroupPanel(hSlBlk, xlate('Parameters'), 'Box');
    paramPanel.Items = convertPnl;
    myBlder = PMDialogs.PmDlgBuilder(hSlBlk);
    myBlder.Items = horzcat(descPnl, paramPanel);
    [status, retSchema] = myBlder.getPmSchema(retSchema);
end % function
function retSchema = lGetOutputBlkDlgSchema(hSlBlk)
    % 34 35
    retSchema = [];
    % 36 37
    descPnl = PMDialogs.PmDescriptionPanel(hSlBlk);
    convertPnl = NetworkEngine.PmNePSConvertPanel(hSlBlk, 'Unit', 'out');
    paramPanel = PMDialogs.PmGroupPanel(hSlBlk, xlate('Parameters'), 'Box');
    paramPanel.Items = convertPnl;
    myBlder = PMDialogs.PmDlgBuilder(hSlBlk);
    myBlder.Items = horzcat(descPnl, paramPanel);
    [status, retSchema] = myBlder.getPmSchema(retSchema);
end % function
function retSchema = lGetSolverBlkDlgSchema(hSlBlk)
    % 46 47
    retSchema = [];
    % 48 49
    solverPanel = NetworkEngine.PmNeSolverPanel(hSlBlk);
    myBlder = PMDialogs.PmDlgBuilder(hSlBlk);
    myBlder.Items = solverPanel;
    [status, retSchema] = myBlder.getPmSchema(retSchema);
end % function
