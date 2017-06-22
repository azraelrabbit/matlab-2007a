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
    this = schema.class(vipPackage, 'FIRFilter2D', parent);
    % 12 14
    % 13 14
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 19 21
    % 20 21
    if isempty(findtype('VIPFIRFilter2DCoeffSource'))
        schema.EnumType('VIPFIRFilter2DCoeffSource', {'Specify via dialog','Input port'});
    end % if
    if isempty(findtype('VIPFIRFilter2DOutSize'))
        schema.EnumType('VIPFIRFilter2DOutSize', {'Full','Same as input port I','Valid'});
    end % if
    if isempty(findtype('VIPFIRFilter2DPadOptions'))
        schema.EnumType('VIPFIRFilter2DPadOptions', {'Constant','Replicate','Symmetric','Circular'});
    end % if
    if isempty(findtype('VIPFIRFilter2DPadValSrc'))
        schema.EnumType('VIPFIRFilter2DPadValSrc', {'Specify via dialog','Input port'});
    end % if
    if isempty(findtype('VIPFIRFilter2DMethod'))
        schema.EnumType('VIPFIRFilter2DMethod', {'Convolution','Correlation'});
    end % if
    % 36 38
    % 37 38
    schema.prop(this, 'separable', 'bool');
    schema.prop(this, 'filtSrc', 'VIPFIRFilter2DCoeffSource');
    schema.prop(this, 'filterMtrx', 'string');
    schema.prop(this, 'verticalFilter', 'string');
    schema.prop(this, 'horizontalFilter', 'string');
    schema.prop(this, 'outSize', 'VIPFIRFilter2DOutSize');
    schema.prop(this, 'padType', 'VIPFIRFilter2DPadOptions');
    schema.prop(this, 'padSrc', 'VIPFIRFilter2DPadValSrc');
    schema.prop(this, 'padVal', 'string');
    schema.prop(this, 'method', 'VIPFIRFilter2DMethod');
end % function
