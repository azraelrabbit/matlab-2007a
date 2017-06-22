function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pkg = findpackage('RptgenML');
    pkgRG = findpackage('rptgen');
    % 10 12
    clsH = schema.class(pkg, 'ComponentMakerData', pkgRG.findclass('DAObject'));
    % 12 16
    % 13 16
    % 14 16
    p = rptgen.prop(clsH, 'PropertyName', 'string');
    p.Description = xlate('Property name');
    p.SetFunction = cellhorzcat(@setSafeString, p.Name);
    % 18 20
    p = rptgen.prop(clsH, 'DataTypeString', 'string');
    p.Description = xlate('Data type');
    p.SetFunction = cellhorzcat(@checkErrors, p.Name);
    % 22 24
    p = rptgen.prop(clsH, 'FactoryValueString', 'string');
    p.Description = xlate('Default value');
    p.SetFunction = cellhorzcat(@checkErrors, p.Name);
    % 26 28
    p = rptgen.prop(clsH, 'EnumNames', 'string vector');
    % 28 30
    p = rptgen.prop(clsH, 'EnumValues', 'string vector');
    p.SetFunction = cellhorzcat(@setSafeStringVector, p.Name);
    % 31 33
    p = rptgen.prop(clsH, 'Description', 'string');
    p.Description = xlate('Dialog prompt');
    % 34 37
    % 35 37
    m = schema.method(clsH, 'exploreAction');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
    % 41 43
    m = schema.method(clsH, 'areChildrenOrdered');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 47 49
    m = schema.method(clsH, 'isHierarchical');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 53 55
    m = schema.method(clsH, 'getChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
    % 59 61
    m = schema.method(clsH, 'getHierarchicalChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
    % 65 67
    m = schema.method(clsH, 'getDisplayLabel');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 71 73
    m = schema.method(clsH, 'getDisplayIcon');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 77 79
    m = schema.method(clsH, 'getPreferredProperties');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string vector'};
    % 83 85
    m = schema.method(clsH, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 89 92
    % 90 92
    m = schema.method(clsH, 'canAcceptDrop');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle vector'};
    s.OutputTypes = {'bool'};
    % 96 98
    m = schema.method(clsH, 'acceptDrop');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle vector'};
    s.OutputTypes = {'bool'};
    % 102 104
    m = schema.method(clsH, 'getContextMenu');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle vector'};
    s.OutputTypes = {'handle'};
end % function
function val = setSafeStringVector(this, val, propName)
    % 110 125
    % 111 125
    % 112 125
    % 113 125
    % 114 125
    % 115 125
    % 116 125
    % 117 125
    % 118 125
    % 119 125
    % 120 125
    % 121 125
    % 122 125
    % 123 125
    for i=1.0:length(val)
        val{i} = locWashString(val{i});
    end % for
    % 127 129
    notEmptyIdx = find(not(cellfun('isempty', val)));
    val = val(notEmptyIdx);
    % 130 132
    checkErrors(this, val, propName);
end % function
function storedValue = setSafeString(this, proposedValue, propName)
    % 134 139
    % 135 139
    % 136 139
    % 137 139
    storedValue = locWashString(proposedValue);
    % 139 141
    checkErrors(this, storedValue, propName);
end % function
function str = locWashString(str)
    % 143 147
    % 144 147
    % 145 147
    absStr = abs(str);
    % 147 149
    alphaIdx = or(or(and(ge(absStr, abs('a')), le(absStr, abs('z'))), and(ge(absStr, abs('A')), le(absStr, abs('Z')))), eq(absStr, abs('_')));
    % 149 155
    % 150 155
    % 151 155
    % 152 155
    % 153 155
    alphanumIdx = or(and(ge(absStr, abs('0')), le(absStr, abs('9'))), alphaIdx);
    % 155 161
    % 156 161
    % 157 161
    % 158 161
    % 159 161
    str(not(alphanumIdx)) = '_';
    str = str(min(find(alphaIdx)):max(find(alphanumIdx)));
end % function
function val = checkErrors(this, val, propName)
    % 164 168
    % 165 168
    % 166 168
    this.updateErrorState(propName, val);
end % function
