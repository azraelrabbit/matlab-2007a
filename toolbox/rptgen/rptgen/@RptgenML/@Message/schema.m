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
    clsH = schema.class(pkg, 'Message', pkgRG.findclass('DAObject'));
    % 12 15
    % 13 15
    % 14 15
    p = schema.prop(clsH, 'MessageShort', 'string');
    p = schema.prop(clsH, 'MessageLong', 'string');
    % 17 20
    % 18 20
    % 19 20
    m = schema.method(clsH, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 25 26
    m = schema.method(clsH, 'isHierarchical');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 31 33
    % 32 33
    m = schema.method(clsH, 'getDisplayLabel');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 38 39
    m = schema.method(clsH, 'getDisplayIcon');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 44 45
    m = schema.method(clsH, 'getPreferredProperties');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string vector'};
    % 50 51
    m = schema.method(clsH, 'exploreAction');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
    % 56 57
    m = schema.method(clsH, 'getChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
    % 62 63
    m = schema.method(clsH, 'getContextMenu');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle vector'};
    s.OutputTypes = {'handle'};
end % function
