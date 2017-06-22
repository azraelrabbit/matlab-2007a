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
    this = schema.class(vipPackage, 'DrawShapes', parent);
    % 13 14
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 19 21
    % 20 21
    if isempty(findtype('VIPDrawShapesInType'))
        schema.EnumType('VIPDrawShapesInType', {'Intensity','RGB','Obsolete'});
    end % if
    if isempty(findtype('VIPDrawShapesShape'))
        schema.EnumType('VIPDrawShapesShape', {'Rectangles','Lines','Polygons','Circles'});
    end % if
    if isempty(findtype('VIPDrawShapesDispInt1'))
        schema.EnumType('VIPDrawShapesDispInt1', {'Black','White','User-specified value'});
    end % if
    if isempty(findtype('VIPDrawShapesViewPort'))
        schema.EnumType('VIPDrawShapesViewPort', {'Entire image','Specify region of interest via port'});
    end % if
    if isempty(findtype('VIPDrawShapesImagePorts'))
        schema.EnumType('VIPDrawShapesImagePorts', {'One multidimensional signal','Separate color signals'});
    end % if
    % 36 38
    % 37 38
    schema.prop(this, 'inType', 'VIPDrawShapesInType');
    schema.prop(this, 'imagePorts', 'VIPDrawShapesImagePorts');
    schema.prop(this, 'shape', 'VIPDrawShapesShape');
    schema.prop(this, 'fill', 'bool');
    schema.prop(this, 'display', 'VIPDrawShapesDispInt1');
    schema.prop(this, 'viewport', 'VIPDrawShapesViewPort');
    schema.prop(this, 'intensity', 'string');
    schema.prop(this, 'color', 'string');
    schema.prop(this, 'opacity', 'string');
    schema.prop(this, 'antialiasing', 'bool');
end % function
