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
    this = schema.class(vipPackage, 'Deinterlacing', parent);
    % 12 14
    % 13 14
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 19 23
    % 20 23
    % 21 23
    % 22 23
    if isempty(findtype('VIPDeinterlacingMethods'))
        schema.EnumType('VIPDeinterlacingMethods', {'Line repetition','Linear interpolation','Vertical temporal median filtering'});
        % 25 27
        % 26 27
    end % if
    % 28 30
    % 29 30
    schema.prop(this, 'method', 'VIPDeinterlacingMethods');
end % function
