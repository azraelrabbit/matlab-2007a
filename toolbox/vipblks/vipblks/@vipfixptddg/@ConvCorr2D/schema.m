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
    this = schema.class(vipPackage, 'ConvCorr2D', parent);
    % 12 14
    % 13 14
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 19 21
    % 20 21
    if isempty(findtype('VIPConvCorr2DSizeEnum'))
        schema.EnumType('VIPConvCorr2DSizeEnum', {'Full','Same as input port I1','Valid'});
    end % if
    % 24 26
    % 25 26
    schema.prop(this, 'outSize', 'VIPConvCorr2DSizeEnum');
    schema.prop(this, 'normalize', 'bool');
end % function
