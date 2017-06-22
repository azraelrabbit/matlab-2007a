function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pkg = findpackage('RptgenML');
    pkgRG = findpackage('rptgen');
    % 9 11
    clsH = schema.class(pkg, 'ComponentMaker', pkgRG.findclass('DAObject'));
    % 11 15
    % 12 15
    % 13 15
    p = rptgen.prop(clsH, 'PkgName', 'String', 'RptgenCustom', xlate('Package directory'));
    % 15 17
    p.SetFunction = cellhorzcat(@setSafeString, p.Name);
    % 17 19
    p = rptgen.prop(clsH, 'PkgDir', 'String', getenv('HOME'), xlate('Parent directory'));
    % 19 22
    % 20 22
    p = rptgen.prop(clsH, 'ClassName', 'String', 'CUserDefined', xlate('Class directory'));
    % 22 24
    p.SetFunction = cellhorzcat(@setSafeString, p.Name);
    % 24 26
    p = rptgen.prop(clsH, 'ClassDir', 'String');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.Visible = 'off';
    % 29 31
    p = rptgen.prop(clsH, 'DisplayName', 'String', xlate('New Component'), xlate('Display name'));
    % 31 34
    % 32 34
    p = rptgen.prop(clsH, 'Description', 'String', '', xlate('Description'));
    % 34 42
    % 35 42
    % 36 42
    % 37 42
    % 38 42
    % 39 42
    % 40 42
    p = rptgen.prop(clsH, 'Type', 'String', xlate('Custom Components'), xlate('Category name'));
    % 42 45
    % 43 45
    p = rptgen.prop(clsH, 'Parentable', 'bool', false, xlate('Component may contain children'));
    % 45 48
    % 46 48
    p = rptgen.prop(clsH, 'v1ExecuteFile', 'String');
    p.Visible = 'off';
    % 49 51
    p = rptgen.prop(clsH, 'v1OutlinestringFile', 'String');
    p.Visible = 'off';
    % 52 54
    p = rptgen.prop(clsH, 'v1ClassName', 'String');
    p.Visible = 'off';
    % 55 57
    p = rptgen.prop(clsH, 'isWriteHeader', 'bool', false, xlate('Write MATHWORKS standard file header'));
    % 57 59
    p.Visible = 'off';
    % 59 61
    p = rptgen.prop(clsH, 'ViewFiles', 'int32', 1.0);
    p.Visible = 'off';
    % 62 65
    % 63 65
    p = rptgen.prop(clsH, 'Safe', 'bool', true, '', 2.0);
    % 65 67
    p = rptgen.prop(clsH, 'TypeHelpFile', 'String', '', '', 2.0);
    % 67 69
    p = rptgen.prop(clsH, 'DlgCurrentPropertyIdx', 'int32', 0.0, '', 2.0);
    % 69 81
    % 70 81
    % 71 81
    % 72 81
    % 73 81
    % 74 81
    % 75 81
    % 76 81
    % 77 81
    % 78 81
    % 79 81
    m = schema.method(clsH, 'areChildrenOrdered');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 85 87
    m = schema.method(clsH, 'isHierarchical');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 91 93
    m = schema.method(clsH, 'getChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
    % 97 99
    m = schema.method(clsH, 'getHierarchicalChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
    % 103 105
    m = schema.method(clsH, 'getDisplayLabel');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 109 111
    m = schema.method(clsH, 'getDisplayIcon');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 115 117
    m = schema.method(clsH, 'getPreferredProperties');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string vector'};
    % 121 123
    m = schema.method(clsH, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 127 130
    % 128 130
    m = schema.method(clsH, 'canAcceptDrop');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle vector'};
    s.OutputTypes = {'bool'};
    % 134 136
    m = schema.method(clsH, 'acceptDrop');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle vector'};
    s.OutputTypes = {'bool'};
    % 140 142
    m = schema.method(clsH, 'getContextMenu');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle vector'};
    s.OutputTypes = {'handle'};
end % function
function proposedValue = setSafeString(this, proposedValue, propName)
    % 148 163
    % 149 163
    % 150 163
    % 151 163
    % 152 163
    % 153 163
    % 154 163
    % 155 163
    % 156 163
    % 157 163
    % 158 163
    % 159 163
    % 160 163
    % 161 163
    absStr = abs(proposedValue);
    % 163 166
    % 164 166
    alphaIdx = or(and(ge(absStr, abs('a')), le(absStr, abs('z'))), and(ge(absStr, abs('A')), le(absStr, abs('Z'))));
    % 166 172
    % 167 172
    % 168 172
    % 169 172
    % 170 172
    alphanumIdx = or(or(and(ge(absStr, abs('0')), le(absStr, abs('9'))), alphaIdx), eq(absStr, abs('_')));
    % 172 180
    % 173 180
    % 174 180
    % 175 180
    % 176 180
    % 177 180
    % 178 180
    proposedValue(not(alphanumIdx)) = '_';
    % 180 183
    % 181 183
    proposedValue = proposedValue(min(find(alphaIdx)):max(find(alphanumIdx)));
    % 183 186
    % 184 186
    this.updateErrorState(propName, proposedValue);
end % function
