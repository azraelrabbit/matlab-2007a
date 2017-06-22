function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    package = findpackage('dspdialog');
    parent = findclass(package, 'DSPDDG');
    this = schema.class(package, 'NCO', parent);
    % 10 12
    % 11 12
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 17 19
    % 18 19
    if isempty(findtype('DSPNCOSourceEnum'))
        schema.EnumType('DSPNCOSourceEnum', {'Specify via dialog','Input port'});
    end % if
    if isempty(findtype('DSPNCOFormulaEnum'))
        schema.EnumType('DSPNCOFormulaEnum', {'Sine','Cosine','Complex exponential','Sine and cosine'});
        % 24 25
    end % if
    if isempty(findtype('DSPNCOCompMethodEnum'))
        schema.EnumType('DSPNCOCompMethodEnum', {'Table lookup (no interpolation)'});
        % 28 29
    end % if
    if isempty(findtype('DSPNCODataTypeEnum'))
        schema.EnumType('DSPNCODataTypeEnum', {'double','single','Binary point scaling'});
        % 32 33
    end % if
    % 34 36
    % 35 36
    schema.prop(this, 'AccIncSrc', 'DSPNCOSourceEnum');
    schema.prop(this, 'AccInc', 'string');
    schema.prop(this, 'PhaseOffsetSrc', 'DSPNCOSourceEnum');
    schema.prop(this, 'PhaseOffset', 'string');
    schema.prop(this, 'AccumWL', 'string');
    schema.prop(this, 'Formula', 'DSPNCOFormulaEnum');
    schema.prop(this, 'HasPhaseQuantizer', 'bool');
    schema.prop(this, 'HasOutputPhaseError', 'bool');
    schema.prop(this, 'HasDither', 'bool');
    schema.prop(this, 'DitherWL', 'string');
    schema.prop(this, 'PNgeneratorLength', 'string');
    schema.prop(this, 'SampleTime', 'string');
    schema.prop(this, 'SamplesPerFrame', 'string');
    schema.prop(this, 'DataType', 'DSPNCODataTypeEnum');
    schema.prop(this, 'OutputWL', 'string');
    schema.prop(this, 'OutputFL', 'string');
    schema.prop(this, 'CompMethod', 'DSPNCOCompMethodEnum');
    schema.prop(this, 'TableDepth', 'string');
end % function
