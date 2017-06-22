function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    dspPackage = findpackage('dspfixptddg');
    vipPackage = findpackage('vipfixptddg');
    parent = findclass(dspPackage, 'DSPDDGBase');
    this = schema.class(vipPackage, 'ContrastAdjust', parent);
    % 11 14
    % 12 14
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 18 20
    if isempty(findtype('VIPMethodInputRange'))
        schema.EnumType('VIPMethodInputRange', cellhorzcat(xlate('Full input data range [min max]'), xlate('User-defined range'), xlate('Range determined by saturating outlier pixels')));
        % 21 25
        % 22 25
        % 23 25
    end % if
    % 25 27
    if isempty(findtype('VIPMethodOutputRange'))
        schema.EnumType('VIPMethodOutputRange', cellhorzcat(xlate('Full data type range'), xlate('User-defined range')));
        % 28 31
        % 29 31
    end % if
    % 31 33
    schema.prop(this, 'methodInputRange', 'VIPMethodInputRange');
    schema.prop(this, 'rangeIn', 'string');
    schema.prop(this, 'fracSaturate', 'string');
    schema.prop(this, 'isBinNum', 'bool');
    schema.prop(this, 'binNum', 'string');
    schema.prop(this, 'methodOutputRange', 'VIPMethodOutputRange');
    schema.prop(this, 'rangeOut', 'string');
end % function
