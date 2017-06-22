function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    hCreateInPackage = findpackage('mpt');
    % 10 12
    % 11 12
    hThisClass = schema.class(hCreateInPackage, 'SymbolDefinition');
    % 13 15
    % 14 15
    hThisProp = schema.prop(hThisClass, 'Name', 'string');
    hThisProp.Visible = 'off';
    % 17 18
    hThisProp = schema.prop(hThisClass, 'Property', 'MATLAB array');
    hThisProp.AccessFlags.PublicSet = 'off';
    hThisProp.AccessFlags.PrivateSet = 'on';
    hThisProp.AccessFlags.PublicGet = 'off';
    hThisProp.AccessFlags.PrivateGet = 'on';
    hThisProp.FactoryValue = {};
end % function
