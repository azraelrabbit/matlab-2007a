function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    package = findpackage('dspdialog');
    parent = findclass(package, 'DSPDDG');
    fixptPackage = findpackage('dspfixptddg');
    findclass(fixptPackage, 'FixptDialog');
    % 13 14
    this = schema.class(package, 'FIRInterpolation', parent);
    % 15 17
    % 16 17
    schema.prop(this, 'FixptDialog', 'dspfixptddg.FixptDialog');
    % 18 20
    % 19 20
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 25 27
    % 26 27
    schema.prop(this, 'FilterSource', 'int');
    schema.prop(this, 'FilterObject', 'string');
    schema.prop(this, 'h', 'string');
    schema.prop(this, 'factor', 'string');
    schema.prop(this, 'framing', 'DSPFramingEnum');
    schema.prop(this, 'outputBufInitCond', 'string');
    schema.prop(this, 'BlockFactorVar', 'string');
    schema.prop(this, 'FactorPrompt', 'string');
end % function
