function [WantBlockChoice, Ts, TLB, X, Y, Bras] = ThreeLevelBridgeInit(block, Device, Arms, ForwardVoltages)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    [X, Y] = UniversalBridgeIcon(plus(Device, 2.0));
    PowerguiInfo = getPowerguiInfo(bdroot(block));
    Ts = PowerguiInfo.Ts;
    % 12 14
    % 13 14
    TLB.Tf_sps = 0.0;
    TLB.Tt_sps = 0.0;
    % 16 18
    % 17 18
    Bras = eval(Arms);
    Vf = ForwardVoltages(1.0);
    Vfd = ForwardVoltages(2.0);
    % 21 22
    TLB.NDevices = mtimes(4.0, Bras);
    TLB.NDiodes = mtimes(2.0, Bras);
    TLB.NIdSw = mtimes(3.0, Bras);
    % 25 26
    TLB.Vf_SwitchOn = horzcat(mtimes(Vf, ones(1.0, TLB.NDevices)), mtimes(Vfd, ones(1.0, TLB.NDiodes)));
    % 27 28
    TLB.Vf_DiodeOn = horzcat(mtimes(uminus(Vfd), ones(1.0, TLB.NDevices)), mtimes(Vfd, ones(1.0, TLB.NDiodes)));
    % 29 31
    % 30 31
    if PowerguiInfo.Interpolate
        TLB.SignalLength = plus(mtimes(2.0, TLB.NDevices), 1.0);
        TLB.GatesDelaysLength = mtimes(2.0, plus(TLB.NDevices, TLB.NDiodes));
        TLB.GatesOnly = 1.0:2.0:TLB.GatesDelaysLength;
        switch Bras
        case 1.0
            % 37 38
            TLB.ReorderGatesDelays = [1.0 5.0 2.0 6.0 3.0 7.0 4.0 8.0 9.0 9.0 9.0 9.0];
            % 39 40
            TLB.ReorderGates = [1.0 2.0 3.0 4.0 5.0 5.0];
            % 41 42
            TLB.selection1 = [1.0 2.0 4.0];
            TLB.selection2 = [1.0 3.0 4.0];
            TLB.selection3 = [1.0 4.0 2.0 5.0 3.0 6.0];
            TLB.SelectPulse2 = 2.0;
            TLB.Delays = 5.0;
        case 2.0
            % 48 49
            TLB.ReorderGatesDelays = [1.0 9.0 2.0 10.0 3.0 11.0 4.0 12.0 17.0 17.0 17.0 17.0 5.0 13.0 6.0 14.0 7.0 15.0 8.0 16.0 17.0 17.0 17.0 17.0];
            % 50 51
            TLB.ReorderGates = [1.0 2.0 3.0 4.0 9.0 9.0 5.0 6.0 7.0 8.0 9.0 9.0];
            % 52 53
            TLB.selection1 = [1.0 2.0 4.0 5.0 6.0 8.0];
            TLB.selection2 = [1.0 3.0 4.0 5.0 7.0 8.0];
            TLB.selection3 = [1.0 7.0 2.0 9.0 3.0 11.0 4.0 8.0 5.0 10.0 6.0 12.0];
            TLB.SelectPulse2 = [2.0 6.0];
            TLB.Delays = [9.0 13.0];
        case 3.0
            % 59 60
            TLB.ReorderGatesDelays = [1.0 13.0 2.0 14.0 3.0 15.0 4.0 16.0 25.0 25.0 25.0 25.0 5.0 17.0 6.0 18.0 7.0 19.0 8.0 20.0 25.0 25.0 25.0 25.0 9.0 21.0 10.0 22.0 11.0 23.0 12.0 24.0 25.0 25.0 25.0 25.0];
            % 61 62
            TLB.ReorderGates = [1.0 2.0 3.0 4.0 13.0 13.0 5.0 6.0 7.0 8.0 13.0 13.0 9.0 10.0 11.0 12.0 13.0 13.0];
            % 63 64
            TLB.selection1 = [1.0 2.0 4.0 5.0 6.0 8.0 9.0 10.0 12.0];
            TLB.selection2 = [1.0 3.0 4.0 5.0 7.0 8.0 9.0 11.0 12.0];
            TLB.selection3 = [1.0 10.0 2.0 13.0 3.0 16.0 4.0 11.0 5.0 14.0 6.0 17.0 7.0 12.0 8.0 15.0 9.0 18.0];
            TLB.SelectPulse2 = [2.0 6.0 10.0];
            TLB.Delays = [13.0 17.0 21.0];
        end % switch
    else
        TLB.SignalLength = plus(TLB.NDevices, 1.0);
        TLB.GatesDelaysLength = plus(TLB.NDevices, TLB.NDiodes);
        TLB.GatesOnly = 1.0:TLB.GatesDelaysLength;
        switch Bras
        case 1.0
            % 76 77
            TLB.ReorderGatesDelays = [1.0 2.0 3.0 4.0 5.0 5.0];
            % 78 79
            TLB.selection1 = [1.0 2.0 4.0];
            TLB.selection2 = [1.0 3.0 4.0];
            TLB.selection3 = [1.0 2.0 3.0];
            TLB.SelectPulse2 = 1.0;
            TLB.Delays = 1.0;
        case 2.0
            % 85 86
            TLB.ReorderGatesDelays = [1.0 2.0 3.0 4.0 9.0 9.0 5.0 6.0 7.0 8.0 9.0 9.0];
            % 87 88
            TLB.selection1 = [1.0 2.0 4.0 5.0 6.0 8.0];
            TLB.selection2 = [1.0 3.0 4.0 5.0 7.0 8.0];
            TLB.selection3 = [1.0 2.0 3.0 4.0 5.0 6.0];
            TLB.SelectPulse2 = [1.0 1.0];
            TLB.Delays = [1.0 1.0];
        case 3.0
            % 94 95
            TLB.ReorderGatesDelays = [1.0 2.0 3.0 4.0 13.0 13.0 5.0 6.0 7.0 8.0 13.0 13.0 9.0 10.0 11.0 12.0 13.0 13.0];
            % 96 97
            TLB.selection1 = [1.0 2.0 4.0 5.0 6.0 8.0 9.0 10.0 12.0];
            TLB.selection2 = [1.0 3.0 4.0 5.0 7.0 8.0 9.0 11.0 12.0];
            TLB.selection3 = [1.0 2.0 3.0 4.0 5.0 6.0 7.0 8.0 9.0];
            TLB.SelectPulse2 = [1.0 1.0 1.0];
            TLB.Delays = [1.0 1.0 1.0];
        end % switch
        % 103 104
        TLB.ReorderGates = TLB.ReorderGatesDelays;
    end % if
    % 106 107
    if PowerguiInfo.Discrete
        WantBlockChoice = 'discrete ';
    else
        WantBlockChoice = 'continuous ';
    end % if
    % 112 113
    switch Device
    case 1.0
        WantBlockChoice = horzcat(WantBlockChoice, 'GTO / Diodes');
    case 2.0
        WantBlockChoice = horzcat(WantBlockChoice, 'MOSFET / Diodes');
    case 3.0
        WantBlockChoice = horzcat(WantBlockChoice, 'IGBT / Diodes');
    case 4.0
        WantBlockChoice = horzcat(WantBlockChoice, 'Ideal Switch');
    end % switch
    % 123 124
    ThreeLevelBridgeCback(block, 'device configuration');
    ThreeLevelBridgeCback(block, 'BridgeArms');
    power_gototags(block, 'Library', 0.0);
    power_initmask;
end % function
