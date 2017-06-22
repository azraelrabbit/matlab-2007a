function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    package = findpackage('dspfixptddg');
    parent = findclass(package, 'DSPDDGBase');
    this = schema.class(package, 'Window', parent);
    % 12 14
    % 13 14
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 19 21
    % 20 21
    if isempty(findtype('DSPWindowModeEnum'))
        schema.EnumType('DSPWindowModeEnum', {'Apply window to input','Generate window','Generate and apply window'});
        % 23 26
        % 24 26
        % 25 26
    end % if
    if isempty(findtype('DSPWindowTypeEnum'))
        schema.EnumType('DSPWindowTypeEnum', {'Bartlett','Blackman','Boxcar','Chebyshev','Hamming','Hann','Hanning','Kaiser','Taylor','Triang','User defined'});
        % 29 40
        % 30 40
        % 31 40
        % 32 40
        % 33 40
        % 34 40
        % 35 40
        % 36 40
        % 37 40
        % 38 40
        % 39 40
    end % if
    if isempty(findtype('DSPWindowSamplingModeEnum'))
        schema.EnumType('DSPWindowSamplingModeEnum', {'Symmetric','Periodic'});
        % 43 45
        % 44 45
    end % if
    % 46 47
    if isempty(findtype('DSPWindowSourceDataTypeEnum'))
        schema.EnumType('DSPWindowSourceDataTypeEnum', {'double','single','Fixed-point','User-defined','Inherit via back propagation'});
        % 49 54
        % 50 54
        % 51 54
        % 52 54
        % 53 54
    end % if
    % 55 57
    % 56 57
    schema.prop(this, 'winmode', 'DSPWindowModeEnum');
    schema.prop(this, 'wintype', 'DSPWindowTypeEnum');
    schema.prop(this, 'sampmode', 'DSPSampleModeEnum');
    schema.prop(this, 'samptime', 'string');
    schema.prop(this, 'N', 'string');
    schema.prop(this, 'Rs', 'string');
    schema.prop(this, 'beta', 'string');
    schema.prop(this, 'numSidelobes', 'string');
    schema.prop(this, 'sidelobeLevel', 'string');
    schema.prop(this, 'winsamp', 'DSPWindowSamplingModeEnum');
    schema.prop(this, 'UserWindow', 'string');
    schema.prop(this, 'OptParams', 'bool');
    schema.prop(this, 'UserParams', 'string');
    % 70 72
    % 71 72
    schema.prop(this, 'dataType', 'DSPWindowSourceDataTypeEnum');
    schema.prop(this, 'isSigned', 'bool');
    schema.prop(this, 'wordLen', 'string');
    schema.prop(this, 'udDataType', 'string');
    schema.prop(this, 'fracBitsMode', 'DSPSourceFracBitsModeEnum');
    schema.prop(this, 'numFracBits', 'string');
end % function
