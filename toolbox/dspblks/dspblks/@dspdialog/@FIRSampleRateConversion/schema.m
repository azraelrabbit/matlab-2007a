function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    package = findpackage('dspdialog');
    parent = findclass(package, 'DSPDDG');
    fixptPackage = findpackage('dspfixptddg');
    findclass(fixptPackage, 'FixptDialog');
    % 12 13
    this = schema.class(package, 'FIRSampleRateConversion', parent);
    % 14 16
    % 15 16
    schema.prop(this, 'FixptDialog', 'dspfixptddg.FixptDialog');
    % 17 19
    % 18 19
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 24 26
    % 25 26
    schema.prop(this, 'FilterSource', 'int');
    schema.prop(this, 'FilterObject', 'string');
    schema.prop(this, 'L', 'string');
    schema.prop(this, 'h', 'string');
    schema.prop(this, 'M', 'string');
end % function
