function reset(hPref)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if ispref(hPref.GroupName)
        % 8 11
        % 9 11
        % 10 11
        buttonPressed = questdlg('Overwrite current preference settings?', 'Reset to Factory Defaults', 'OK', 'Cancel', 'Cancel');
        % 12 16
        % 13 16
        % 14 16
        % 15 16
        if strcmpi(buttonPressed, 'Cancel')
            return;
        end % if
        % 19 21
        % 20 21
        hPref.remove;
        % 22 25
        % 23 25
        % 24 25
        hPref.load;
    end % if
end % function
