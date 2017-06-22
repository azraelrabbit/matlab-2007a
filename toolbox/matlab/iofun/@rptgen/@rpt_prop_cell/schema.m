function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkgRG = findpackage('rptgen');
    h = schema.class(pkgRG, 'rpt_prop_cell', pkgRG.findclass('DAObject'));
    % 9 11
    % 10 11
    p = rptgen.prop(h, 'Align', rptgen.enumTableHorizAlign, 'center', xlate('Alignment'));
    % 12 14
    % 13 14
    p = rptgen.prop(h, 'BorderLower', 'bool', true, xlate('Lower border'));
    % 15 16
    p = rptgen.prop(h, 'BorderRight', 'bool', true, xlate('Right border'));
    % 17 19
    % 18 19
    p = rptgen.prop(h, 'Text', 'String', '', xlate('Contents'));
    % 20 22
    % 21 22
    p = rptgen.prop(h, 'Render', {'v','Value';'p v','Property Value';'N v','PROPERTY Value';'p:v','Property: Value';'N:v','PROPERTY: Value';'p-v','Property - Value';'N-v','PROPERTY - Value'}, 'p v', xlate('Show as'));
    % 23 34
    % 24 34
    % 25 34
    % 26 34
    % 27 34
    % 28 34
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    % 33 34
    p = rptgen.prop(h, 'ColSpan', 'int32', 1.0);
    p = rptgen.prop(h, 'RowSpan', 'int32', 1.0);
    p = rptgen.prop(h, 'SpanOrigin', 'handle', []);
    % 37 39
    % 38 39
    p = rptgen.prop(h, 'TitleMode', 'bool', false);
    % 40 42
    % 41 42
    p.Visible = 'off';
    % 43 44
    m = find(h.Method, 'Name', 'getDialogSchema');
    if not(isempty(m))
        s = m.Signature;
        s.varargin = 'off';
        s.InputTypes = {'handle','string'};
        s.OutputTypes = {'mxArray'};
    end % if
end % function
