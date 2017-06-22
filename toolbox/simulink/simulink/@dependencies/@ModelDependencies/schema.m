function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    p = findpackage('dependencies');
    parent = findclass(p, 'AnalysisOptions');
    c = schema.class(p, 'ModelDependencies', parent);
    % 10 11
    p = schema.prop(c, 'MDLName', 'string');
    p.SetFunction = @SetMDLName;
    % 13 14
    schema.prop(c, 'ProgressCallback', 'MATLAB array');
    % 15 16
    schema.prop(c, 'analyzer', 'MATLAB array');
    % 17 18
    schema.method(c, 'Analyze');
    schema.method(c, 'AddUserDependency');
    schema.method(c, 'RemoveUserDependency');
    schema.method(c, 'GetUserDependencies');
    % 22 23
    schema.prop(c, 'analyzer', 'MATLAB array');
    % 24 25
    m = schema.method(c, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 30 31
    m = schema.method(c, 'dlgCallback');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string','handle'};
    s.OutputTypes = {'bool','string'};
    % 36 37
    m = schema.method(c, 'controlCallback');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string','handle'};
    s.OutputTypes = {};
end % function
function newmdl = SetMDLName(obj, newmdl)
    % 44 48
    % 45 48
    % 46 48
    % 47 48
    dependencies.ensure_loaded(newmdl);
end % function
