function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pkg = findpackage('RptgenML');
    pkgRG = findpackage('rptgen');
    % 11 12
    clsH = schema.class(pkg, 'StylesheetElement', pkgRG.findclass('DAObject'));
    % 13 16
    % 14 16
    % 15 16
    p = rptgen.prop(clsH, 'JavaHandle', 'MATLAB array');
    p.AccessFlags.Copy = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.Visible = 'off';
    p.setFunction = @loc_setJavaHandle;
    % 21 22
    p = rptgen.prop(clsH, 'Value', 'string');
    p.Description = xlate('Value');
    p.AccessFlags.Copy = 'off';
    p.AccessFlags.Init = 'off';
    p.AccessFlags.AbortSet = 'off';
    p.getFunction = @getValue;
    p.setFunction = @setValue;
    % 29 30
    p = rptgen.prop(clsH, 'ValueInvalid', 'string');
    % 31 33
    % 32 33
    p.AccessFlags.Serialize = 'off';
    p.Visible = 'off';
    % 35 36
    p = rptgen.prop(clsH, 'DescriptionShort', 'java.lang.String');
    % 37 38
    p.Visible = 'off';
    % 39 40
    p = rptgen.prop(clsH, 'DescriptionLong', 'java.lang.String');
    % 41 42
    p.Visible = 'off';
    % 43 44
    p = rptgen.prop(clsH, 'DataType', 'java.lang.String');
    % 45 46
    p.Visible = 'off';
    % 47 49
    % 48 49
    m = schema.method(clsH, 'exploreAction');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
    % 54 55
    m = schema.method(clsH, 'areChildrenOrdered');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 60 61
    m = schema.method(clsH, 'isHierarchical');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 66 67
    m = schema.method(clsH, 'getChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
    % 72 73
    m = schema.method(clsH, 'getHierarchicalChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
    % 78 79
    m = schema.method(clsH, 'getDisplayLabel');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 84 85
    m = schema.method(clsH, 'getDisplayIcon');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 90 91
    m = schema.method(clsH, 'getPreferredProperties');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string vector'};
    % 96 97
    m = schema.method(clsH, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 102 104
    % 103 104
    m = schema.method(clsH, 'canAcceptDrop');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle vector'};
    s.OutputTypes = {'bool'};
    % 109 110
    m = schema.method(clsH, 'acceptDrop');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle vector'};
    s.OutputTypes = {'bool'};
    % 115 116
    m = schema.method(clsH, 'getContextMenu');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle vector'};
    s.OutputTypes = {'handle'};
end % function
function storedValue = loc_setJavaHandle(this, proposedValue)
    % 123 135
    % 124 135
    % 125 135
    % 126 135
    % 127 135
    % 128 135
    % 129 135
    % 130 135
    % 131 135
    % 132 135
    % 133 135
    % 134 135
    storedValue = this.setJavaHandle(proposedValue);
end % function
function returnedValue = getValue(this, storedValue)
    % 138 140
    % 139 140
    returnedValue = ut_getValue(this, storedValue);
end % function
function storedValue = setValue(this, proposedValue)
    % 143 146
    % 144 146
    % 145 146
    storedValue = ut_setValue(this, proposedValue);
end % function
