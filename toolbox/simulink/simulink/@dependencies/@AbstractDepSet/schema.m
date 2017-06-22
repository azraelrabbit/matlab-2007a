function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pk = findpackage('dependencies');
    c = schema.class(pk, 'AbstractDepSet');
    % 9 11
    % 10 11
    pk.findclass('AnalysisOptions');
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    p = schema.prop(c, 'Ready', 'bool');
    p.AccessFlags.Init = 'on';
    p.AccessFlags.PublicSet = 'off';
    p.FactoryValue = false;
    % 21 22
    p = schema.prop(c, 'FileName', 'string');
    p.SetFunction = @SetProp;
    % 24 25
    p = schema.prop(c, 'AnalysisDate', 'string');
    p.SetFunction = @SetProp;
    % 27 28
    p = schema.prop(c, 'Options', 'dependencies.AnalysisOptions');
    p.SetFunction = @SetProp;
    % 30 31
    p = schema.prop(c, 'Toolboxes', 'MATLAB array');
    p.SetFunction = @SetProp;
    % 33 34
    p = schema.prop(c, 'AllFiles', 'MATLAB array');
    p.SetFunction = @SetProp;
    % 36 37
    p = schema.prop(c, 'AllReferences', 'MATLAB array');
    p.SetFunction = @SetProp;
    % 39 40
    p = schema.prop(c, 'AllIncludeDirs', 'MATLAB array');
    p.SetFunction = @SetProp;
    % 42 43
    p = schema.prop(c, 'ExcludedDirs', 'MATLAB array');
    p.AccessFlags.Init = 'on';
    p.FactoryValue = {};
    p.SetFunction = @SetProp;
    % 47 48
    p = schema.prop(c, 'ExcludedFiles', 'MATLAB array');
    p.AccessFlags.Init = 'on';
    p.FactoryValue = {};
    p.SetFunction = @SetProp;
    % 52 53
    m = schema.method(c, 'SetReady');
    s = m.Signature;
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
    % 57 59
    % 58 59
    m = schema.method(c, 'getAllFiles');
    s = m.Signature;
    s.InputTypes = {'MATLAB array'};
    s.OutputTypes = {'MATLAB array'};
    % 63 64
    m = schema.method(c, 'Diff');
    s = m.Signature;
    s.InputTypes = {'MATLAB array','MATLAB array'};
    s.OutputTypes = {'handle'};
end % function
function newval = SetProp(obj, newval)
    % 70 73
    % 71 73
    % 72 73
    if obj.Ready
        error('Properties cannot be changed after Ready flag is set');
    end % if
end % function
