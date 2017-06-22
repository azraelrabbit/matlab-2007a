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
    this = schema.class(package, 'Levinson', parent);
    % 11 13
    % 12 13
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 18 20
    % 19 20
    m = schema.method(this, 'getParamsFromSignalName');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 25 27
    % 26 27
    m = schema.method(this, 'instrumentThisParam');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string','string'};
    s.OutputTypes = {'mxArray'};
    % 32 33
    if isempty(findtype('DSPLevinsonOutputTypeEnum'))
        schema.EnumType('DSPLevinsonOutputTypeEnum', {'A and K','A','K'});
    end % if
    % 36 38
    % 37 38
    schema.prop(this, 'coeffOutFcn', 'DSPLevinsonOutputTypeEnum');
    schema.prop(this, 'outP', 'bool');
    schema.prop(this, 'zeroInpHandling', 'bool');
end % function
