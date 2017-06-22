function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    parentpackage = findpackage('dspdialog');
    parent = findclass(parentpackage, 'DSPDDG');
    % 10 11
    vipPackage = findpackage('vipdialog');
    this = schema.class(vipPackage, 'ToVideoDevice', parent);
    % 13 14
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 19 21
    % 20 21
    if isempty(findtype('VIPToVideoDeviceInputType'))
        schema.EnumType('VIPToVideoDeviceInputType', {'RGB','Intensity','Obsolete'});
    end % if
    if isempty(findtype('VIPToVideoDeviceImagePorts'))
        schema.EnumType('VIPToVideoDeviceImagePorts', {'One multidimensional signal','Separate color signals'});
    end % if
    if isempty(findtype('VIPToVideoDeviceOutputDevice'))
        schema.EnumType('VIPToVideoDeviceOutputDevice', {'On-screen video monitor'});
    end % if
    % 30 33
    % 31 33
    % 32 33
    schema.prop(this, 'inputType', 'VIPToVideoDeviceInputType');
    schema.prop(this, 'imagePorts', 'VIPToVideoDeviceImagePorts');
    schema.prop(this, 'fullScreen', 'bool');
    schema.prop(this, 'OutputDevice', 'VIPToVideoDeviceOutputDevice');
    schema.prop(this, 'videoWindowX', 'string');
    schema.prop(this, 'videoWindowY', 'string');
    schema.prop(this, 'videoWindowWidth', 'string');
    schema.prop(this, 'videoWindowHeight', 'string');
    schema.prop(this, 'saveWindowSize', 'bool');
end % function
