function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    package = findpackage('dspfixptddg');
    parent = findclass(package, 'DSPDDGBase');
    this = schema.class(package, 'IFFT', parent);
    % 11 13
    % 12 13
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 18 20
    % 19 20
    schema.prop(this, 'CompMethod', 'DSPFFTCompMethodEnum');
    schema.prop(this, 'TableOpt', 'DSPFFTTableOptEnum');
    schema.prop(this, 'BitRevOrder', 'bool');
    schema.prop(this, 'cs_in', 'bool');
    schema.prop(this, 'SkipNorm', 'bool');
    schema.prop(this, 'InheritFFTLength', 'bool');
    schema.prop(this, 'FFTLength', 'string');
end % function
