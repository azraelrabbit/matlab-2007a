function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pkg = findpackage('dspfixptddg');
    % 9 10
    findclass(pkg, 'DSPWidgetWrapper');
    findclass(pkg, 'DataTypeRow');
    dspdialogPackage = findpackage('dspdialog');
    findclass(dspdialogPackage, 'DSPDDG');
    % 14 15
    this = schema.class(pkg, 'FixptDialog');
    % 16 18
    % 17 18
    schema.prop(this, 'roundingMode', 'DSPRoundingModeEnum');
    schema.prop(this, 'overflowMode', 'DSPOverflowModeEnum');
    schema.prop(this, 'ExtraOp', 'dspfixptddg.DSPWidgetWrapper vector');
    schema.prop(this, 'TotalOpRows', 'int');
    schema.prop(this, 'TotalDataTypeRows', 'int');
    schema.prop(this, 'LockScale', 'bool');
    % 24 25
    schema.prop(this, 'hasLockScale', 'bool');
    % 26 29
    % 27 29
    % 28 29
    schema.prop(this, 'Block', 'handle');
    % 30 31
    schema.prop(this, 'DataTypeRows', 'dspfixptddg.DataTypeRow vector');
    % 32 33
    schema.prop(this, 'Controller', 'dspdialog.DSPDDG');
end % function
