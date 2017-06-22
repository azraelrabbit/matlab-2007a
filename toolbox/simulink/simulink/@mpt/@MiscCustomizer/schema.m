function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    mlock;
    % 8 11
    % 9 11
    % 10 11
    hCreateInPackage = findpackage('mpt');
    % 12 14
    % 13 14
    hThisClass = schema.class(hCreateInPackage, 'MiscCustomizer');
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    if eq(exist('ec_mpt_enabled.m', 'file'), 2.0)
        hThisProp = schema.prop(hThisClass, 'MPFToolVersion', 'string');
        hThisProp.AccessFlags.PublicSet = 'off';
        hThisProp.AccessFlags.PrivateSet = 'on';
        hThisProp.Visible = 'off';
        hThisProp.FactoryValue = '';
        % 26 27
        sym_factory = {};
        hThisProp = schema.prop(hThisClass, 'MPFSymbolDefinition', 'MATLAB array');
        hThisProp.AccessFlags.PublicSet = 'off';
        hThisProp.AccessFlags.PrivateSet = 'on';
        hThisProp.Visible = 'off';
        hThisProp.FactoryValue = sym_factory;
    end % if
end % function
