function WindTurbineIndGenCback(block)
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
    Param_ExternalTm = get_param(BlockName, 'ExternalTm');
    Param_DisplayTurbChar = get_param(BlockName, 'DisplayTurbChar');
    % 13 15
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
    WindTurbineData = 0.0;
    switch Param_Show
    case 'Generator data'
        p{2.0} = 'on';
        p{3.0} = 'on';
        p{4.0} = 'on';
        p{5.0} = 'on';
        p{6.0} = 'on';
        p{7.0} = 'on';
    case 'Turbine data'
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
        WindTurbineData = 1.0;
    end % switch
    if WindTurbineData
        if strcmp('on', Param_ExternalTm)
            p{9.0} = 'off';
            p{10.0} = 'off';
            p{11.0} = 'off';
            p{12.0} = 'off';
            p{13.0} = 'off';
            p{14.0} = 'off';
            p{15.0} = 'off';
            p{16.0} = 'off';
            p{17.0} = 'off';
            if not(isempty(find_system(BlockName, 'LookUnderMasks', 'on', 'FollowLinks', 'on', 'Name', 'Wind (m/s) ')))
                set_param(horzcat(BlockName, '/Wind (m//s) '), 'Name', 'Tm ');
                MaskDisplay = get_param(BlockName, 'MaskDisplay');
                MaskDisplay = strrep(MaskDisplay, 'wind (m/s)', 'Tm ');
                set_param(BlockName, 'MaskDisplay', MaskDisplay);
            end % if
        else
            if not(isempty(find_system(BlockName, 'LookUnderMasks', 'on', 'FollowLinks', 'on', 'Name', 'Tm ')))
                set_param(horzcat(BlockName, '/Tm '), 'Name', 'Wind (m/s) ');
                MaskDisplay = get_param(BlockName, 'MaskDisplay');
                MaskDisplay = strrep(MaskDisplay, 'Tm ', 'wind (m/s)');
                set_param(BlockName, 'MaskDisplay', MaskDisplay);
            end % if
        end % if
    end % if
    ParVisible = cellhorzcat('on', p{2.0}, p{3.0}, p{4.0}, p{5.0}, p{6.0}, p{7.0}, p{8.0}, p{9.0}, p{10.0}, p{11.0}, p{12.0}, p{13.0}, p{14.0}, p{15.0}, p{16.0}, p{17.0});
    set_param(BlockName, 'MaskVisibilities', ParVisible);
    set_param(BlockName, 'ExternalTm', Param_ExternalTm);
    set_param(BlockName, 'DisplayTurbChar', Param_DisplayTurbChar);
end % function
