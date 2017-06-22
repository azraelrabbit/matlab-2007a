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
    hParent = findclass(dspPackage, 'DSPDDGBase');
    hThisClass = schema.class(vipPackage, 'Shear2D', hParent);
    % 12 14
    % 13 14
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 19 22
    % 20 22
    % 21 22
    if isempty(findtype('VIPShear2DDirectionEnum'))
        schema.EnumType('VIPShear2DDirectionEnum', {'Horizontal','Vertical'});
    end % if
    if isempty(findtype('VIPShear2DOutSizeSEnum'))
        schema.EnumType('VIPShear2DOutSizeSEnum', {'Full','Same as input image'});
    end % if
    if isempty(findtype('VIPShear2DValSrcEnum'))
        schema.EnumType('VIPShear2DValSrcEnum', {'Specify via dialog','Input port'});
    end % if
    if isempty(findtype('VIPTranslate2DValInterpMethEnum'))
        schema.EnumType('VIPTranslate2DValInterpMethEnum', {'Nearest neighbor','Bilinear','Bicubic'});
    end % if
    % 34 36
    % 35 36
    schema.prop(hThisClass, 'direction', 'VIPShear2DDirectionEnum');
    schema.prop(hThisClass, 'outSizeS', 'VIPShear2DOutSizeSEnum');
    schema.prop(hThisClass, 'src_shear', 'VIPShear2DValSrcEnum');
    schema.prop(hThisClass, 'shear_values', 'string');
    schema.prop(hThisClass, 'maxShear', 'string');
    schema.prop(hThisClass, 'fillVal', 'string');
    schema.prop(hThisClass, 'interpMethod', 'VIPTranslate2DValInterpMethEnum');
end % function
