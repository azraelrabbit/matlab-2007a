function hObj = PmMechDriverActuatorPanel(varargin)
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
    hObj = MECH.PmMechDriverActuatorPanel;
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
    posUnitPnl = PMDialogs.PmUnitSelect(hBlk, xlate('Position units:'), 'CoordPositionUnits', 1.0, mech_getDefaultUnit('lin_pos'));
    % 27 28
    velUnitPnl = PMDialogs.PmUnitSelect(hBlk, xlate('Velocity units:'), 'VelocityUnits', 1.0, mech_getDefaultUnit('lin_vel'));
    % 29 30
    accelUnitPnl = PMDialogs.PmUnitSelect(hBlk, xlate('Acceleration units:'), 'AccelerationUnits', 1.0, mech_getDefaultUnit('lin_acc'));
    % 31 33
    % 32 33
    linearPanel = PMDialogs.PmGroupPanel(hBlk, '', 'NoBoxNoTitle');
    linearPanel.Items = horzcat(posUnitPnl, velUnitPnl, accelUnitPnl);
    % 35 36
    arcAng = PMDialogs.PmUnitSelect(hBlk, xlate('Angular units:                      '), 'AngleUnits', 1.0, mech_getDefaultUnit('ang_pos'));
    % 37 39
    % 38 39
    arcVelUnit = PMDialogs.PmUnitSelect(hBlk, xlate('Angular velocity units:         '), 'ArcVelocityUnits', 1.0, mech_getDefaultUnit('ang_vel'));
    % 40 42
    % 41 42
    arcAcelUnit = PMDialogs.PmUnitSelect(hBlk, xlate('Angular acceleration units: '), 'ArcAccelerationUnits', 1.0, mech_getDefaultUnit('ang_acc'));
    % 43 45
    % 44 45
    arcPanel = PMDialogs.PmGroupPanel(hBlk, '', 'NoBoxNoTitle');
    arcPanel.Items = horzcat(arcAng, arcVelUnit, arcAcelUnit);
    % 47 48
    hMainPanel = PMDialogs.PmGroupPanel(hBlk, pm_message('mechanical:mech_dialogs:TitleActuation'));
    % 49 50
    hMainPanel.Items = horzcat(linearPanel, arcPanel);
    % 51 52
    hObj.Items = hMainPanel;
end % function
