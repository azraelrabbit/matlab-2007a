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
    clsH = schema.class(pkg, 'LibraryCategory', pkgRG.findclass('DAObject'));
    % 12 15
    % 13 15
    % 14 15
    p = schema.prop(clsH, 'CategoryName', 'string');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Reset = 'off';
    % 18 19
    p = schema.prop(clsH, 'Tag', 'string');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Reset = 'off';
    % 22 23
    p = schema.prop(clsH, 'Visible', 'bool');
    p.FactoryValue = true;
    p.AccessFlags.Reset = 'off';
    p.Visible = 'off';
    % 27 28
    p = schema.prop(clsH, 'HelpMapFile', 'string');
    p.AccessFlags.Reset = 'off';
    % 30 31
    p = schema.prop(clsH, 'HelpMapKey', 'string');
    p.AccessFlags.Reset = 'off';
    % 33 34
    p = schema.prop(clsH, 'HelpHtmlFile', 'string');
    p.AccessFlags.Reset = 'off';
    % 36 37
    p = schema.prop(clsH, 'Expanded', 'bool');
    p.FactoryValue = true;
    % 39 42
    % 40 42
    % 41 42
    m = schema.method(clsH, 'dlgViewChild');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','mxArray'};
    s.OutputTypes = {'mxArray'};
    % 47 48
    m = schema.method(clsH, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 53 54
    m = schema.method(clsH, 'areChildrenOrdered');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 59 60
    m = schema.method(clsH, 'isHierarchical');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 65 66
    m = schema.method(clsH, 'getChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
    % 71 72
    m = schema.method(clsH, 'getHierarchicalChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
    % 77 78
    m = schema.method(clsH, 'getDisplayLabel');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 83 84
    m = schema.method(clsH, 'getDisplayIcon');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 89 90
    m = schema.method(clsH, 'getPreferredProperties');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string vector'};
    % 95 96
    m = schema.method(clsH, 'exploreAction');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
    % 101 102
    m = schema.method(clsH, 'getContextMenu');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle vector'};
    s.OutputTypes = {'handle'};
end % function
