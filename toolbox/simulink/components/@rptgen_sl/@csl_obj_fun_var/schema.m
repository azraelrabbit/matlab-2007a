function schema
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    pkg = findpackage('rptgen_sl');
    pkgRG = findpackage('rptgen');
    % 11 13
    h = schema.class(pkg, 'csl_obj_fun_var', pkgRG.findclass('rptcomponent'));
    % 13 15
    lic = 'SIMULINK_Report_Gen';
    % 15 24
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    p = rptgen.prop(h, 'isShowParentBlock', 'bool', true, xlate('Parent block'), lic);
    % 24 26
    p.Visible = 'off';
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.Copy = 'off';
    p.AccessFlags.Init = 'off';
    p.AccessFlags.AbortSet = 'off';
    p.GetFunction = cellhorzcat(@getMulti, 'FunctionTableParentBlock', 'VariableTableParentBlock');
    p.SetFunction = cellhorzcat(@setMulti, 'FunctionTableParentBlock', 'VariableTableParentBlock');
    % 32 38
    % 33 38
    % 34 38
    % 35 38
    % 36 38
    p = rptgen.prop(h, 'isShowCallingString', 'bool', true, xlate('Calling string'), lic);
    % 38 40
    p.Visible = 'off';
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.Copy = 'off';
    p.AccessFlags.Init = 'off';
    p.AccessFlags.AbortSet = 'off';
    p.GetFunction = cellhorzcat(@getMulti, 'FunctionTableCallingString', 'VariableTableCallingString');
    p.SetFunction = cellhorzcat(@setMulti, 'FunctionTableCallingString', 'VariableTableCallingString');
    % 46 50
    % 47 50
    % 48 50
    p = rptgen.prop(h, 'isBorder', 'bool', true, xlate('Display table border'), lic);
    % 50 52
    p.Visible = 'off';
    % 52 58
    % 53 58
    % 54 58
    % 55 58
    % 56 58
    p = rptgen.prop(h, 'isFunctionTable', 'bool', true, xlate('Include table of functions'), lic);
    % 58 62
    % 59 62
    % 60 62
    p = rptgen.prop(h, 'FunctionTableTitle', rptgen.makeStringType, xlate('List of Functions'), '', lic);
    % 62 67
    % 63 67
    % 64 67
    % 65 67
    p = rptgen.prop(h, 'FunctionTableTitleType', rptgen.enumAutoManual, 'auto', xlate('Table Title'), lic);
    % 67 71
    % 68 71
    % 69 71
    p = rptgen.prop(h, 'FunctionTableParentBlock', 'bool', true, xlate('Parent block'), lic);
    % 71 75
    % 72 75
    % 73 75
    p = rptgen.prop(h, 'FunctionTableCallingString', 'bool', true, xlate('Calling string'), lic);
    % 75 79
    % 76 79
    % 77 79
    p = rptgen.prop(h, 'ShowFixptFunctions', 'bool', false, xlate('Include fixed point functions (sfix,ufix,sint,...)'), lic);
    % 79 87
    % 80 87
    % 81 87
    % 82 87
    % 83 87
    % 84 87
    % 85 87
    p = rptgen.prop(h, 'isVariableTable', 'bool', true, xlate('Include table of variables'), lic);
    % 87 91
    % 88 91
    % 89 91
    p = rptgen.prop(h, 'VariableTableTitleType', rptgen.enumAutoManual, 'auto', xlate('Table title'), lic);
    % 91 95
    % 92 95
    % 93 95
    p = rptgen.prop(h, 'VariableTableTitle', rptgen.makeStringType, xlate('List of Variables'), '', lic);
    % 95 99
    % 96 99
    % 97 99
    p = rptgen.prop(h, 'VariableTableParentBlock', 'bool', true, xlate('Parent block'), lic);
    % 99 103
    % 100 103
    % 101 103
    p = rptgen.prop(h, 'VariableTableCallingString', 'bool', true, xlate('Calling string'), lic);
    % 103 107
    % 104 107
    % 105 107
    p = rptgen.prop(h, 'isWorkspaceIO', 'bool', false, xlate('Include Workspace I/O parameters'), lic);
    % 107 111
    % 108 111
    % 109 111
    p = rptgen.prop(h, 'isShowVariableSize', 'bool', false, xlate('Size of variable'), lic);
    % 111 115
    % 112 115
    % 113 115
    p = rptgen.prop(h, 'isShowVariableMemory', 'bool', false, xlate('Memory size'), lic);
    % 115 119
    % 116 119
    % 117 119
    p = rptgen.prop(h, 'isShowVariableClass', 'bool', false, xlate('Class of variable'), lic);
    % 119 123
    % 120 123
    % 121 123
    p = rptgen.prop(h, 'isShowVariableValue', 'bool', true, xlate('Value in workspace'), lic);
    % 123 127
    % 124 127
    % 125 127
    p = rptgen.prop(h, 'isShowTunableProps', 'bool', false, xlate('RTW storage class'), lic);
    % 127 131
    % 128 131
    % 129 131
    p = rptgen.prop(h, 'ParameterProps', 'string vector', {}, xlate('Data object properties'), lic);
    % 131 136
    % 132 136
    % 133 136
    % 134 136
    rptgen.makeStaticMethods(h, {}, {'makeFunctionList';'makeFunctionTable';'makeVariableList';'makeVariableTable';'makeWordList'});
    % 136 143
    % 137 143
    % 138 143
    % 139 143
    % 140 143
    % 141 143
end
function returnedValue = getMulti(this, storedValue, prop1, prop2)
    % 144 149
    % 145 149
    % 146 149
    % 147 149
    returnedValue = get(this, prop1) || get(this, prop2);
end
function valueStored = setMulti(this, proposedValue, prop1, prop2)
    % 151 155
    % 152 155
    % 153 155
    set(this, prop1, proposedValue, prop2, proposedValue);
    % 155 157
    valueStored = proposedValue;
end
