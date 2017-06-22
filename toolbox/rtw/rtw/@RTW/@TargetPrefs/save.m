function save(h)
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
    groupName = 'TargetPrefs';
    % 12 13
    prefName = strrep(h.class, '.', '_');
    % 14 15
    try
        setpref(groupName, prefName, h);
    catch
        error('Failure attempting to store target preferences');
    end % try
end % function
