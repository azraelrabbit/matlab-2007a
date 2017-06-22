function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    dspPackage = findpackage('dspfixptddg');
    vipPackage = findpackage('vipfixptddg');
    parent = findclass(dspPackage, 'DSPDDGBase');
    this = schema.class(vipPackage, 'Projective', parent);
    % 12 13
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 18 20
    % 19 20
    m = schema.method(this, 'getFixptModeandWLParams');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'mxArray'};
    % 25 27
    % 26 27
    m = schema.method(this, 'getParamsFromSignalName');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 32 34
    % 33 34
    m = schema.method(this, 'instrumentThisParam');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string','string'};
    s.OutputTypes = {'mxArray'};
    % 39 41
    % 40 41
    if isempty(findtype('VIPProjectiveInType'))
        schema.EnumType('VIPProjectiveInType', {'Intensity','RGB','Obsolete'});
    end % if
    if isempty(findtype('VIPProjectiveMode'))
        schema.EnumType('VIPProjectiveMode', {'Rectangle to quadrilateral','Quadrilateral to rectangle','Quadrilateral to quadrilateral'});
    end % if
    if isempty(findtype('VIPProjectiveInVerticesSource'))
        schema.EnumType('VIPProjectiveInVerticesSource', {'Specify via dialog','Input port'});
    end % if
    if isempty(findtype('VIPProjectiveOutVerticesSource'))
        schema.EnumType('VIPProjectiveOutVerticesSource', {'Specify via dialog','Input port'});
    end % if
    if isempty(findtype('VIPProjectiveRectSizeSource'))
        schema.EnumType('VIPProjectiveRectSizeSource', {'Specify via dialog','Input port'});
    end % if
    if isempty(findtype('VIPProjectiveInRectsize'))
        schema.EnumType('VIPProjectiveInRectsize', {'Full image','User-defined'});
    end % if
    if isempty(findtype('VIPProjectiveInPtsInvalid'))
        schema.EnumType('VIPProjectiveInPtsInvalid', {'Clip','Clip and warn','Error'});
    end % if
    if isempty(findtype('VIPProjectiveOutsize'))
        schema.EnumType('VIPProjectiveOutsize', {'Full','User-defined'});
    end % if
    if isempty(findtype('VIPProjectiveMethod'))
        schema.EnumType('VIPProjectiveMethod', {'Exact solution','Quadratic approximation'});
    end % if
    if isempty(findtype('VIPProjectiveInterp'))
        schema.EnumType('VIPProjectiveInterp', {'Nearest neighbor','Bilinear','Bicubic'});
    end % if
    if isempty(findtype('VIPProjectiveImagePorts'))
        schema.EnumType('VIPProjectiveImagePorts', {'One multidimensional signal','Separate color signals'});
    end % if
    % 74 76
    % 75 76
    schema.prop(this, 'inType', 'VIPProjectiveInType');
    schema.prop(this, 'imagePorts', 'VIPProjectiveImagePorts');
    schema.prop(this, 'mode', 'VIPProjectiveMode');
    schema.prop(this, 'inVerticesSrc', 'VIPProjectiveInVerticesSource');
    schema.prop(this, 'inVertices', 'string');
    schema.prop(this, 'outVerticesSrc', 'VIPProjectiveOutVerticesSource');
    schema.prop(this, 'outVertices', 'string');
    schema.prop(this, 'inRectFull', 'VIPProjectiveInRectsize');
    schema.prop(this, 'rectSizeSrc', 'VIPProjectiveRectSizeSource');
    schema.prop(this, 'rectSize', 'string');
    schema.prop(this, 'inPtsInvalid', 'VIPProjectiveInPtsInvalid');
    schema.prop(this, 'outSize', 'VIPProjectiveOutsize');
    schema.prop(this, 'outROI', 'string');
    schema.prop(this, 'method', 'VIPProjectiveMethod');
    schema.prop(this, 'factor', 'string');
    schema.prop(this, 'fillVal', 'string');
    schema.prop(this, 'interpolation', 'VIPProjectiveInterp');
    schema.prop(this, 'inVerticesValid', 'bool');
    schema.prop(this, 'outVerticesValid', 'bool');
end % function
