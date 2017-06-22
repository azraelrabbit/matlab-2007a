function StatcomCback(block)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    BlockName = getfullname(block);
    % 10 12
    Param_Show = get_param(BlockName, 'ShowParameters');
    Param_OpMode_SH = get_param(BlockName, 'OpMode_SH');
    Param_ExternalVref = get_param(BlockName, 'ExternalVref');
    Inport_Vref_On = strcmp('Inport', get_param(horzcat(BlockName, '/Vref '), 'BlockType'));
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
    p{14.0} = 'off';
    p{15.0} = 'off';
    p{16.0} = 'off';
    p{17.0} = 'off';
    ShuntControl = 0.0;
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
        p{14.0} = 'on';
        p{15.0} = 'on';
        p{16.0} = 'on';
        p{17.0} = 'on';
        ShuntControl = 1.0;
    end % switch
    if ShuntControl
        if strcmp('Voltage regulation', get_param(BlockName, 'OpMode_SH'))
            p{14.0} = 'off';
            p{15.0} = 'off';
            if strcmp('on', get_param(BlockName, 'ExternalVref'))
                p{10.0} = 'off';
                if not(Inport_Vref_On)
                    replace_block(BlockName, 'FollowLinks', 'on', 'Name', 'Vref ', 'Inport', 'noprompt');
                end % if
            else
                if Inport_Vref_On
                    replace_block(BlockName, 'FollowLinks', 'on', 'Name', 'Vref ', 'Constant', 'noprompt');
                    set_param(horzcat(BlockName, '/Vref '), 'Value', 'Vref_SH');
                end % if
            end % if
        else
            p{9.0} = 'off';
            p{10.0} = 'off';
            p{11.0} = 'off';
            p{12.0} = 'off';
            p{13.0} = 'off';
        end % if
    end % if
    ParVisible = cellhorzcat('on', p{2.0}, p{3.0}, p{4.0}, p{5.0}, p{6.0}, p{7.0}, p{8.0}, p{9.0}, p{10.0}, p{11.0}, p{12.0}, p{13.0}, p{14.0}, p{15.0}, p{16.0}, p{17.0});
    set_param(BlockName, 'MaskVisibilities', ParVisible);
    set_param(BlockName, 'OpMode_SH', Param_OpMode_SH);
    set_param(BlockName, 'ExternalVref', Param_ExternalVref);
end % function
