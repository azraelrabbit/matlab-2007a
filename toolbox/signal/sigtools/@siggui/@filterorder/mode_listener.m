function mode_listener(h, eventData)
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
    Mode = get(h, 'Mode');
    AllModes = set(h, 'Mode');
    Vals = strcmp(AllModes, Mode);
    % 14 16
    % 15 16
    handles = get(h, 'handles');
    rbs = handles.rbs;
    % 18 20
    % 19 20
    for i=1.0:length(AllModes)
        set(rbs(i), 'value', Vals(i))
    end % for
    % 23 25
    % 24 25
    if strcmp(get(h, 'enable'), 'on')
        if strcmp(Mode, AllModes{2.0})
            setenableprop(handles.eb, 'off', false);
        else
            setenableprop(handles.eb, 'on', false);
        end % if
    end % if
end % function
