function hObj = PmMechJointSensorPanel(varargin)
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
    hObj = MECH.PmMechJointSensorPanel;
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
    jtPrimSel = MECH.PmMechJointPrimSel(hBlk, xlate('Connected to primitive:   '), 'Primitive', 1.0, 'LConn1');
    % 27 34
    % 28 34
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    % 33 34
    arcAng = PMDialogs.PmCheckUnit(hBlk, '', 0.0, xlate('Angle'), 'Angle', xlate('Units: '), 'AngleUnits', false, mech_getDefaultUnit('ang_pos'));
    % 35 39
    % 36 39
    % 37 39
    % 38 39
    arcVelUnit = PMDialogs.PmCheckUnit(hBlk, '', 0.0, xlate('Angular velocity'), 'ArcVelocity', xlate('Units: '), 'ArcVelocityUnits', false, mech_getDefaultUnit('ang_vel'));
    % 40 44
    % 41 44
    % 42 44
    % 43 44
    arcAcelUnit = PMDialogs.PmCheckUnit(hBlk, '', 0.0, xlate('Angular acceleration'), 'ArcAcceleration', xlate('Units: '), 'ArcAccelerationUnits', false, mech_getDefaultUnit('ang_acc'));
    % 45 49
    % 46 49
    % 47 49
    % 48 49
    compTorqUnit = PMDialogs.PmCheckUnit(hBlk, '', 0.0, xlate('Computed torque'), 'Torque', xlate('Units: '), 'TorqueUnits', false, mech_getDefaultUnit('torque'));
    % 50 54
    % 51 54
    % 52 54
    % 53 54
    rotPanel = PMDialogs.PmGroupPanel(hBlk, '', 'NoBoxNoTitle');
    rotPanel.Items = horzcat(arcAng, arcVelUnit, arcAcelUnit, compTorqUnit);
    % 56 61
    % 57 61
    % 58 61
    % 59 61
    % 60 61
    posUnit = PMDialogs.PmCheckUnit(hBlk, '', 0.0, xlate('Position'), 'CoordPosition', xlate('Units: '), 'CoordPositionUnits', false, mech_getDefaultUnit('lin_pos'));
    % 62 65
    % 63 65
    % 64 65
    velUnit = PMDialogs.PmCheckUnit(hBlk, '', 0.0, xlate('Velocity'), 'Velocity', xlate('Units: '), 'VelocityUnits', false, mech_getDefaultUnit('lin_vel'));
    % 66 69
    % 67 69
    % 68 69
    acelUnit = PMDialogs.PmCheckUnit(hBlk, '', 0.0, xlate('Acceleration'), 'Acceleration', xlate('Units: '), 'AccelerationUnits', false, mech_getDefaultUnit('lin_acc'));
    % 70 73
    % 71 73
    % 72 73
    compForcUnit = PMDialogs.PmCheckUnit(hBlk, '', 0.0, xlate('Computed force'), 'Force', xlate('Units: '), 'ForceUnits', false, mech_getDefaultUnit('force'));
    % 74 78
    % 75 78
    % 76 78
    % 77 78
    prismPanel = PMDialogs.PmGroupPanel(hBlk, '', 'NoBoxNoTitle');
    prismPanel.Items = horzcat(posUnit, velUnit, acelUnit, compForcUnit);
    % 80 85
    % 81 85
    % 82 85
    % 83 85
    % 84 85
    quatChk = PMDialogs.PmCheckBox(hBlk, xlate('Quaternion'), 'Quaternion', 1.0);
    % 86 87
    quatDTChk = PMDialogs.PmCheckBox(hBlk, xlate('Quaternion, derivative'), 'QuaternionDT', 1.0);
    % 88 89
    quatDDTChk = PMDialogs.PmCheckBox(hBlk, xlate('Quaternion, second derivative'), 'QuaternionDDT', 1.0);
    % 90 92
    % 91 92
    quatSignalPnl = PMDialogs.PmGroupPanel(hBlk, '', 'NoBoxNoTitle');
    quatSignalPnl.Items = horzcat(quatChk, quatDTChk, quatDDTChk);
    % 94 99
    % 95 99
    % 96 99
    % 97 99
    % 98 99
    KinematicsPnl = PMDialogs.PmGroupPanel(hBlk, 'Primitive Outputs', 'Flat');
    KinematicsPnl.Items = horzcat(jtPrimSel, rotPanel, prismPanel, quatSignalPnl);
    % 101 106
    % 102 106
    % 103 106
    % 104 106
    % 105 106
    reactForcUnit = PMDialogs.PmCheckUnit(hBlk, '', 0.0, xlate('Reaction force'), 'ReactionForce', xlate('Units: '), 'ReactionForceUnits', false, mech_getDefaultUnit('force'));
    % 107 110
    % 108 110
    % 109 110
    reactTorqUnit = PMDialogs.PmCheckUnit(hBlk, '', 0.0, xlate('Reaction torque'), 'ReactionMoment', xlate('Units: '), 'ReactionMomentUnits', false, mech_getDefaultUnit('torque'));
    % 111 115
    % 112 115
    % 113 115
    % 114 115
    sideCombo = PMDialogs.PmDropDown(hBlk, xlate('Reaction measured on:                          '), 'ReactionSensedSide', cellhorzcat(xlate('Base'), xlate('Follower')), 1.0, '', [], {'Base';'Follower'});
    % 116 120
    % 117 120
    % 118 120
    % 119 120
    refSysCombo = PMDialogs.PmDropDown(hBlk, xlate('With respect to CS:        '), 'ReactionReferenceFrame', cellhorzcat(xlate('Absolute (World)'), xlate('Local (Body CS)')), 1.0, '', [], {'Absolute (World)';'Local (Body CS)'});
    % 121 125
    % 122 125
    % 123 125
    % 124 125
    reactPanel = PMDialogs.PmGroupPanel(hBlk, 'Joint Reactions', 'Flat');
    reactPanel.Items = horzcat(reactTorqUnit, reactForcUnit, sideCombo, refSysCombo);
    % 127 132
    % 128 132
    % 129 132
    % 130 132
    % 131 132
    widthChk = PMDialogs.PmCheckBox(hBlk, xlate('Output selected parameters as one signal.'), 'Muxed', 1.0);
    % 133 134
    muxPanel = PMDialogs.PmGroupPanel(hBlk, '', 'Flat');
    muxPanel.Items = widthChk;
    % 136 139
    % 137 139
    % 138 139
    hMainPanel = PMDialogs.PmGroupPanel(hBlk, pm_message('mechanical:mech_dialogs:TitleMeasurements'), 'Box');
    % 140 141
    hMainPanel.Items = horzcat(KinematicsPnl, reactPanel, muxPanel);
    % 142 143
    hObj.Items = hMainPanel;
    % 144 145
end % function
