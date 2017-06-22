function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    mlock;
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    hCreateInPackage = findpackage('mpt');
    % 13 15
    % 14 15
    hThisClass = schema.class(hCreateInPackage, 'SLDataObjectCustomizer');
    % 16 18
    % 17 18
    pkg_factory = {'Simulink','mpt'};
    hThisProp = schema.prop(hThisClass, 'UserPackageList', 'MATLAB array');
    hThisProp.AccessFlags.PublicSet = 'off';
    hThisProp.AccessFlags.PrivateSet = 'on';
    hThisProp.Visible = 'off';
    hThisProp.FactoryValue = pkg_factory;
    % 24 25
    dt_factory = {'double','single','int8','uint8','int16','uint16','int32','uint32','boolean'};
    % 26 27
    hThisProp = schema.prop(hThisClass, 'UserDataTypes', 'MATLAB array');
    hThisProp.AccessFlags.PublicSet = 'off';
    hThisProp.AccessFlags.PrivateSet = 'on';
    hThisProp.Visible = 'off';
    hThisProp.FactoryValue = dt_factory;
    % 32 33
    ot_factory = {};
    hThisProp = schema.prop(hThisClass, 'MPTObjectTypes', 'MATLAB array');
    hThisProp.AccessFlags.PublicSet = 'off';
    hThisProp.AccessFlags.PrivateSet = 'on';
    hThisProp.Visible = 'off';
    hThisProp.FactoryValue = ot_factory;
end % function
