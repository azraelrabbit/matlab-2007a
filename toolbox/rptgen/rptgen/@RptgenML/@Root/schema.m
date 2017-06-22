function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pkg = findpackage('RptgenML');
    pkgRG = findpackage('rptgen');
    % 10 11
    clsH = schema.class(pkg, 'Root', pkgRG.findclass('DAObject'));
    % 12 15
    % 13 15
    % 14 15
    p = schema.prop(clsH, 'Editor', 'handle');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Reset = 'off';
    p.AccessFlags.Serialize = 'off';
    p.Visible = 'off';
    % 20 21
    p = schema.prop(clsH, 'Library', 'handle');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Reset = 'off';
    p.AccessFlags.Serialize = 'off';
    p.Visible = 'off';
    % 26 28
    % 27 28
    p = schema.prop(clsH, 'PrevLibrary', 'handle');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Reset = 'off';
    p.AccessFlags.Serialize = 'off';
    p.Visible = 'off';
    % 33 34
    p = schema.prop(clsH, 'ReportList', 'handle vector');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Reset = 'off';
    p.AccessFlags.Serialize = 'off';
    p.Visible = 'off';
    % 39 40
    p = schema.prop(clsH, 'StylesheetLibrary', 'handle');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Reset = 'off';
    p.AccessFlags.Serialize = 'off';
    p.Visible = 'off';
    % 45 52
    % 46 52
    % 47 52
    % 48 52
    % 49 52
    % 50 52
    % 51 52
    p = schema.prop(clsH, 'HandleClipboard', 'handle');
    % 53 54
    p.AccessFlags.Reset = 'off';
    p.AccessFlags.Serialize = 'off';
    p.Visible = 'off';
    % 57 58
    p = schema.prop(clsH, 'Actions', 'MATLAB array');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Reset = 'off';
    p.AccessFlags.Serialize = 'off';
    p.Visible = 'off';
    % 63 64
    p = schema.prop(clsH, 'StatusWindow', 'MATLAB array');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Reset = 'off';
    p.AccessFlags.Serialize = 'off';
    p.Visible = 'off';
    % 69 70
    p = schema.prop(clsH, 'Listeners', 'handle vector');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Reset = 'off';
    p.AccessFlags.Serialize = 'off';
    p.Visible = 'off';
    % 75 86
    % 76 86
    % 77 86
    % 78 86
    % 79 86
    % 80 86
    % 81 86
    % 82 86
    % 83 86
    % 84 86
    % 85 86
    m = schema.method(clsH, 'areChildrenOrdered');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 91 92
    m = schema.method(clsH, 'isHierarchical');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 97 98
    m = schema.method(clsH, 'getChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
    % 103 104
    m = schema.method(clsH, 'getHierarchicalChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
    % 109 110
    m = schema.method(clsH, 'getDisplayLabel');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 115 116
    m = schema.method(clsH, 'getDisplayIcon');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 121 122
    m = schema.method(clsH, 'getPreferredProperties');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string vector'};
    % 127 128
    m = schema.method(clsH, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 133 135
    % 134 135
    m = schema.method(clsH, 'canAcceptDrop');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle vector'};
    s.OutputTypes = {'bool'};
    % 140 141
    m = schema.method(clsH, 'acceptDrop');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle vector'};
    s.OutputTypes = {'bool'};
    % 146 147
    m = schema.method(clsH, 'getContextMenu');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle vector'};
    s.OutputTypes = {'handle'};
end % function
