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
    this = schema.class(vipPackage, 'DrawMarkers', parent);
    % 13 14
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 19 21
    % 20 21
    if isempty(findtype('VIPDrawMarkersInType'))
        schema.EnumType('VIPDrawMarkersInType', {'Intensity','RGB','Obsolete'});
    end % if
    if isempty(findtype('VIPDrawMarkersShape'))
        schema.EnumType('VIPDrawMarkersShape', {'Circle','X-mark','Plus','Star','Square'});
    end % if
    if isempty(findtype('VIPDrawMarkersDispInt'))
        schema.EnumType('VIPDrawMarkersDispInt', {'Black','White','User-specified value'});
    end % if
    if isempty(findtype('VIPDrawMarkersViewPort'))
        schema.EnumType('VIPDrawMarkersViewPort', {'Entire image','Specify region of interest via port'});
    end % if
    if isempty(findtype('VIPDrawMarkersImagePorts'))
        schema.EnumType('VIPDrawMarkersImagePorts', {'One multidimensional signal','Separate color signals'});
    end % if
    % 36 38
    % 37 38
    schema.prop(this, 'inType', 'VIPDrawMarkersInType');
    schema.prop(this, 'imagePorts', 'VIPDrawMarkersImagePorts');
    schema.prop(this, 'shape', 'VIPDrawMarkersShape');
    schema.prop(this, 'size', 'string');
    schema.prop(this, 'fill', 'bool');
    schema.prop(this, 'display', 'VIPDrawMarkersDispInt');
    schema.prop(this, 'viewport', 'VIPDrawMarkersViewPort');
    schema.prop(this, 'intensity', 'string');
    schema.prop(this, 'color', 'string');
    schema.prop(this, 'opacity', 'string');
    schema.prop(this, 'antialiasing', 'bool');
end % function
