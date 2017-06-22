function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkg = findpackage('DES');
    % 8 9
    parentpkg = findpackage('Simulink');
    parentcls = findclass(parentpkg, 'CustomCC');
    cls = schema.class(pkg, 'SimEventsCC', parentcls);
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    lp = schema.prop(cls, 'SEListener', 'handle.listener');
    lp.AccessFlags.PublicSet = 'off';
    lp.AccessFlags.PublicGet = 'off';
    lp.AccessFlags.Serialize = 'off';
    % 24 26
    % 25 26
    m = schema.method(cls, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 31 33
    % 32 33
    hProp = schema.prop(cls, 'propIdentEvents', 'int');
    hProp.factory = 0.0;
    hProp = schema.prop(cls, 'propIdentEventSeed', 'string');
    hProp.factory = '123456789';
    hProp = schema.prop(cls, 'propUnconnectedPorts', 'int');
    hProp.factory = 0.0;
    % 39 40
    hProp = schema.prop(cls, 'propLogEventsScheduled', 'bool');
    hProp.factory = 0.0;
    hProp = schema.prop(cls, 'propLogEventsExecuted', 'bool');
    hProp.factory = 0.0;
    hProp = schema.prop(cls, 'propLogDepartureEvents', 'bool');
    hProp.factory = 0.0;
    hProp = schema.prop(cls, 'propDisplayEventCalendar', 'bool');
    hProp.factory = 0.0;
end % function
