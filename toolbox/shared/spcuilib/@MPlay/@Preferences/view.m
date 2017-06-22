function view(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if ispref(h.GroupName)
        fprintf('"%s" values in preferences registry\n', h.GroupName)
        disp(getpref(h.GroupName))
    else
        disp('No MPlay preferences in registry')
    end % if
end % function
