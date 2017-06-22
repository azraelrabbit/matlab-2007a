function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pk = findpackage('dependencies');
    s = pk.findclass('AbstractDepSet');
    c = schema.class(pk, 'MDLDepSet', s);
    % 10 11
    p = schema.prop(c, 'MDLName', 'string');
    p.SetFunction = @SetProp;
    % 13 14
    p = schema.prop(c, 'IsModel', 'bool');
    p.SetFunction = @SetProp;
    % 16 17
    p = schema.prop(c, 'ReferencedModels', 'MATLAB array');
    p.SetFunction = @SetProp;
    % 19 20
    p = schema.prop(c, 'ReferencedModelFiles', 'MATLAB array');
    p.SetFunction = @SetProp;
    % 22 23
    p = schema.prop(c, 'LinkedLibraries', 'MATLAB array');
    p.SetFunction = @SetProp;
    % 25 26
    p = schema.prop(c, 'LinkedLibraryFiles', 'MATLAB array');
    p.SetFunction = @SetProp;
    % 28 29
    schema.method(c, 'Load', 'static');
    schema.method(c, 'getReportStyles', 'static');
end % function
function newval = SetProp(obj, newval)
    % 33 35
    % 34 35
    if obj.Ready
        error('Properties cannot be changed after Ready flag is set');
    end % if
end % function
