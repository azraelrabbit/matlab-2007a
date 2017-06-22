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
    hThisClass = schema.class(package, 'ReadAVIFile', parent);
    % 13 15
    % 14 15
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 20 21
    m = schema.method(hThisClass, 'FileSelect');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {};
    % 26 28
    % 27 28
    if isempty(findtype('ReadAVIFileDataTypeEnum'))
        schema.EnumType('ReadAVIFileDataTypeEnum', {'double','single','int8','uint8','int16','uint16','int32','uint32','Inherit from file'});
        % 30 39
        % 31 39
        % 32 39
        % 33 39
        % 34 39
        % 35 39
        % 36 39
        % 37 39
        % 38 39
    end % if
    % 40 41
    schema.prop(hThisClass, 'filename', 'string');
    schema.prop(hThisClass, 'loopOrNot', 'bool');
    schema.prop(hThisClass, 'numLoops', 'string');
    schema.prop(hThisClass, 'dataType', 'ReadAVIFileDataTypeEnum');
    schema.prop(hThisClass, 'outputEOF', 'bool');
end % function
