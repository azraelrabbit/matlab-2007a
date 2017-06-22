function Ts = MBPowerSystemStabilizerCback(block)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    parametres = get_param(block, 'MaskValues');
    p1 = parametres{1.0};
    p13 = parametres{13.0};
    if strcmp(p1, 'Detailed settings')
        param2 = 'off';
        param3 = 'off';
        param4 = 'off';
        param5 = 'off';
        param6 = 'on';
        param7 = 'on';
        param8 = 'on';
        param9 = 'on';
        param10 = 'on';
        param11 = 'on';
    else
        param2 = 'on';
        param3 = 'on';
        param4 = 'on';
        param5 = 'on';
        param6 = 'off';
        param7 = 'off';
        param8 = 'off';
        param9 = 'off';
        param10 = 'off';
        param11 = 'off';
    end % if
    if strcmp(p13, 'on')
        param14 = 'on';
        param15 = 'on';
    else
        param14 = 'off';
        param15 = 'off';
    end % if
    visible = cellhorzcat('on', param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, 'on', 'on', param14, param15);
    set_param(block, 'MaskVisibilities', visible)
    % 45 46
    WsV = not(isempty(get_param(block, 'MaskWSVariables')));
    OperationMode = get_param(block, 'OperationMode');
    if WsV
        set_param(horzcat(block, '/Source'), 'OperationMode', OperationMode);
    end % if
end % function
