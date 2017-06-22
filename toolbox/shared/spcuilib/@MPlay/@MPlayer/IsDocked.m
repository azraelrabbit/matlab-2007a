function y = IsDocked(mplayObj)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    y = strcmpi(get(mplayObj.widgetsObj.hfig, 'WindowStyle'), 'docked');
end % function
