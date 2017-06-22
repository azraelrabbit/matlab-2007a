function hObj = PmMechJointActuatePanel(varargin)
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
    hObj = MECH.PmMechJointActuatePanel;
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
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    % 29 30
    jtPrimSel = MECH.PmMechJointPrimSel(hBlk, xlate('Connected to primitive:'), 'Primitive', 1.0, 'RConn1');
    % 31 33
    % 32 33
    methodCombo = PMDialogs.PmDropDown(hBlk, xlate('Actuate with:'), 'ActuationStyle', cellhorzcat(xlate('Generalized Forces'), xlate('Motion')), 1.0, '', [], {'Force';'Motion'});
    % 34 38
    % 35 38
    % 36 38
    % 37 38
    primPanel = PMDialogs.PmGroupPanel(hBlk, '', 'NoBoxNoTitle');
    primPanel.Items = horzcat(jtPrimSel, methodCombo);
    % 40 45
    % 41 45
    % 42 45
    % 43 45
    % 44 45
    arcAng = PMDialogs.PmUnitSelect(hBlk, xlate('Angular units:                      '), 'AngleUnits', 1.0, mech_getDefaultUnit('ang_pos'));
    % 46 48
    % 47 48
    arcVelUnit = PMDialogs.PmUnitSelect(hBlk, xlate('Angular velocity units:         '), 'ArcVelocityUnits', 1.0, mech_getDefaultUnit('ang_vel'));
    % 49 51
    % 50 51
    arcAcelUnit = PMDialogs.PmUnitSelect(hBlk, xlate('Angular acceleration units: '), 'ArcAccelerationUnits', 1.0, mech_getDefaultUnit('ang_acc'));
    % 52 54
    % 53 54
    rotPanel = PMDialogs.PmGroupPanel(hBlk, '', 'Flat');
    rotPanel.Items = horzcat(arcAng, arcVelUnit, arcAcelUnit);
    % 56 60
    % 57 60
    % 58 60
    % 59 60
    posUnit = PMDialogs.PmUnitSelect(hBlk, xlate('Position units:                     '), 'CoordPositionUnits', 1.0, mech_getDefaultUnit('lin_pos'));
    % 61 63
    % 62 63
    velUnit = PMDialogs.PmUnitSelect(hBlk, xlate('Velocity units:                     '), 'VelocityUnits', 1.0, mech_getDefaultUnit('lin_vel'));
    % 64 66
    % 65 66
    accelUnit = PMDialogs.PmUnitSelect(hBlk, xlate('Acceleration units:              '), 'AccelerationUnits', 1.0, mech_getDefaultUnit('lin_acc'));
    % 67 69
    % 68 69
    prismPanel = PMDialogs.PmGroupPanel(hBlk, '', 'Flat');
    prismPanel.Items = horzcat(posUnit, velUnit, accelUnit);
    % 71 76
    % 72 76
    % 73 76
    % 74 76
    % 75 76
    forceUnit = PMDialogs.PmUnitSelect(hBlk, xlate('Applied force units:                 '), 'ForceUnits', 1.0, mech_getDefaultUnit('force'));
    % 77 79
    % 78 79
    forcePanel = PMDialogs.PmGroupPanel(hBlk, '', 'Flat');
    forcePanel.Items = forceUnit;
    % 81 85
    % 82 85
    % 83 85
    % 84 85
    torqueUnit = PMDialogs.PmUnitSelect(hBlk, xlate('Applied torque units:              '), 'TorqueUnits', 1.0, mech_getDefaultUnit('torque'));
    % 86 88
    % 87 88
    torqPanel = PMDialogs.PmGroupPanel(hBlk, '', 'Flat');
    torqPanel.Items = torqueUnit;
    % 90 94
    % 91 94
    % 92 94
    % 93 94
    spherePanel = PMDialogs.PmGroupPanel(hBlk, '', 'Flat');
    spherePanel.Items = [];
    % 96 100
    % 97 100
    % 98 100
    % 99 100
    unknownPanel = PMDialogs.PmGroupPanel(hBlk, '', 'NoBoxNoTitle');
    unknownPanel.Items = [];
    % 102 106
    % 103 106
    % 104 106
    % 105 106
    hMainPanel = PMDialogs.PmGroupPanel(hBlk, pm_message('mechanical:mech_dialogs:TitleActuation'), 'Box');
    % 107 108
    hMainPanel.Items = horzcat(primPanel, rotPanel, prismPanel, spherePanel, unknownPanel, forcePanel, torqPanel);
    % 109 110
    hObj.Items = hMainPanel;
    % 111 112
end % function
