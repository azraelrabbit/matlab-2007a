function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    slpkg = findpackage('Simulink');
    sldlgsrc = findclass(slpkg, 'SLDialogSource');
    pkg = findpackage('MECH');
    cls = schema.class(pkg, 'DialogSource', sldlgsrc);
    % 11 12
    a = MECH.DialogPropertyList;
    schema.prop(cls, 'PropertyList', class(a));
    schema.prop(cls, 'BlockHandle', 'double');
    % 15 16
    schema.prop(cls, 'UpdateCallback', 'MATLAB array');
    % 17 18
    m = schema.method(cls, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
end % function
