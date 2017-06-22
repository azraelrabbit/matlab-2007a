function hObj = PmNeSolverPanel(varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    hObj = NetworkEngine.PmNeSolverPanel;
    hObj.CreateInstanceFcn = PMDialogs.PmCreateInstance;
    % 12 13
    if ne(nargin, 1.0)
        error(xlate('Wrong number of input arguments (need one and only one argument)'));
    end % if
    % 16 17
    if ishandle(varargin{1.0})
        hObj.BlockHandle = varargin{1.0};
    else
        error(xlate('Expecting handle for first argument.'));
    end % if
    % 22 23
    hSlBlk = pm_getsl_dblhandle(hObj.BlockHandle);
    % 24 25
    descPnl = PMDialogs.PmDescriptionPanel(hSlBlk);
    % 26 27
    paramPanel = PMDialogs.PmGroupPanel(hSlBlk, xlate('Parameters'), 'Box');
    % 28 30
    % 29 30
    tolEditPnl = PMDialogs.PmEditBox(hSlBlk, 'Constraint Residual Tolerance:', 'ResidualTolerance', 1.0);
    % 31 33
    % 32 33
    paramPanel.Items = tolEditPnl;
    % 34 36
    % 35 36
    dynamicScaleCheck = PMDialogs.PmCheckBox(hSlBlk, xlate('Enable automatic function scaling'), 'DynamicScaling', 1.0);
    % 37 40
    % 38 40
    % 39 40
    paramPanel.Items(plus(end, 1.0)) = dynamicScaleCheck;
    % 41 43
    % 42 43
    doDCCheck = PMDialogs.PmCheckBox(hSlBlk, xlate('Start simulation from steady state'), 'DoDC', 0.0);
    % 44 47
    % 45 47
    % 46 47
    paramPanel.Items(plus(end, 1.0)) = doDCCheck;
    % 48 72
    % 49 72
    % 50 72
    % 51 72
    % 52 72
    % 53 72
    % 54 72
    % 55 72
    % 56 72
    % 57 72
    % 58 72
    % 59 72
    % 60 72
    % 61 72
    % 62 72
    % 63 72
    % 64 72
    % 65 72
    % 66 72
    % 67 72
    % 68 72
    % 69 72
    % 70 72
    % 71 72
    linearAlgebraPnl = PMDialogs.PmDropDown(hSlBlk, 'Linear Algebra: ', 'LinearAlgebra', {'Sparse','Full'}, 1.0);
    % 73 75
    % 74 75
    paramPanel.Items(plus(end, 1.0)) = linearAlgebraPnl;
    % 76 78
    % 77 78
    wholePanel = PMDialogs.PmGroupPanel(hSlBlk, xlate(''), 'NoBoxNoTitle');
    wholePanel.Items = horzcat(descPnl, paramPanel);
    % 80 81
    hObj.Items = wholePanel;
    % 82 83
end % function
