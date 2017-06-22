function schema
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    hDeriveFromPackage = findpackage('Simulink');
    hDeriveFromClass = findclass(hDeriveFromPackage, 'TargetProperties');
    hCreateInPackage = findpackage('tlc');
    % 23 25
    % 24 25
    hThisClass = schema.class(hCreateInPackage, 'rtwoptions', hDeriveFromClass);
    % 26 28
    % 27 28
    hThisProp = schema.prop(hThisClass, 'tlcFile', 'string');
    % 29 33
    % 30 33
    % 31 33
    % 32 33
    p = schema.prop(hThisClass, 'PropertiesName', 'string');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
end % function
