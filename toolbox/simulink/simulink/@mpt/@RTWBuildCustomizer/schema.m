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
    hThisClass = schema.class(hCreateInPackage, 'RTWBuildCustomizer');
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    if eq(exist('make_rtw.m', 'file'), 2.0) || eq(exist('make_rtw.p', 'file'), 6.0)
        hThisProp = schema.prop(hThisClass, 'CodeGenEntry', 'string');
        hThisProp.AccessFlags.PublicSet = 'off';
        hThisProp.AccessFlags.PrivateSet = 'on';
        hThisProp.Visible = 'off';
        hThisProp.FactoryValue = '';
        % 26 27
        hThisProp = schema.prop(hThisClass, 'CodeGenBeforeTLC', 'string');
        hThisProp.AccessFlags.PublicSet = 'off';
        hThisProp.AccessFlags.PrivateSet = 'on';
        hThisProp.Visible = 'off';
        hThisProp.FactoryValue = '';
        % 32 33
        hThisProp = schema.prop(hThisClass, 'CodeGenAfterTLC', 'string');
        hThisProp.AccessFlags.PublicSet = 'off';
        hThisProp.AccessFlags.PrivateSet = 'on';
        hThisProp.Visible = 'off';
        hThisProp.FactoryValue = '';
        % 38 39
        hThisProp = schema.prop(hThisClass, 'CodeGenBeforeMake', 'string');
        hThisProp.AccessFlags.PublicSet = 'off';
        hThisProp.AccessFlags.PrivateSet = 'on';
        hThisProp.Visible = 'off';
        hThisProp.FactoryValue = '';
        % 44 45
        hThisProp = schema.prop(hThisClass, 'CodeGenAfterMake', 'string');
        hThisProp.AccessFlags.PublicSet = 'off';
        hThisProp.AccessFlags.PrivateSet = 'on';
        hThisProp.Visible = 'off';
        hThisProp.FactoryValue = '';
        % 50 51
        hThisProp = schema.prop(hThisClass, 'CodeGenExit', 'string');
        hThisProp.AccessFlags.PublicSet = 'off';
        hThisProp.AccessFlags.PrivateSet = 'on';
        hThisProp.Visible = 'off';
        hThisProp.FactoryValue = '';
        % 56 57
    end % if
end % function
