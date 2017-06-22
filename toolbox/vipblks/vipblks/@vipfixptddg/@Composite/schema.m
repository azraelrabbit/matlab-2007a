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
    this = schema.class(vipPackage, 'Composite', parent);
    % 12 14
    % 13 14
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 19 21
    % 20 21
    if isempty(findtype('VIPCompositeOperation'))
        schema.EnumType('VIPCompositeOperation', {'Blend','Binary mask','Highlight selected pixels'});
    end % if
    if isempty(findtype('VIPCompositeBFacSrc'))
        schema.EnumType('VIPCompositeBFacSrc', {'Specify via dialog','Input port'});
    end % if
    if isempty(findtype('VIPCompositeOFacSrc'))
        schema.EnumType('VIPCompositeOFacSrc', {'Specify via dialog','Input port'});
    end % if
    if isempty(findtype('VIPCompositeCoordSrc'))
        schema.EnumType('VIPCompositeCoordSrc', {'Specify via dialog','Input port'});
    end % if
    % 33 35
    % 34 35
    schema.prop(this, 'operation', 'VIPCompositeOperation');
    schema.prop(this, 'bFacSrc', 'VIPCompositeBFacSrc');
    schema.prop(this, 'mFacSrc', 'VIPCompositeOFacSrc');
    schema.prop(this, 'bFactor', 'string');
    schema.prop(this, 'mFactor', 'string');
    schema.prop(this, 'source', 'VIPCompositeCoordSrc');
    schema.prop(this, 'coordinates', 'string');
    % 42 44
    % 43 44
    schema.prop(this, 'FracLengthCache', 'string');
end % function
