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
    this = schema.class(package, 'VQEncoder', parent);
    % 11 13
    % 12 13
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 18 19
    if isempty(findtype('DSPVQEncoderSourceEnum'))
        schema.EnumType('DSPVQEncoderSourceEnum', {'Specify via dialog','Input port'});
        % 21 23
        % 22 23
    end % if
    % 24 25
    if isempty(findtype('DSPVQEncoderDistortionEnum'))
        schema.EnumType('DSPVQEncoderDistortionEnum', {'Squared error','Weighted squared error'});
        % 27 29
        % 28 29
    end % if
    % 30 31
    if isempty(findtype('DSPVQEncoderTieBreakEnum'))
        schema.EnumType('DSPVQEncoderTieBreakEnum', {'Choose the lower index','Choose the higher index'});
        % 33 35
        % 34 35
    end % if
    % 36 37
    if isempty(findtype('DSPVQEncoderIndexOutputEnum'))
        schema.EnumType('DSPVQEncoderIndexOutputEnum', {'int8','uint8','int16','uint16','int32','uint32'});
        % 39 45
        % 40 45
        % 41 45
        % 42 45
        % 43 45
        % 44 45
    end % if
    % 46 48
    % 47 48
    schema.prop(this, 'CBsource', 'DSPVQEncoderSourceEnum');
    schema.prop(this, 'codebook', 'string');
    schema.prop(this, 'distMeasure', 'DSPVQEncoderDistortionEnum');
    schema.prop(this, 'wgtSrc', 'DSPVQEncoderSourceEnum');
    schema.prop(this, 'weights', 'string');
    schema.prop(this, 'tieBreakRule', 'DSPVQEncoderTieBreakEnum');
    schema.prop(this, 'outQU', 'bool');
    schema.prop(this, 'outQError', 'bool');
    schema.prop(this, 'idtype', 'DSPVQEncoderIndexOutputEnum');
end % function
