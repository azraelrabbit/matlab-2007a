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
    this = schema.class(package, 'Normalization', parent);
    % 11 13
    % 12 13
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 18 19
    if isempty(findtype('DSPNormTypeEnum'))
        schema.EnumType('DSPNormTypeEnum', {'2-norm','Squared 2-norm'});
    end % if
    % 22 23
    if isempty(findtype('DSPNormOverEnum'))
        schema.EnumType('DSPNormOverEnum', {'Each column','Each row','Specified dimension'});
        % 25 28
        % 26 28
        % 27 28
    end % if
    % 29 31
    % 30 31
    schema.prop(this, 'NormType', 'DSPNormTypeEnum');
    schema.prop(this, 'NormOver', 'DSPNormOverEnum');
    schema.prop(this, 'ColComp', 'bool');
    schema.prop(this, 'Dimension', 'string');
    schema.prop(this, 'Bias', 'string');
end % function
