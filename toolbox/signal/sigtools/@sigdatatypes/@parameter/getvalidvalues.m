function out = getvalidvalues(hObj, out)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if iscell(out)
        out = get(hObj, 'AllOptions');
        do = get(hObj, 'DisabledOptions');
        out(do) = [];
    end % if
end % function
