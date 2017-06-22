function DSVPWMGeneratorCback(block)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    InputType = get_param(block, 'InputType');
    PortHandles = get_param(block, 'PortHandles');
    HaveNoInports = isempty(PortHandles.Inport);
    HaveInports = not(HaveNoInports);
    % 12 14
    switch InputType
    case 'Magnitude-Angle (rad)'
        set_param(block, 'MaskVisibilities', {'on','on','on','off','on'});
        KeepLastError = lasterror;
        try
            set_param(horzcat(block, '/Ualpha'), 'Name', 'Umag');
            set_param(horzcat(block, '/Ubeta'), 'Name', 'Uangle');
        catch
            % 21 23
            lasterror('Reset')
        end % try
        lasterror(KeepLastError);
        if HaveNoInports
            replace_block(block, 'Followlinks', 'on', 'Name', 'Umag', 'Inport', 'noprompt');
            replace_block(block, 'Followlinks', 'on', 'Name', 'Uangle', 'Inport', 'noprompt');
        end % if
    case 'alpha-beta components'
        set_param(block, 'MaskVisibilities', {'on','on','on','off','on'});
        KeepLastError = lasterror;
        try
            set_param(horzcat(block, '/Umag'), 'Name', 'Ualpha');
            set_param(horzcat(block, '/Uangle'), 'Name', 'Ubeta');
        catch
            % 36 38
            lasterror('Reset')
        end % try
        lasterror(KeepLastError);
        if HaveNoInports
            replace_block(block, 'Followlinks', 'on', 'Name', 'Ualpha', 'Inport', 'noprompt');
            replace_block(block, 'Followlinks', 'on', 'Name', 'Ubeta', 'Inport', 'noprompt');
        end % if
    case 'Internally generated'
        set_param(gcbh, 'MaskVisibilities', {'on','on','on','on','on'});
        KeepLastError = lasterror;
        try
            replace_block(block, 'Followlinks', 'on', 'Name', 'Umag', 'Constant', 'noprompt');
            replace_block(block, 'Followlinks', 'on', 'Name', 'Uangle', 'Constant', 'noprompt');
        catch
            % 51 53
            lasterror('Reset')
        end % try
        lasterror(KeepLastError);
        if HaveInports
            replace_block(block, 'Followlinks', 'on', 'Name', 'Ualpha', 'Constant', 'noprompt');
            replace_block(block, 'Followlinks', 'on', 'Name', 'Ubeta', 'Constant', 'noprompt');
        end % if
    end % switch
