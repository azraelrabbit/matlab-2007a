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
    clsH = schema.class(pkg, 'LibraryRpt', pkgRG.findclass('DAObject'));
    % 12 15
    % 13 15
    % 14 15
    p = schema.prop(clsH, 'FileName', 'string');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Reset = 'off';
    % 18 19
    p = schema.prop(clsH, 'PathName', 'string');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Reset = 'off';
    % 22 23
    p = schema.prop(clsH, 'Description', 'string');
    % 24 25
    p.AccessFlags.Reset = 'off';
    % 26 28
    % 27 28
    m = schema.method(clsH, 'cbkOpen');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
    % 33 34
    m = schema.method(clsH, 'cbkReport');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
    % 39 40
    m = schema.method(clsH, 'cbkSimulink');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
    % 45 47
    % 46 47
    m = schema.method(clsH, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 52 53
    m = schema.method(clsH, 'areChildrenOrdered');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 58 59
    m = schema.method(clsH, 'isHierarchical');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 64 65
    m = schema.method(clsH, 'getChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
    % 70 71
    m = schema.method(clsH, 'getHierarchicalChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
    % 76 77
    m = schema.method(clsH, 'getDisplayLabel');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 82 83
    m = schema.method(clsH, 'getDisplayIcon');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 88 89
    m = schema.method(clsH, 'getPreferredProperties');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string vector'};
    % 94 95
    m = schema.method(clsH, 'exploreAction');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
    % 100 101
    m = schema.method(clsH, 'getContextMenu');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle vector'};
    s.OutputTypes = {'handle'};
end % function
