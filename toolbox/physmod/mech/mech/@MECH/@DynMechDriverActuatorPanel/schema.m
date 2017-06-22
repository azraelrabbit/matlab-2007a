function schema
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    hCreateInPackage = findpackage('MECH');
    hBaseObj = hCreateInPackage.findclass('PmMechDriverActuatorPanel');
    % 12 14
    % 13 14
    hThisClass = schema.class(hCreateInPackage, 'DynMechDriverActuatorPanel', hBaseObj);
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    m = schema.method(hThisClass, 'Render');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','mxArray'};
    s.OutputTypes = {'bool','mxArray'};
end % function
