function ShaftCback(block)
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
        load('ShaftParameters');
        set_param(block, 'Ksh', mat2str(ShaftParameters(Indice).Ksh));
        set_param(block, 'Bsh', mat2str(ShaftParameters(Indice).Bsh));
    end % if
end % function
