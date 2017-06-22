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
    this = schema.class(vipPackage, 'MedianFilter2D', parent);
    % 12 14
    % 13 14
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 19 21
    % 20 21
    if isempty(findtype('VIPMedian2DOutSize'))
        schema.EnumType('VIPMedian2DOutSize', {'Same as input port I','Valid'});
    end % if
    if isempty(findtype('VIPMedian2DPadOptions'))
        schema.EnumType('VIPMedian2DPadOptions', {'Constant','Replicate','Symmetric','Circular'});
    end % if
    if isempty(findtype('VIPMedian2DPadValSrc'))
        schema.EnumType('VIPMedian2DPadValSrc', {'Specify via dialog','Input port'});
    end % if
    % 30 32
    % 31 32
    schema.prop(this, 'nghbood', 'string');
    schema.prop(this, 'outSize', 'VIPMedian2DOutSize');
    schema.prop(this, 'padType', 'VIPMedian2DPadOptions');
    schema.prop(this, 'padSrc', 'VIPMedian2DPadValSrc');
    schema.prop(this, 'padVal', 'string');
end % function
