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
    package = findpackage('vipdialog');
    hThisClass = schema.class(package, 'ImageFromFile', parent);
    % 13 16
    % 14 16
    % 15 16
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 21 22
    m = schema.method(hThisClass, 'FileSelect');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {};
    % 27 29
    % 28 29
    if isempty(findtype('VIPImageDataTypeEnum'))
        schema.EnumType('VIPImageDataTypeEnum', {'double','single','int8','uint8','int16','uint16','int32','uint32','boolean','Fixed-point','User-defined','Inherit from input image','Inherit via back propagation'});
        % 31 44
        % 32 44
        % 33 44
        % 34 44
        % 35 44
        % 36 44
        % 37 44
        % 38 44
        % 39 44
        % 40 44
        % 41 44
        % 42 44
        % 43 44
    end % if
    % 45 46
    if isempty(findtype('VIPFractionLengthModeEnum'))
        schema.EnumType('VIPFractionLengthModeEnum', {'Best precision','User-defined'});
        % 48 50
        % 49 50
    end % if
    if isempty(findtype('VIPImagePorts'))
        schema.EnumType('VIPImagePorts', {'One multidimensional signal','Separate color signals'});
    end % if
    % 54 55
    schema.prop(hThisClass, 'FileName', 'string');
    schema.prop(hThisClass, 'Ts', 'string');
    schema.prop(hThisClass, 'OutPortLabels', 'string');
    schema.prop(hThisClass, 'ImageDataType', 'VIPImageDataTypeEnum');
    schema.prop(hThisClass, 'Signed', 'bool');
    schema.prop(hThisClass, 'WordLength', 'string');
    schema.prop(hThisClass, 'sdImageDataType', 'string');
    schema.prop(hThisClass, 'FractionLengthMode', 'VIPFractionLengthModeEnum');
    schema.prop(hThisClass, 'FractionLength', 'string');
    schema.prop(hThisClass, 'imagePorts', 'VIPImagePorts');
end % function
