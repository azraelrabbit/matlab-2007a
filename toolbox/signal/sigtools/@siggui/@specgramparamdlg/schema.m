function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hSuperPackage = findpackage('DAStudio');
    hSuperClass = findclass(hSuperPackage, 'Object');
    pk = findpackage('siggui');
    c = schema.class(pk, 'specgramparamdlg', hSuperClass);
    % 12 14
    % 13 14
    p = schema.prop(c, 'NWindow', 'string');
    p.AccessFlags.Serialize = 'off';
    % 16 18
    % 17 18
    p = schema.prop(c, 'Nfft', 'string');
    p.Accessflags.Serialize = 'off';
    % 20 22
    % 21 22
    p = schema.prop(c, 'Nlap', 'string');
    p.Accessflags.Serialize = 'off';
    % 24 25
    schema.event(c, 'DialogClose');
    schema.event(c, 'DialogApply');
    % 27 28
    m = schema.method(c, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 33 34
    m = schema.method(c, 'dialogClosecallback');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
    % 39 40
    m = schema.method(c, 'dialogApplycallback');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'double','string'};
end % function
