function PropertyStrings = validatePropertyStrings(hCustomizer, PropertySet, TopOnly)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    for i=1.0:length(PropertySet)
        % 9 10
        PropertyStrings{i, 1.0} = s_getPropertyStrings(PropertySet{i});
    end % for
    % 12 14
    % 13 14
    if TopOnly && not(all(eq(cellfun(@length, PropertyStrings), 1.0)))
        error('DataImportExport:InvalidPropertyDepth', sprintf('Properties must be only one level deep (i.e. ''Min'')'));
        % 16 17
    end % if
    % 18 19
end % function
function PropertyStrings = s_getPropertyStrings(Property)
    % 21 33
    % 22 33
    % 23 33
    % 24 33
    % 25 33
    % 26 33
    % 27 33
    % 28 33
    % 29 33
    % 30 33
    % 31 33
    % 32 33
    PropertyStrings = [];
    % 34 36
    % 35 36
    try
        Breaks = ctranspose(find(eq(Property, '.')));
        StartPoint = vertcat(1.0, plus(Breaks, 1.0));
        EndPoint = vertcat(minus(Breaks, 1.0), length(Property));
    catch
        StartPoint = [];
        EndPoint = [];
    end % try
    % 44 46
    % 45 46
    for i=1.0:length(StartPoint)
        PropertyStrings{i, 1.0} = Property(StartPoint(i):EndPoint(i));
    end % for
    % 49 51
    % 50 51
    if any(cellfun(@isempty, PropertyStrings))
        error('DataImportExport:InvalidPropertyNames', sprintf('Property names are specified incorrectly'));
        % 53 54
    end % if
    % 55 56
end % function
