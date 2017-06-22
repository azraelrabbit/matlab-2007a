function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hCreateInPackage = findpackage('RTWConfiguration');
    % 8 9
    hThisClass = schema.class(hCreateInPackage, 'Dependency');
    % 10 12
    % 11 12
    hThisProp = schema.prop(hThisClass, 'DependentProperty', 'string');
    hThisProp.AccessFlags.PublicSet = 'off';
    hThisProp.AccessFlags.PublicGet = 'off';
    % 15 16
    hThisProp = schema.prop(hThisClass, 'ActivationVector', 'MATLAB array');
    hThisProp.AccessFlags.PublicSet = 'off';
    hThisProp.AccessFlags.PublicGet = 'off';
    % 19 20
    hThisProp = schema.prop(hThisClass, 'DeactivationVector', 'MATLAB array');
    hThisProp.AccessFlags.PublicSet = 'off';
    hThisProp.AccessFlags.PublicGet = 'off';
end % function
