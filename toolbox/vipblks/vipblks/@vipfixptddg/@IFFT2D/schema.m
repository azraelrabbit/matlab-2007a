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
    this = schema.class(vipPackage, 'IFFT2D', parent);
    % 12 14
    % 13 14
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 19 21
    % 20 21
    schema.prop(this, 'TableOpt', 'DSPFFTTableOptEnum');
    schema.prop(this, 'BitRevOrder', 'bool');
    schema.prop(this, 'cs_in', 'bool');
    schema.prop(this, 'SkipNorm', 'bool');
end % function
