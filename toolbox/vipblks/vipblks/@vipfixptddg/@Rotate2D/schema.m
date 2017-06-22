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
    this = schema.class(vipPackage, 'Rotate2D', parent);
    % 12 14
    % 13 14
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 19 21
    % 20 21
    if isempty(findtype('VIPRotate2DOutSizeREnum'))
        schema.EnumType('VIPRotate2DOutSizeREnum', {'Expanded to fit rotated input image','Same as input image'});
    end % if
    if isempty(findtype('VIPRotate2DValSrcEnum'))
        schema.EnumType('VIPRotate2DValSrcEnum', {'Specify via dialog','Input port'});
    end % if
    % 27 30
    % 28 30
    % 29 30
    if isempty(findtype('VIPRotate2DDisplayRot'))
        schema.EnumType('VIPRotate2DDisplayRot', {'Top-left corner','Center'});
    end % if
    if isempty(findtype('VIPRotate2DTrigMethod'))
        schema.EnumType('VIPRotate2DTrigMethod', {'Trigonometric function','Table lookup'});
    end % if
    if isempty(findtype('VIPTranslate2DValInterpMethEnum'))
        schema.EnumType('VIPTranslate2DValInterpMethEnum', {'Nearest neighbor','Bilinear','Bicubic'});
    end % if
    % 39 40
    schema.prop(this, 'outSizeR', 'VIPRotate2DOutSizeREnum');
    schema.prop(this, 'src_angle', 'VIPRotate2DValSrcEnum');
    % 42 43
    schema.prop(this, 'angle', 'string');
    schema.prop(this, 'maxAngle', 'string');
    schema.prop(this, 'dispImage', 'VIPRotate2DDisplayRot');
    schema.prop(this, 'method', 'VIPRotate2DTrigMethod');
    schema.prop(this, 'fillVal', 'string');
    schema.prop(this, 'interpMethod', 'VIPTranslate2DValInterpMethEnum');
end % function
