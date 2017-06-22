function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    package = findpackage('dspfixptddg');
    parent = findclass(package, 'DSPDDGBase');
    this = schema.class(package, 'Autocorr', parent);
    % 12 14
    % 13 14
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 19 21
    % 20 21
    if isempty(findtype('DSPAutocorrBiasEnum'))
        schema.EnumType('DSPAutocorrBiasEnum', {'None','Biased','Unbiased','Unity at zero-lag'});
        % 23 24
    end % if
    if isempty(findtype('DSPAutocorrDomainEnum'))
        schema.EnumType('DSPAutocorrDomainEnum', {'Time','Frequency'});
    end % if
    % 28 30
    % 29 30
    schema.prop(this, 'AllPositiveLags', 'bool');
    schema.prop(this, 'maxlag', 'string');
    schema.prop(this, 'bias', 'DSPAutocorrBiasEnum');
    schema.prop(this, 'domain', 'DSPAutocorrDomainEnum');
end % function
