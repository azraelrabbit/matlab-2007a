function SsscCback(block)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    BlockName = getfullname(block);
    % 9 11
    Param_Show = get_param(BlockName, 'ShowParameters');
    Param_ExternalByPass = get_param(BlockName, 'ExternalByPass');
    Param_ExternalVdqref = get_param(BlockName, 'ExternalVqref');
    Inport_Vqref_On = strcmp('Inport', get_param(horzcat(BlockName, '/Vqref '), 'BlockType'));
    Inport_ByPass_On = strcmp('Inport', get_param(horzcat(BlockName, '/Bypass '), 'BlockType'));
    % 15 17
    p{2.0} = 'off';
    p{3.0} = 'off';
    p{4.0} = 'off';
    p{5.0} = 'off';
    p{6.0} = 'off';
    p{7.0} = 'off';
    p{8.0} = 'off';
    p{9.0} = 'off';
    p{10.0} = 'off';
    p{11.0} = 'off';
    p{12.0} = 'off';
    p{13.0} = 'off';
    SeriesControl = 0.0;
    switch Param_Show
    case 'Power data'
        p{2.0} = 'on';
        p{3.0} = 'on';
        p{4.0} = 'on';
        p{5.0} = 'on';
        p{6.0} = 'on';
        p{7.0} = 'on';
    case 'Control parameters'
        p{8.0} = 'on';
        p{9.0} = 'on';
        p{10.0} = 'on';
        p{11.0} = 'on';
        p{12.0} = 'on';
        p{13.0} = 'on';
        SeriesControl = 1.0;
    end % switch
    if strcmp('External control', get_param(BlockName, 'ExternalByPass'))
        if not(Inport_ByPass_On)
            replace_block(BlockName, 'FollowLinks', 'on', 'Name', 'Bypass ', 'Inport', 'noprompt');
            set_param(horzcat(BlockName, '/Bypass '), 'Port', '1');
        end % if
    else
        if Inport_ByPass_On
            replace_block(BlockName, 'FollowLinks', 'on', 'Name', 'Bypass ', 'Constant', 'noprompt');
        end % if
        if strcmp('Closed', get_param(BlockName, 'ExternalByPass'))
            Value_ByPass = '1';
        else
            Value_ByPass = '0';
        end % if
        set_param(horzcat(BlockName, '/Bypass '), 'Value', Value_ByPass);
    end % if
    if SeriesControl
        if strcmp('on', get_param(BlockName, 'ExternalVqref'))
            p{10.0} = 'off';
            if not(Inport_Vqref_On)
                replace_block(BlockName, 'FollowLinks', 'on', 'Name', 'Vqref ', 'Inport', 'noprompt');
                if Inport_ByPass_On
                    set_param(horzcat(BlockName, '/Vqref '), 'Port', '2');
                else
                    set_param(horzcat(BlockName, '/Vqref '), 'Port', '1');
                end % if
            end % if
        else
            if Inport_Vqref_On
                replace_block(BlockName, 'FollowLinks', 'on', 'Name', 'Vqref ', 'Constant', 'noprompt');
                set_param(horzcat(BlockName, '/Vqref '), 'Value', 'Vqref');
            end % if
        end % if
    end % if
    ParVisible = cellhorzcat('on', p{2.0}, p{3.0}, p{4.0}, p{5.0}, p{6.0}, p{7.0}, p{8.0}, p{9.0}, p{10.0}, p{11.0}, p{12.0}, p{13.0});
    set_param(BlockName, 'MaskVisibilities', ParVisible);
end % function
