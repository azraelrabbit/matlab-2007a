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
    hThisClass = schema.class(package, 'WriteAVIFile', parent);
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
    if isempty(findtype('WriteAVIFileInputTypeEnum'))
        schema.EnumType('WriteAVIFileInputTypeEnum', {'RGB','Intensity','Obsolete'});
        % 31 34
        % 32 34
        % 33 34
    end % if
    % 35 37
    % 36 37
    if isempty(findtype('WriteAVIFileImagePortsEnum'))
        schema.EnumType('WriteAVIFileImagePortsEnum', {'One multidimensional signal','Separate color signals'});
        % 39 41
        % 40 41
    end % if
    % 42 43
    schema.prop(hThisClass, 'filename', 'string');
    schema.prop(hThisClass, 'inputType', 'WriteAVIFileInputTypeEnum');
    schema.prop(hThisClass, 'imagePorts', 'WriteAVIFileImagePortsEnum');
end % function
