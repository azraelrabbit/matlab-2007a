function hObj = PmMechStictionPanel(varargin)
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
    hObj = MECH.PmMechStictionPanel;
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
    hBlk = pm_getsl_dblhandle(hObj.BlockHandle);
    % 25 26
    jtPrimSel = MECH.PmMechJointPrimSel(hBlk, xlate('Connected to primitive:   '), 'Primitive', 1.0);
    % 27 29
    % 28 29
    extForceUnitPnl = PMDialogs.PmUnitSelect(hBlk, xlate('External force units:      '), 'ExternalForceUnits', 1.0, mech_getDefaultUnit('force'));
    % 30 31
    frictUnitPnl = PMDialogs.PmUnitSelect(hBlk, xlate('Kinetic friction units:      '), 'FrictionalForceUnits', 1.0, mech_getDefaultUnit('force'));
    % 32 34
    % 33 34
    pPrimaticPanel = PMDialogs.PmGroupPanel(hBlk, '', 'NoBoxNoTitle');
    pPrimaticPanel.Items = horzcat(extForceUnitPnl, frictUnitPnl);
    % 36 37
    extTorqueUnitPnl = PMDialogs.PmUnitSelect(hBlk, xlate('External torque units:'), 'ExternalTorqueUnits', 1.0, mech_getDefaultUnit('torque'));
    % 38 39
    frictTorqueUnitPnl = PMDialogs.PmUnitSelect(hBlk, xlate('Kinetic friction units:'), 'FrictionalTorqueUnits', 1.0, mech_getDefaultUnit('torque'));
    % 40 42
    % 41 42
    pRevolutePanel = PMDialogs.PmGroupPanel(hBlk, '', 'NoBoxNoTitle');
    pRevolutePanel.Items = horzcat(extTorqueUnitPnl, frictTorqueUnitPnl);
    % 44 45
    thresholdPnl = PMDialogs.PmEditBox(hBlk, xlate('Velocity threshold (MKS-SI units):   '), 'LockingTolerance', 1.0);
    % 46 47
    lastPanel = PMDialogs.PmGroupPanel(hBlk, '', 'NoBoxNoTitle');
    lastPanel.Items = thresholdPnl;
    % 49 52
    % 50 52
    % 51 52
    pSphericalPanel = PMDialogs.PmGroupPanel(hBlk, '', 'NoBoxNoTitle');
    pSphericalPanel.Items = [];
    % 54 55
    pNoConnectPanel = PMDialogs.PmGroupPanel(hBlk, '', 'NoBoxNoTitle');
    pNoConnectPanel.Items = [];
    % 57 58
    hMainPanel = PMDialogs.PmGroupPanel(hBlk, pm_message('mechanical:mech_dialogs:TitleActuation'), 'Box');
    % 59 60
    hMainPanel.Items = horzcat(jtPrimSel, pPrimaticPanel, pRevolutePanel, pSphericalPanel, pNoConnectPanel, lastPanel);
    % 61 62
    hObj.Items = hMainPanel;
    % 63 64
end % function
