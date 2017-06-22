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
    this = schema.class(package, 'FIRDecimation', parent);
    % 14 15
    if isempty(findtype('DSPMultiRateFilterStructEnum'))
        schema.EnumType('DSPMultiRateFilterStructEnum', {'Direct form','Direct form transposed'});
        % 17 18
    end % if
    % 19 21
    % 20 21
    schema.prop(this, 'FixptDialog', 'dspfixptddg.FixptDialog');
    % 22 24
    % 23 24
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 29 31
    % 30 31
    schema.prop(this, 'FilterSource', 'int');
    schema.prop(this, 'FilterObject', 'string');
    schema.prop(this, 'h', 'string');
    schema.prop(this, 'factor', 'string');
    schema.prop(this, 'filtStruct', 'DSPMultiRateFilterStructEnum');
    schema.prop(this, 'framing', 'DSPFramingEnum');
    schema.prop(this, 'outputBufInitCond', 'string');
    schema.prop(this, 'BlockFactorVar', 'string');
    schema.prop(this, 'FactorPrompt', 'string');
end % function
