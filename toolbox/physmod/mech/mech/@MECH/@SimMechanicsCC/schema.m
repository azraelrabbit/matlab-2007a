function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    doTrace(false);
    % 9 10
    pkg = findpackage('MECH');
    % 11 12
    parentpkg = findpackage('Simulink');
    parentcls = findclass(parentpkg, 'CustomCC');
    cls = schema.class(pkg, 'SimMechanicsCC', parentcls);
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    envcls = findclass(pkg, 'ModelEnvironment');
    for i=1.0:length(envcls.Properties)
        prop = envcls.Properties(i);
        name = prop.Name;
        dt = prop.DataType;
        if strcmp(dt, 'double')
            dt = 'string';
        end % if
        schema.prop(cls, name, dt);
    end % for
    % 29 33
    % 30 33
    % 31 33
    % 32 33
    schema.prop(cls, 'VisConfigFile', 'string');
    % 34 43
    % 35 43
    % 36 43
    % 37 43
    % 38 43
    % 39 43
    % 40 43
    % 41 43
    % 42 43
    lp = schema.prop(cls, 'Listener', 'handle.listener');
    lp.AccessFlags.PublicSet = 'off';
    lp.AccessFlags.PublicGet = 'off';
    lp.AccessFlags.Serialize = 'off';
    % 47 51
    % 48 51
    % 49 51
    % 50 51
    p = schema.prop(cls, 'instanceId', 'mxArray');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.Copy = 'off';
    p.GetFunction = @queryInstanceId;
    m = schema.method(cls, 'getDialogSchema');
    % 58 59
    p = schema.prop(cls, 'instanceIdImpl', 'mxArray');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.Copy = 'off';
    m = schema.method(cls, 'getDialogSchema');
    % 65 67
    % 66 67
    m = schema.method(cls, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 72 78
    % 73 78
    % 74 78
    % 75 78
    % 76 78
    % 77 78
    m = schema.method(cls, 'update');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    % 82 84
    % 83 84
    s.OutputTypes = {};
    % 85 87
    % 86 87
    if doTrace
        p = schema.prop(c, 'debugMode', 'bool');
        p.FactoryValue = true;
        p.AccessFlags.PublicSet = 'off';
    end % if
end % function
