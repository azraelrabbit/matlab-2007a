function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pkg = findpackage('rptgen');
    % 9 10
    clsH = schema.class(pkg, 'propsrc', pkg.findclass('DAObject'));
    % 11 14
    % 12 14
    % 13 14
    p = rptgen.prop(clsH, 'DlgFilter', 'string');
    p.AccessFlags.Serialize = 'off';
    % 16 18
    % 17 18
    p.Visible = 'off';
    % 19 20
    p = rptgen.prop(clsH, 'DlgProperty', 'string');
    p.AccessFlags.Serialize = 'off';
    % 22 24
    % 23 24
    p.Visible = 'off';
    % 25 38
    % 26 38
    % 27 38
    % 28 38
    % 29 38
    % 30 38
    % 31 38
    % 32 38
    % 33 38
    % 34 38
    % 35 38
    % 36 38
    % 37 38
    m = find(clsH.Method, 'Name', 'getDialogSchema');
    if not(isempty(m))
        s = m.Signature;
        s.varargin = 'off';
        s.InputTypes = {'handle','string'};
        s.OutputTypes = {'mxArray'};
    end % if
    % 45 46
    m = schema.method(clsH, 'dlgSelectAction');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle','handle','string'};
    s.OutputTypes = {};
    % 51 52
    m = schema.method(clsH, 'dlgAddAction');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle','handle','string'};
    s.OutputTypes = {};
end % function
