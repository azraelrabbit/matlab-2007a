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
    this = schema.class(vipPackage, 'Translate2D', parent);
    % 12 14
    % 13 14
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 19 21
    % 20 21
    if isempty(findtype('VIPTranslate2DOutSizeTEnum'))
        schema.EnumType('VIPTranslate2DOutSizeTEnum', {'Full','Same as input image'});
    end % if
    if isempty(findtype('VIPTranslate2DValSrcEnum'))
        schema.EnumType('VIPTranslate2DValSrcEnum', {'Specify via dialog','Input port'});
    end % if
    if isempty(findtype('VIPTranslate2DValInterpMethEnum'))
        schema.EnumType('VIPTranslate2DValInterpMethEnum', {'Nearest neighbor','Bilinear','Bicubic'});
    end % if
    % 30 31
    schema.prop(this, 'translation', 'string');
    schema.prop(this, 'maxOffset', 'string');
    schema.prop(this, 'outSizeT', 'VIPTranslate2DOutSizeTEnum');
    schema.prop(this, 'src_trans', 'VIPTranslate2DValSrcEnum');
    schema.prop(this, 'fillVal', 'string');
    schema.prop(this, 'interpMethod', 'VIPTranslate2DValInterpMethEnum');
end % function
