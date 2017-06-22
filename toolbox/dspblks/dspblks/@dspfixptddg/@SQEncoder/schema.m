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
    this = schema.class(package, 'SQEncoder', parent);
    % 11 13
    % 12 13
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 18 19
    if isempty(findtype('DSPSQEncoderSourceEnum'))
        schema.EnumType('DSPSQEncoderSourceEnum', {'Specify via dialog','Input port'});
        % 21 23
        % 22 23
    end % if
    % 24 25
    if isempty(findtype('DSPSQEncoderPartitionEnum'))
        schema.EnumType('DSPSQEncoderPartitionEnum', {'Bounded','Unbounded'});
        % 27 29
        % 28 29
    end % if
    % 30 31
    if isempty(findtype('DSPSQEncoderSearchEnum'))
        schema.EnumType('DSPSQEncoderSearchEnum', {'Linear','Binary'});
        % 33 35
        % 34 35
    end % if
    % 36 37
    if isempty(findtype('DSPSQEncoderTieBreakEnum'))
        schema.EnumType('DSPSQEncoderTieBreakEnum', {'Choose the lower index','Choose the higher index'});
        % 39 41
        % 40 41
    end % if
    % 42 43
    if isempty(findtype('DSPSQEncoderInvalidInputEnum'))
        schema.EnumType('DSPSQEncoderInvalidInputEnum', {'Clip','Clip and warn','Error'});
        % 45 48
        % 46 48
        % 47 48
    end % if
    % 49 50
    if isempty(findtype('DSPSQEncoderIndexOutputEnum'))
        schema.EnumType('DSPSQEncoderIndexOutputEnum', {'int8','uint8','int16','uint16','int32','uint32'});
        % 52 58
        % 53 58
        % 54 58
        % 55 58
        % 56 58
        % 57 58
    end % if
    % 59 61
    % 60 61
    schema.prop(this, 'paramSrc', 'DSPSQEncoderSourceEnum');
    schema.prop(this, 'partType', 'DSPSQEncoderPartitionEnum');
    schema.prop(this, 'BBoundary', 'string');
    schema.prop(this, 'UBoundary', 'string');
    schema.prop(this, 'SearchMethod', 'DSPSQEncoderSearchEnum');
    schema.prop(this, 'tieBreakRule', 'DSPSQEncoderTieBreakEnum');
    schema.prop(this, 'outQU', 'bool');
    schema.prop(this, 'outQError', 'bool');
    schema.prop(this, 'codebook', 'string');
    schema.prop(this, 'outStatus', 'bool');
    schema.prop(this, 'invalidin', 'DSPSQEncoderInvalidInputEnum');
    schema.prop(this, 'idtype', 'DSPSQEncoderIndexOutputEnum');
end % function
