function DCMachineCback(block, option)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    ShowDetailedParameters = get_param(block, 'ShowDetailedParameters');
    WantTorqueInput = strcmp(get_param(block, 'MechanicalLoad'), 'Torque TL');
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    try
        HaveTorqueInput = strcmp('TL', get_param(horzcat(block, '/TL'), 'Name'));
    catch
        % 17 20
        % 18 20
        HaveTorqueInput = 0.0;
        % 20 22
        lasterror('reset');
    end % try
    % 23 25
    if WantTorqueInput
        MecVisible = 'on';
        InitialSpeedVisible = 'on';
    else
        MecVisible = 'off';
        InitialSpeedVisible = 'off';
    end
    % 31 33
    if strcmp(option, 'Continuous')
        if strcmp(ShowDetailedParameters, 'on')
            set_param(block, 'Maskvisibilities', cellhorzcat('on', 'on', 'on', 'on', 'on', 'on', MecVisible, MecVisible, MecVisible, InitialSpeedVisible));
        else
            set_param(block, 'Maskvisibilities', cellhorzcat('on', 'on', 'on', 'off', 'off', 'off', 'off', 'off', 'off', InitialSpeedVisible));
        end
    else
        if strcmp(ShowDetailedParameters, 'on')
            set_param(block, 'Maskvisibilities', cellhorzcat('on', 'on', 'on', 'on', 'on', 'on', MecVisible, MecVisible, MecVisible, InitialSpeedVisible, 'on'));
        else
            set_param(block, 'Maskvisibilities', cellhorzcat('on', 'on', 'on', 'off', 'off', 'off', 'off', 'off', 'off', InitialSpeedVisible, 'on'));
        end
    end
    % 45 48
    % 46 48
    powerlibroot = which('powersysdomain');
    MachineParametersDirectory = horzcat(powerlibroot(1.0:minus(end, 16.0)), 'MachineParameters', filesep);
    PresetModel = get_param(gcb, 'PresetModel');
    if not(strcmp(PresetModel, 'No'))
        Indice = eval(PresetModel(1.0:2.0));
        load(horzcat(MachineParametersDirectory, 'DCparameters'));
        set_param(block, 'RLa', mat2str(horzcat(Machines(Indice).Ra, Machines(Indice).La), 4.0));
        set_param(block, 'RLf', mat2str(horzcat(Machines(Indice).Rf, Machines(Indice).Lf), 4.0));
        set_param(block, 'Laf', mat2str(Machines(Indice).Laf, 4.0));
        set_param(block, 'J', mat2str(Machines(Indice).J, 4.0));
        set_param(block, 'Bm', mat2str(Machines(Indice).Bm, 4.0));
        set_param(block, 'Tf', mat2str(Machines(Indice).Tf, 4.0));
    end
    % 60 63
    % 61 63
    if WantTorqueInput && not(HaveTorqueInput)
        set_param(horzcat(block, '/w'), 'name', 'TL');
    else
        if not(WantTorqueInput) && HaveTorqueInput
            set_param(horzcat(block, '/TL'), 'name', 'w');
        end
    end
end
