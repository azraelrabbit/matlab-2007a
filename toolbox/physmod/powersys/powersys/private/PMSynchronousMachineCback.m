function PMSynchronousMachineCback(block)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    ShowDetailedParameters = get_param(block, 'ShowDetailedParameters');
    WantTorqueInput = strcmp(get_param(block, 'MechanicalLoad'), 'Torque Tm');
    WantSinusoidalFlux = strcmp(get_param(block, 'FluxDistribution'), 'Sinusoidal');
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    try
        HaveTorqueInput = strcmp('Tm', get_param(horzcat(block, '/Tm'), 'Name'));
    catch
        % 18 21
        % 19 21
        HaveTorqueInput = 0.0;
        % 21 23
        lasterror('reset');
    end % try
    % 24 26
    if WantSinusoidalFlux
        PresetModel = 'on';
    else
        PresetModel = 'off';
    end
    % 30 33
    % 31 33
    if strcmp(ShowDetailedParameters, 'on')
        if WantTorqueInput
            MechanicalVisible = 'on';
            PolePairsVisible = 'off';
        else
            MechanicalVisible = 'off';
            PolePairsVisible = 'on';
        end
        if WantSinusoidalFlux
            set_param(block, 'Maskvisibilities', cellhorzcat('on', 'on', PresetModel, 'on', 'on', 'off', 'on', 'on', 'off', MechanicalVisible, PolePairsVisible));
        else
            set_param(block, 'Maskvisibilities', cellhorzcat('on', 'on', PresetModel, 'on', 'on', 'on', 'off', 'on', 'on', MechanicalVisible, PolePairsVisible));
        end
    else
        set_param(block, 'Maskvisibilities', cellhorzcat('on', 'on', PresetModel, 'on', 'off', 'off', 'off', 'off', 'off', 'off', 'off'));
    end
    % 48 51
    % 49 51
    powerlibroot = which('powersysdomain');
    MachineParametersDirectory = horzcat(powerlibroot(1.0:minus(end, 16.0)), 'MachineParameters', filesep);
    PresetModel = get_param(gcb, 'PresetModel');
    if not(strcmp(PresetModel, 'No')) && WantSinusoidalFlux
        Indice = eval(PresetModel(1.0:2.0));
        load(horzcat(MachineParametersDirectory, 'PMSMparameters_SI'));
        set_param(block, 'Resistance', mat2str(Machines(Indice).R, 4.0));
        set_param(block, 'dqInductances', mat2str(horzcat(Machines(Indice).Ld, Machines(Indice).Lq), 4.0));
        set_param(block, 'Flux', mat2str(Machines(Indice).Lambda, 4.0));
        set_param(block, 'Mechanical', mat2str(horzcat(Machines(Indice).J, Machines(Indice).B, Machines(Indice).p), 4.0));
    end
    % 61 66
    % 62 66
    % 63 66
    % 64 66
    if WantTorqueInput && not(HaveTorqueInput)
        % 66 68
        set_param(horzcat(block, '/w'), 'name', 'Tm');
        % 68 70
        Mechanical = eval(get_param(block, 'Mechanical'));
        PolePairs = eval(get_param(block, 'PolePairs'));
        Mechanical(3.0) = PolePairs;
        set_param(block, 'Mechanical', mat2str(Mechanical));
    else
        if not(WantTorqueInput) && HaveTorqueInput
            % 75 77
            set_param(horzcat(block, '/Tm'), 'name', 'w');
            % 77 79
            Mechanical = eval(get_param(block, 'Mechanical'));
            PolePairs = mat2str(Mechanical(3.0));
            set_param(block, 'PolePairs', PolePairs);
            % 81 83
        end
    end
end
