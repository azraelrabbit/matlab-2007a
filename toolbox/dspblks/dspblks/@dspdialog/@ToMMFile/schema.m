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
    hThisClass = schema.class(package, 'ToMMFile', parent);
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
    if isempty(findtype('ToMMFileWriteStreamsEnum'))
        schema.EnumType('ToMMFileWriteStreamsEnum', {'Video and audio','Video only','Audio only'});
        % 29 32
        % 30 32
        % 31 32
    end % if
    % 33 34
    if isempty(findtype('ToMMFileVideoCompressorsEnum'))
        schema.EnumType('ToMMFileVideoCompressorsEnum', dspwin32getcompressornames('video'));
    end % if
    if isempty(findtype('ToMMFileAudioCompressorsEnum'))
        schema.EnumType('ToMMFileAudioCompressorsEnum', dspwin32getcompressornames('audio'));
    end % if
    if isempty(findtype('VIPToVideoDeviceImagePorts'))
        schema.EnumType('VIPToVideoDeviceImagePorts', {'One multidimensional signal','Separate color signals'});
    end % if
    schema.prop(hThisClass, 'outputFilename', 'string');
    schema.prop(hThisClass, 'streamSelection', 'ToMMFileWriteStreamsEnum');
    schema.prop(hThisClass, 'videoCompressor', 'ToMMFileVideoCompressorsEnum');
    schema.prop(hThisClass, 'audioCompressor', 'ToMMFileAudioCompressorsEnum');
    schema.prop(hThisClass, 'imagePorts', 'VIPToVideoDeviceImagePorts');
end % function
