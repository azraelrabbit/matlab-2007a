function compile(dp, previous)
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
    units = l_get_units(previous.Name);
    if strcmp(dp.getGroup, previous.getGroup) && strcmp(dp.Name, horzcat(previous.Name, 'Units')) && not(isempty(units))
        dp.WidgetType = 'units';
        dp.Entries = units;
        dp.IsUnit = true;
        previous.HasUnit = true;
    end % if
end % function
function units = l_get_units(name)
    % 20 23
    % 21 23
    % 22 23
    switch name
    case 'Gravity'
        units = {'km/s^2','m/s^2','cm/s^2','mm/s^2','mi/s^2','ft/s^2','in/s^2'};
    case 'LinearAssemblyTolerance'
        units = {'km','m','cm','mm','mi','ft','in'};
    case 'AngularAssemblyTolerance'
        units = {'deg','rad'};
    otherwise
        units = {};
    end % switch
end % function
