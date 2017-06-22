function schema
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
    package = findpackage('MPlay');
    inheritFromClass = findclass(package, 'DataAbstract');
    thisclass = schema.class(package, 'DataConnectAbstract', inheritFromClass);
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    p = schema.prop(thisclass, 'streamHandle', 'mxArray');
    p.AccessFlags.PublicSet = 'off';
    p.FactoryValue = [];
    % 23 27
    % 24 27
    % 25 27
    % 26 27
    p = schema.prop(thisclass, 'vDataType', 'string');
    p.AccessFlags.PublicSet = 'off';
    p.FactoryValue = 'double';
end % function
