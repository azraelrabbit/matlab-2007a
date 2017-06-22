function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hDeriveFromClass = findclass(findpackage('DAStudio'), 'Object');
    pkg = findpackage('uimgr');
    this = schema.class(pkg, 'uiexplorer', hDeriveFromClass);
    % 11 13
    % 12 13
    p = schema.prop(this, 'dialog', 'MATLAB array');
    p.AccessFlags.PublicSet = 'off';
    % 15 16
    p = schema.prop(this, 'dialogSelection', 'string');
    p.AccessFlags.PublicSet = 'off';
    % 18 21
    % 19 21
    % 20 21
    schema.prop(this, 'hItem', 'MATLAB array');
    % 22 24
    % 23 24
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 29 31
    % 30 31
    m = schema.method(this, 'handleButtons');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {};
end % function
