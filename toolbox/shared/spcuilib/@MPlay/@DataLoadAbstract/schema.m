function schema
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    package = findpackage('MPlay');
    inheritFromClass = findclass(package, 'DataAbstract');
    thisclass = schema.class(package, 'DataLoadAbstract', inheritFromClass);
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    p = schema.prop(thisclass, 'videoData', 'MATLAB array');
    % 21 22
    p.FactoryValue = [];
end % function
