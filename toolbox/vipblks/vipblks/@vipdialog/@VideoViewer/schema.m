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
    hThisClass = schema.class(package, 'VideoViewer', parent);
    % 13 15
    % 14 15
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 20 22
    % 21 22
    if isempty(findtype('VideoViewerInputTypeEnum'))
        schema.EnumType('VideoViewerInputTypeEnum', {'RGB','Intensity','Obsolete'});
        % 24 27
        % 25 27
        % 26 27
    end % if
    % 28 30
    % 29 30
    if isempty(findtype('VideoViewerImagePortsEnum'))
        schema.EnumType('VideoViewerImagePortsEnum', {'One multidimensional signal','Separate color signals'});
        % 32 34
        % 33 34
    end % if
    % 35 36
    schema.prop(hThisClass, 'inputType', 'VideoViewerInputTypeEnum');
    schema.prop(hThisClass, 'imagePorts', 'VideoViewerImagePortsEnum');
    schema.prop(hThisClass, 'useColorMap', 'bool');
    schema.prop(hThisClass, 'colormapValue', 'string');
    schema.prop(hThisClass, 'specRange', 'bool');
    schema.prop(hThisClass, 'minInputVal', 'string');
    schema.prop(hThisClass, 'maxInputVal', 'string');
    schema.prop(hThisClass, 'FigPos', 'string');
    schema.prop(hThisClass, 'AxisZoom', 'bool');
    schema.prop(hThisClass, 'trueSizedOnce', 'bool');
end % function
