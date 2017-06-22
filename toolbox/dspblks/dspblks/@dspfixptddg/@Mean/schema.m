function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    package = findpackage('dspfixptddg');
    parent = findclass(package, 'DSPDDGBase');
    this = schema.class(package, 'Mean', parent);
    % 11 12
    fixptClass = findpackage('dspfixptddg');
    findclass(fixptClass, 'FixptDialog');
    % 14 16
    % 15 16
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 21 23
    % 22 23
    schema.prop(this, 'run', 'bool');
    schema.prop(this, 'reset_popup', 'DSPResetPortEnum');
end % function
