function AsynchronousMachineCback(block, option)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    RotorType = get_param(block, 'RotorType');
    ports = get_param(block, 'ports');
    HaveRotorPorts = eq(ports(7.0), 3.0);
    ShowDetailedParameters = get_param(block, 'ShowDetailedParameters');
    SetSaturation = get_param(block, 'SimulateSaturation');
    WantTorqueInput = strcmp(get_param(block, 'MechanicalLoad'), 'Torque Tm');
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    try
        HaveTorqueInput = strcmp('Tm', get_param(horzcat(block, '/Tm'), 'Name'));
    catch
        % 21 24
        % 22 24
        HaveTorqueInput = 0.0;
        % 24 26
        lasterror('reset');
    end % try
    % 27 30
    % 28 30
    if strcmp(RotorType, 'Squirrel-cage') && HaveRotorPorts
        % 30 32
        PortHandles = get_param(horzcat(block, '/ASM'), 'PortHandles');
        ligne1 = get_param(PortHandles.RConn(1.0), 'line');
        ligne2 = get_param(PortHandles.RConn(2.0), 'line');
        ligne3 = get_param(PortHandles.RConn(3.0), 'line');
        if ne(ligne1, -1.0)
            delete_line(ligne1);
            delete_line(ligne2);
            delete_line(ligne3);
            delete_block(horzcat(block, '/a'));
            delete_block(horzcat(block, '/b'));
            delete_block(horzcat(block, '/c'));
        end
        % 43 45
        PlotIcon = 'plot(-55,-30,55,90,p1,p2,p3,p4,p5,p6,p7,p8,p15,p16);color(''blue'');plot([-30,-10,-10],[70,70,55]);';
        % 45 47
        set_param(block, 'MaskDisplay', PlotIcon);
        % 47 49
    end
    % 49 51
    if strcmp(RotorType, 'Wound') && not(HaveRotorPorts)
        % 51 53
        add_block('built-in/PMIOPort', horzcat(block, '/a'));
        set_param(horzcat(block, '/a'), 'Position', [220.0 25.0 250.0 45.0], 'side', 'Right', 'orientation', 'left');
        add_block('built-in/PMIOPort', horzcat(block, '/b'));
        set_param(horzcat(block, '/b'), 'Position', [220.0 60.0 250.0 80.0], 'side', 'Right', 'orientation', 'left');
        add_block('built-in/PMIOPort', horzcat(block, '/c'));
        set_param(horzcat(block, '/c'), 'Position', [220.0 95.0 250.0 115.0], 'side', 'Right', 'orientation', 'left');
        % 58 60
        ASMPortHandles = get_param(horzcat(block, '/ASM'), 'PortHandles');
        aPortHandle = get_param(horzcat(block, '/a'), 'PortHandles');
        bPortHandle = get_param(horzcat(block, '/b'), 'PortHandles');
        cPortHandle = get_param(horzcat(block, '/c'), 'PortHandles');
        % 63 65
        add_line(block, ASMPortHandles.RConn(1.0), aPortHandle.RConn)
        add_line(block, ASMPortHandles.RConn(2.0), bPortHandle.RConn)
        add_line(block, ASMPortHandles.RConn(3.0), cPortHandle.RConn)
        % 67 69
        PlotIcon = 'plot(-55,-30,55,90,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16);color(''blue'');plot([-30,-10,-10],[70,70,55]);plot([35,10,10],[70,70,55]);';
        set_param(block, 'MaskDisplay', PlotIcon);
    end
    % 71 74
    % 72 74
    if strcmp(ShowDetailedParameters, 'on')
        if WantTorqueInput
            MechanicalVisible = 'on';
            PolePairsVisible = 'off';
        else
            MechanicalVisible = 'off';
            PolePairsVisible = 'on';
        end
        if strcmp(SetSaturation, 'on')
            set_param(block, 'Maskvisibilities', cellhorzcat('on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', MechanicalVisible, PolePairsVisible, 'on', 'off', 'off', 'on', 'on'));
        else
            set_param(block, 'Maskvisibilities', cellhorzcat('on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', MechanicalVisible, PolePairsVisible, 'on', 'off', 'off', 'on', 'off'));
        end
    else
        set_param(block, 'Maskvisibilities', {'on','on','on','off','off','off','off','off','off','off','off','off','off','off','off','off'});
    end
    % 89 92
    % 90 92
    if exist('option', 'var')
        powerlibroot = which('powersysdomain');
        MachineParametersDirectory = horzcat(powerlibroot(1.0:minus(end, 16.0)), 'MachineParameters', filesep);
        PresetModel = get_param(gcb, 'PresetModel');
        if not(strcmp(PresetModel, 'No'))
            Indice = eval(PresetModel(1.0:2.0));
            if strcmp(option, 'pu')
                load(horzcat(MachineParametersDirectory, 'ASMparameters_PU'));
            else
                load(horzcat(MachineParametersDirectory, 'ASMparameters_SI'));
                % 101 103
                Machines(Indice).H = Machines(Indice).J;
                Machines(Indice).F = Machines(Indice).B;
            end
            set_param(block, 'RotorType', 'Squirrel-cage');
            set_param(block, 'NominalParameters', mat2str(horzcat(Machines(Indice).P, Machines(Indice).V, Machines(Indice).f), 4.0));
            set_param(block, 'Stator', mat2str(horzcat(Machines(Indice).Rs, Machines(Indice).Lls), 4.0));
            set_param(block, 'Rotor', mat2str(horzcat(Machines(Indice).Rr, Machines(Indice).Llr), 4.0));
            set_param(block, 'Lm', mat2str(Machines(Indice).Lm, 4.0));
            set_param(block, 'Mechanical', mat2str(horzcat(Machines(Indice).H, Machines(Indice).F, Machines(Indice).ppole), 4.0));
        end
    end
    % 113 116
    % 114 116
    if WantTorqueInput && not(HaveTorqueInput)
        % 116 118
        set_param(horzcat(block, '/w'), 'name', 'Tm');
        % 118 120
        Mechanical = eval(get_param(block, 'Mechanical'));
        PolePairs = eval(get_param(block, 'PolePairs'));
        Mechanical(3.0) = PolePairs;
        set_param(block, 'Mechanical', mat2str(Mechanical));
    else
        if not(WantTorqueInput) && HaveTorqueInput
            % 125 127
            set_param(horzcat(block, '/Tm'), 'name', 'w');
            % 127 129
            Mechanical = eval(get_param(block, 'Mechanical'));
            PolePairs = mat2str(Mechanical(3.0));
            set_param(block, 'PolePairs', PolePairs);
            % 131 133
        end
    end
end
