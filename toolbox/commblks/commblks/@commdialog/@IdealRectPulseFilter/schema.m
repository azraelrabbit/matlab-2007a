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
    this = schema.class(commPackage, 'IdealRectPulseFilter', parent);
    % 12 14
    % 13 14
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 19 21
    % 20 21
    if isempty(findtype('IdealRectPulseFilterSampMode'))
        schema.EnumType('IdealRectPulseFilterSampMode', {'Frame-based','Sample-based'});
        % 23 24
    end % if
    % 25 26
    if isempty(findtype('IdealRectPulseFilterNormMode'))
        schema.EnumType('IdealRectPulseFilterNormMode', {'Sum of samples','Energy per pulse'});
        % 28 29
    end % if
    % 30 32
    % 31 32
    schema.prop(this, 'pulseLen', 'string');
    schema.prop(this, 'pulseDelay', 'string');
    schema.prop(this, 'sampMode', 'IdealRectPulseFilterSampMode');
    schema.prop(this, 'normCheck', 'bool');
    schema.prop(this, 'normMode', 'IdealRectPulseFilterNormMode');
    schema.prop(this, 'filterGain', 'string');
end % function
