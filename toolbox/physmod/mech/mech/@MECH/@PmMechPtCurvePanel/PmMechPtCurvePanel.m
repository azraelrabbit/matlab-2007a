function hObj = PmMechPtCurvePanel(varargin)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    hObj = MECH.PmMechPtCurvePanel;
    hObj.CreateInstanceFcn = PMDialogs.PmCreateInstance;
    % 14 15
    if lt(nargin, 1.0)
        error(xlate('Wrong number of input arguments (need only one arguments)'));
    end % if
    % 18 19
    hBlk = [];
    if ishandle(varargin{1.0})
        hObj.BlockHandle = pm_getsl_dblhandle(varargin{1.0});
        hBlk = hObj.BlockHandle;
    else
        error(xlate('Expecting handle for first argument.'));
    end % if
    % 26 27
    breakXVals = PMDialogs.PmEditBox(hBlk, xlate('X-components:'), 'Xbreaks', 1.0);
    % 28 29
    breakYVals = PMDialogs.PmEditBox(hBlk, xlate('Y-components:'), 'Ybreaks', 1.0);
    % 30 31
    breakZVals = PMDialogs.PmEditBox(hBlk, xlate('Z-components:'), 'Zbreaks', 1.0);
    % 32 34
    % 33 34
    breakPtPanel = PMDialogs.PmGroupPanel(hBlk, xlate('Breakpoints'), 'Flat');
    breakPtPanel.Items = horzcat(breakXVals, breakYVals, breakZVals);
    % 36 37
    unitCombo = PMDialogs.PmUnitSelect(hBlk, xlate('Units:'), 'Units', 1.0, mech_getDefaultUnit('lin_pos'));
    % 38 40
    % 39 40
    endConditionCombo = PMDialogs.PmDropDown(hBlk, xlate('End conditions:'), 'EndConditions', cellhorzcat(xlate('Natural'), xlate('Not-a-knot'), xlate('Periodic')), 1.0, '', [], cellhorzcat(xlate('natural'), xlate('not-a-knot'), xlate('periodic')));
    % 41 46
    % 42 46
    % 43 46
    % 44 46
    % 45 46
    fallOffChk = PMDialogs.PmCheckBox(hBlk, xlate('Allow the point to fall off the curve'), 'CanExtrapolate', 1.0);
    % 47 51
    % 48 51
    % 49 51
    % 50 51
    hMainPanel = PMDialogs.PmGroupPanel(hBlk, xlate('Spline specification'), 'Box', '3ColLayout');
    % 52 53
    hMainPanel.Items = horzcat(breakPtPanel, unitCombo, endConditionCombo, fallOffChk);
    % 54 55
    hObj.Items = hMainPanel;
    % 56 57
end % function
