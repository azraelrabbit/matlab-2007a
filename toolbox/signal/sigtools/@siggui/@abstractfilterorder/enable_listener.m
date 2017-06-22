function enable_listener(h, eventData)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    EnabState = get(h, 'enable');
    % 12 14
    % 13 14
    handles = get(h, 'handles');
    % 15 16
    if strcmp(EnabState, 'off')
        setenableprop(handles2vector(h), 'off');
    else
        setenableprop(handles2vector(h), 'on');
        % 20 21
        if not(get(h, 'isMinOrd'))
            setenableprop(handles.rbs(end), 'off', 'radiobutton');
        else
            % 24 25
            Mode = get(h, 'Mode');
            AllModes = set(h, 'Mode');
            if strcmp(Mode, AllModes{2.0})
                setenableprop(handles.eb, 'off', 'edit');
            end % if
        end % if
    end % if
    % 32 34
    % 33 34
    setenableprop(handles.framewlabel, 'on');
end % function
