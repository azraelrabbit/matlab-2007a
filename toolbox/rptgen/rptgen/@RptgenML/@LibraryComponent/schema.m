function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkg = findpackage('RptgenML');
    pkgRG = findpackage('rptgen');
    % 9 10
    clsH = schema.class(pkg, 'LibraryComponent', pkgRG.findclass('DAObject'));
    % 11 14
    % 12 14
    % 13 14
    p = schema.prop(clsH, 'ClassName', 'string');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Reset = 'off';
    % 17 18
    p = schema.prop(clsH, 'DisplayName', 'string');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Reset = 'off';
    % 21 24
    % 22 24
    % 23 24
    p = schema.prop(clsH, 'ComponentInstance', 'handle');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Reset = 'off';
    p.Visible = 'off';
    % 28 34
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    % 33 34
    m = schema.method(clsH, 'exploreAction');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
    % 39 40
    m = schema.method(clsH, 'areChildrenOrdered');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 45 46
    m = schema.method(clsH, 'isHierarchical');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 51 52
    m = schema.method(clsH, 'getChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
    % 57 58
    m = schema.method(clsH, 'getHierarchicalChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
    % 63 64
    m = schema.method(clsH, 'getDisplayLabel');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 69 70
    m = schema.method(clsH, 'getDisplayIcon');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 75 76
    m = schema.method(clsH, 'getPreferredProperties');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string vector'};
    % 81 82
    m = schema.method(clsH, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 87 88
    m = schema.method(clsH, 'getContextMenu');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle vector'};
    s.OutputTypes = {'handle'};
end % function
