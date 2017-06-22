function ProgrammableVoltageSourceCback(block)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    parametres = get_param(block, 'MaskValues');
    p2 = parametres{2.0};
    p3 = parametres{3.0};
    p12 = parametres{12.0};
    if strcmp(p3, 'Step')
        param4 = 'on';
        param5 = 'off';
        param6 = 'off';
        param7 = 'off';
        param8 = 'on';
        param9 = 'off';
        param10 = 'off';
        param11 = 'off';
    else
        if strcmp(p3, 'Ramp')
            param4 = 'off';
            param5 = 'on';
            param6 = 'off';
            param7 = 'off';
            param8 = 'on';
            param9 = 'off';
            param10 = 'off';
            param11 = 'off';
        else
            if strcmp(p3, 'Modulation')
                param4 = 'off';
                param5 = 'off';
                param6 = 'on';
                param7 = 'on';
                param8 = 'on';
                param9 = 'off';
                param10 = 'off';
                param11 = 'off';
            else
                param4 = 'off';
                param5 = 'off';
                param6 = 'off';
                param7 = 'off';
                param8 = 'off';
                param9 = 'on';
                param10 = 'on';
                param11 = 'on';
            end % if
        end % if
    end % if
    if strcmp(p2, 'None')
        param3 = 'off';
        param4 = 'off';
        param5 = 'off';
        param6 = 'off';
        param7 = 'off';
        param8 = 'off';
        param9 = 'off';
        param10 = 'off';
        param11 = 'off';
    else
        param3 = 'on';
    end % if
    if strcmp(p12, 'on')
        param13 = 'on';
        param14 = 'on';
        param15 = 'on';
    else
        param13 = 'off';
        param14 = 'off';
        param15 = 'off';
    end % if
    visible = cellhorzcat('on', 'on', param3, param4, param5, param6, param7, param8, param9, param10, param11, 'on', param13, param14, param15);
    set_param(block, 'MaskVisibilities', visible);
end % function
