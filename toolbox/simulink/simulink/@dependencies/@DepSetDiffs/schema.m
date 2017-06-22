function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pk = findpackage('dependencies');
    c = schema.class(pk, 'DepSetDiffs');
    % 9 11
    % 10 11
    ignore = findclass(pk, 'AbstractDepSet');
    % 12 13
    p = schema.prop(c, 'Ready', 'bool');
    p.AccessFlags.Init = 'on';
    p.AccessFlags.PublicSet = 'off';
    p.FactoryValue = false;
    % 17 18
    p = schema.prop(c, 'DepSet1', 'MATLAB array');
    p.SetFunction = @SetProp;
    % 20 21
    p = schema.prop(c, 'Manifest1', 'string');
    % 22 23
    p.SetFunction = @SetProp;
    % 24 25
    p = schema.prop(c, 'DepSet2', 'MATLAB array');
    p.SetFunction = @SetProp;
    % 27 28
    p = schema.prop(c, 'Manifest2', 'string');
    % 29 30
    p.SetFunction = @SetProp;
    % 31 32
    p = schema.prop(c, 'FilesInFirstOnly', 'MATLAB array');
    p.SetFunction = @SetProp;
    % 34 35
    p = schema.prop(c, 'FilesInSecondOnly', 'MATLAB array');
    p.SetFunction = @SetProp;
    % 37 43
    % 38 43
    % 39 43
    % 40 43
    % 41 43
    % 42 43
    p = schema.prop(c, 'ModifiedFilesFirst', 'MATLAB array');
    p.SetFunction = @SetProp;
    % 45 46
    p = schema.prop(c, 'ModifiedFilesSecond', 'MATLAB array');
    p.SetFunction = @SetProp;
    % 48 49
    p = schema.prop(c, 'UnmodifiedFiles', 'MATLAB array');
    p.SetFunction = @SetProp;
    % 51 55
    % 52 55
    % 53 55
    % 54 55
    p = schema.prop(c, 'DirsInFirstOnly', 'MATLAB array');
    p.SetFunction = @SetProp;
    % 57 58
    p = schema.prop(c, 'DirsInSecondOnly', 'MATLAB array');
    p.SetFunction = @SetProp;
    % 60 61
    p = schema.prop(c, 'DirsInBoth', 'MATLAB array');
    p.SetFunction = @SetProp;
    % 63 64
    m = schema.method(c, 'SetReady');
    s = m.Signature;
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
    % 68 69
    m = schema.method(c, 'SetReady');
    s = m.Signature;
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
    % 73 74
    m = schema.method(c, 'XMLNode');
    s = m.Signature;
    s.InputTypes = {'handle','org.w3c.dom.Document'};
    s.OutputTypes = {'org.w3c.dom.Element'};
    % 78 79
    schema.method(c, 'getReportStyles', 'static');
end % function
function newval = SetProp(obj, newval)
    % 82 85
    % 83 85
    % 84 85
    if obj.Ready
        error('Properties cannot be changed after Ready flag is set');
    end % if
end % function
