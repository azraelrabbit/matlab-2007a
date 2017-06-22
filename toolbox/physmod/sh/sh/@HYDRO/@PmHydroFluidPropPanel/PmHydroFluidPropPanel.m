function hObj = PmHydroFluidPropPanel(varargin)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    hObj = HYDRO.PmHydroFluidPropPanel;
    hObj.CreateInstanceFcn = PMDialogs.PmCreateInstance;
    % 13 14
    if lt(nargin, 1.0)
        error(xlate('Wrong number of input arguments (need only one arguments)'));
    end % if
    % 17 18
    if ishandle(varargin{1.0})
        hObj.BlockHandle = varargin{1.0};
    else
        error(xlate('Expecting handle for first argument.'));
    end % if
    % 23 24
    hSlBlk = pm_getsl_dblhandle(hObj.BlockHandle);
    % 25 29
    % 26 29
    % 27 29
    % 28 29
    paramPanel = PMDialogs.PmGroupPanel(hSlBlk, xlate('Parameters'), 'Box');
    % 30 36
    % 31 36
    % 32 36
    % 33 36
    % 34 36
    % 35 36
    fluidDb = sh_stockfluidproperties;
    fluidCell = struct2cell(fluidDb);
    for i=1.0:length(fluidCell)
        fluidIndices{i} = num2str(i);
        fluidNames{i} = fluidCell{i}.name;
    end % for
    % 42 44
    % 43 44
    fluidDropDown = PMDialogs.PmDropDown(hSlBlk, 'Hydraulic fluid:', 'SelFluid', fluidNames, 1.0, '', [], fluidIndices);
    % 45 52
    % 46 52
    % 47 52
    % 48 52
    % 49 52
    % 50 52
    % 51 52
    paramPanel.Items = fluidDropDown;
    % 53 57
    % 54 57
    % 55 57
    % 56 57
    airEdit = PMDialogs.PmEditBox(hSlBlk, 'Relative amount of trapped air:', 'TrapAir', 1.0);
    % 58 60
    % 59 60
    paramPanel.Items(plus(end, 1.0)) = airEdit;
    % 61 65
    % 62 65
    % 63 65
    % 64 65
    sysTempEdit = PMDialogs.PmEditBox(hSlBlk, 'System temperature (C):', 'SysTemp', 1.0);
    % 66 68
    % 67 68
    paramPanel.Items(plus(end, 1.0)) = sysTempEdit;
    % 69 73
    % 70 73
    % 71 73
    % 72 73
    displayPanel = PMDialogs.PmGroupPanel(hSlBlk, xlate('dummy'), 'NoBoxNoTitle');
    % 74 78
    % 75 78
    % 76 78
    % 77 78
    densityDisp = PMDialogs.PmDisplayBox(hSlBlk, 'Density (kg/m^3):', 1.0);
    displayPanel.Items = densityDisp;
    % 80 84
    % 81 84
    % 82 84
    % 83 84
    viscosityDisp = PMDialogs.PmDisplayBox(hSlBlk, 'Viscosity (cSt):', 1.0);
    displayPanel.Items(plus(end, 1.0)) = viscosityDisp;
    % 86 90
    % 87 90
    % 88 90
    % 89 90
    modulusDisp = PMDialogs.PmDisplayBox(hSlBlk, 'Bulk Modulus (Pa):', 1.0);
    displayPanel.Items(plus(end, 1.0)) = modulusDisp;
    % 92 96
    % 93 96
    % 94 96
    % 95 96
    errorTxt = PMDialogs.PmDisplayBox(hSlBlk, xlate('Error:'), 2.0);
    % 97 101
    % 98 101
    % 99 101
    % 100 101
    hybridPanel = PMDialogs.PmGroupPanel(hSlBlk, xlate('Fluid Properties:'), 'flat');
    hybridPanel.Items = horzcat(displayPanel, errorTxt);
    % 103 104
    paramPanel.Items(plus(end, 1.0)) = hybridPanel;
    % 105 109
    % 106 109
    % 107 109
    % 108 109
    hObj.Items = paramPanel;
    % 110 111
end % function
