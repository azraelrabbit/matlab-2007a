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
    % 10 11
    hThisClass = schema.class(package, 'FromMMFile', parent);
    % 12 14
    % 13 14
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 19 20
    m = schema.method(hThisClass, 'FileSelect');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {};
    % 25 27
    % 26 27
    if isempty(findtype('FromMMFileVideoDataTypeEnum'))
        schema.EnumType('FromMMFileVideoDataTypeEnum', {'double','single','int8','uint8','int16','uint16','int32','uint32','Inherit from file'});
        % 29 38
        % 30 38
        % 31 38
        % 32 38
        % 33 38
        % 34 38
        % 35 38
        % 36 38
        % 37 38
    end % if
    % 39 40
    if isempty(findtype('FromMMFileAudioDataTypeEnum'))
        schema.EnumType('FromMMFileAudioDataTypeEnum', {'double','single','int16','uint8'});
        % 42 46
        % 43 46
        % 44 46
        % 45 46
    end % if
    % 47 49
    % 48 49
    if isempty(findtype('FromMMFileVideoFormatEnum'))
        schema.EnumType('FromMMFileVideoFormatEnum', {'RGB','Intensity'});
        % 51 53
        % 52 53
    end % if
    % 54 55
    if isempty(findtype('FromMMFileOutputStreamsEnum'))
        schema.EnumType('FromMMFileOutputStreamsEnum', {'Video and audio','Video only','Audio only'});
        % 57 60
        % 58 60
        % 59 60
    end % if
    % 61 63
    % 62 63
    if isempty(findtype('FromMMFileVideoOutputEnum'))
        schema.EnumType('FromMMFileVideoOutputEnum', {'One multidimensional signal','Separate color signals'});
        % 65 67
        % 66 67
    end % if
    % 68 69
    schema.prop(hThisClass, 'inputFilename', 'string');
    schema.prop(hThisClass, 'loop', 'bool');
    schema.prop(hThisClass, 'numPlays', 'string');
    schema.prop(hThisClass, 'videoDataType', 'FromMMFileVideoDataTypeEnum');
    schema.prop(hThisClass, 'audioDataType', 'FromMMFileAudioDataTypeEnum');
    schema.prop(hThisClass, 'colorVideoFormat', 'FromMMFileVideoOutputEnum');
    schema.prop(hThisClass, 'inheritSampleTime', 'bool');
    schema.prop(hThisClass, 'userDefinedSampleTime', 'string');
    schema.prop(hThisClass, 'isIntensityVideo', 'FromMMFileVideoFormatEnum');
    schema.prop(hThisClass, 'outputEOF', 'bool');
    schema.prop(hThisClass, 'outputStreams', 'FromMMFileOutputStreamsEnum');
end % function
