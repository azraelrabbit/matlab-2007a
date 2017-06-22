function notval = notbool(val)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if isstr(val)
        % 9 11
        if strcmp(val, 'yes')
            notval = 'no';
            return;
        end % if
        if strcmp(val, 'no')
            notval = 'yes';
            return;
        end % if
        if strcmp(val, 'on')
            notval = 'off';
            return;
        end % if
        if strcmp(val, 'off')
            notval = 'on';
            return;
        end % if
    else
        % 27 29
        notval = not(val);
        % 29 31
    end % if
end % function
