function group = getGroup(dp)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    info = feature('SimMechanicsEnvironmentInfo', dp.Name);
    group = info.Group;
end % function
