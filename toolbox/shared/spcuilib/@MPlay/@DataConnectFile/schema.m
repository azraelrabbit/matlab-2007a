function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    package = findpackage('MPlay');
    inheritFromClass = findclass(package, 'DataConnectAbstract');
    thisclass = schema.class(package, 'DataConnectFile', inheritFromClass);
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    p = schema.prop(thisclass, 'fileName', 'string');
    p.AccessFlags.PublicSet = 'off';
    p.FactoryValue = '';
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    % 22 23
    p = schema.prop(thisclass, 'reader', 'double');
    p.AccessFlags.PublicSet = 'off';
    p.FactoryValue = 0.0;
end % function
