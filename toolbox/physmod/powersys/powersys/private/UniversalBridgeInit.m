function [WantBlockChoice, Ts, Switches, Tf_sps, Tt_sps, Vf, Vf_SwitchOn, Vf_DiodeOn, IC, SignalLength, ReorderGatesDelays, X, Y] = UniversalBridgeInit(block, Device, Arms, ForwardVoltage, ForwardVoltages, GTOparameters, IGBTparameters)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    [X, Y] = UniversalBridgeIcon(Device);
    % 9 11
    PowerguiInfo = getPowerguiInfo(bdroot(block));
    Ts = PowerguiInfo.Ts;
    % 12 14
    Bras = eval(Arms);
    Switches = mtimes(2.0, Bras);
    % 15 17
    if PowerguiInfo.Interpolate
        SignalLength = mtimes(2.0, Switches);
        switch Bras
        case 1.0
            ReorderGatesDelays = [1.0 3.0 2.0 4.0];
        case 2.0
            ReorderGatesDelays = [1.0 5.0 2.0 6.0 3.0 7.0 4.0 8.0];
        case 3.0
            ReorderGatesDelays = [1.0 7.0 2.0 8.0 3.0 9.0 4.0 10.0 5.0 11.0 6.0 12.0];
        end % switch
    else
        SignalLength = Switches;
        ReorderGatesDelays = 1.0:Switches;
    end % if
    % 30 32
    Tf_sps = 0.0;
    Tt_sps = 0.0;
    % 33 36
    % 34 36
    if ne(length(ForwardVoltages), 2.0)
        ForwardVoltages = [0.0 0.0];
    end % if
    if ne(length(GTOparameters), 2.0)
        GTOparameters = [0.0 0.0];
    end % if
    if ne(length(IGBTparameters), 2.0)
        IGBTparameters = [0.0 0.0];
    end % if
    % 44 47
    % 45 47
    Vf = ForwardVoltage;
    Vf_SwitchOn = mtimes(uplus(ForwardVoltages(1.0)), ones(Switches, 1.0));
    Vf_DiodeOn = mtimes(uminus(ForwardVoltages(2.0)), ones(Switches, 1.0));
    IC = 0.0;
    if eq(Device, 3.0)
        Tf_sps = GTOparameters(1.0);
        Tt_sps = GTOparameters(2.0);
    end % if
    if eq(Device, 5.0)
        Tf_sps = IGBTparameters(1.0);
        Tt_sps = IGBTparameters(2.0);
    end % if
    % 58 60
    if PowerguiInfo.Discrete
        WantBlockChoice = 'discrete ';
    else
        WantBlockChoice = 'continuous ';
    end % if
    % 64 66
    switch Device
    case 1.0
        Lon = eval(get_param(block, 'Lon'), '0');
        if ne(Lon, 0.0) && PowerguiInfo.Continuous
            WantBlockChoice = horzcat(WantBlockChoice, 'Diode-RL');
        else
            WantBlockChoice = horzcat(WantBlockChoice, 'Diode-Logic');
        end % if
    case 2.0
        Lon = eval(get_param(block, 'Lon'), '0');
        if ne(Lon, 0.0) && PowerguiInfo.Continuous
            WantBlockChoice = horzcat(WantBlockChoice, 'Thyristor-RL');
        else
            WantBlockChoice = horzcat(WantBlockChoice, 'Thyristor-Logic');
        end % if
    case 3.0
        WantBlockChoice = horzcat(WantBlockChoice, 'GTO');
    case 4.0
        WantBlockChoice = horzcat(WantBlockChoice, 'MOSFET');
    case 5.0
        WantBlockChoice = horzcat(WantBlockChoice, 'IGBT');
    case 6.0
        WantBlockChoice = horzcat(WantBlockChoice, 'Ideal Switch');
    end % switch
    % 89 91
    UniversalBridgeCback(block, 'device configuration');
    UniversalBridgeCback(block, 'BridgeArms');
    power_gototags(block, 'Library', 1.0);
    power_initmask;
