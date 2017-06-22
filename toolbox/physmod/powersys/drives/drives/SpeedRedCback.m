function SpeedRedCback(block)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    PresetModel = get_param(gcb, 'PresetModel');
    if not(strcmp(PresetModel, 'No'))
        Indice = eval(PresetModel(1.0:2.0));
        load('SpeedRedParameters');
        set_param(block, 'i', mat2str(SpeedRedParameters(Indice).i));
        set_param(block, 'Jrdh', mat2str(SpeedRedParameters(Indice).Jrdh));
        set_param(block, 'eff', mat2str(SpeedRedParameters(Indice).eff));
        set_param(block, 'Ksh', mat2str(SpeedRedParameters(Indice).Ksh));
        set_param(block, 'Bsh', mat2str(SpeedRedParameters(Indice).Bsh));
        set_param(block, 'Ksl', mat2str(SpeedRedParameters(Indice).Ksl));
        set_param(block, 'Bsl', mat2str(SpeedRedParameters(Indice).Bsl));
    end % if
end % function
