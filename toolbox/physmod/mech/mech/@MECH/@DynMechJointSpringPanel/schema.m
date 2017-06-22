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
    hCreateInPackage = findpackage('MECH');
    hBaseObj = hCreateInPackage.findclass('PmMechJointSpringPanel');
    % 13 15
    % 14 15
    hThisClass = schema.class(hCreateInPackage, 'DynMechJointSpringPanel', hBaseObj);
    % 16 19
    % 17 19
    % 18 19
    schema.prop(hThisClass, 'Row2ItemMap', 'mxArray');
    % 20 21
    schema.prop(hThisClass, 'DummyProp', 'string');
    % 22 26
    % 23 26
    % 24 26
    % 25 26
    m = schema.method(hThisClass, 'Render');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','mxArray'};
    s.OutputTypes = {'bool','mxArray'};
end % function
