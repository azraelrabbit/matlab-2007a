function prevState = cmd_window_buffering(newstate)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if isunix
        DAStudio.error('RTW:utility:platformNotSupported', 'unix');
    end % if
    % 9 11
    text = evalc('system_dependent(7);');
    % 11 13
    if not(isempty(findstr(text, 'buffering disabled')))
        prevState = 'on';
    else
        prevState = 'off';
    end % if
    % 17 19
    switch newstate
    case 'on'
        if not(strcmp(prevState, 'off'))
            evalc('system_dependent(7);');
        end % if
    case 'off'
        if not(strcmp(prevState, 'on'))
            evalc('system_dependent(7);');
        end % if
    otherwise
        DAStudio.error('RTW:utility:cmdWindowBufferingIllegalState');
    end % switch
