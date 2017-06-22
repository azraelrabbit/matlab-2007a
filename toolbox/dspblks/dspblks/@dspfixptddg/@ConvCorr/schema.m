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
    this = schema.class(package, 'ConvCorr', parent);
    % 12 14
    % 13 14
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 19 21
    % 20 21
    if isempty(findtype('DSPConvCorrDomainEnum'))
        schema.EnumType('DSPConvCorrDomainEnum', {'Time','Frequency','Fastest'});
    end % if
    % 24 26
    % 25 26
    schema.prop(this, 'domain', 'DSPConvCorrDomainEnum');
end % function
