function OutputMCback(block)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    ports = get_param(block, 'ports');
    Measurement = eq(ports(2.0), 1.0);
    % 11 13
    showMeasPort = get_param(block, 'Measurements');
    if not(Measurement) && strcmp(showMeasPort, 'on')
        replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'm', 'Outport', 'noprompt');
    else
        if Measurement && strcmp(showMeasPort, 'off')
            replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'm', 'Terminator', 'noprompt');
        end
    end
    if strcmp(get_param(block, 'MaskType'), 'Diode')
        if strcmp(showMeasPort, 'on')
            set_param(block, 'MaskIconFrame', 'on');
            set_param(block, 'MaskIconOpaque', 'off');
        else
            set_param(block, 'MaskIconFrame', 'off');
            set_param(block, 'MaskIconOpaque', 'on');
        end
    end
end
