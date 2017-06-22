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
    commPackage = findpackage('commdialog');
    this = schema.class(commPackage, 'GaussianFilter', parent);
    % 12 14
    % 13 14
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 19 21
    % 20 21
    if isempty(findtype('GaussianFilterNormMode'))
        schema.EnumType('GaussianFilterNormMode', {'Sum of coefficients','Filter energy','Peak amplitude'});
        % 23 25
        % 24 25
    end % if
    % 26 28
    % 27 28
    schema.prop(this, 'N', 'string');
    schema.prop(this, 'BT', 'string');
    schema.prop(this, 'D', 'string');
    schema.prop(this, 'normMode', 'GaussianFilterNormMode');
    schema.prop(this, 'checkCoeff', 'bool');
    schema.prop(this, 'filterGain', 'string');
    schema.prop(this, 'variableName', 'string');
end % function
