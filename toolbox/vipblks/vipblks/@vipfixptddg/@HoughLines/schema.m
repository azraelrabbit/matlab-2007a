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
    this = schema.class(vipPackage, 'HoughLines', parent);
    % 12 14
    % 13 14
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 19 21
    % 20 21
    if isempty(findtype('VIPHoughLinessineCompMethod'))
        schema.EnumType('VIPHoughLinessineCompMethod', {'Trigonometric function','Table lookup'});
    end % if
    % 24 26
    % 25 26
    schema.prop(this, 'sineCompMethod', 'VIPHoughLinessineCompMethod');
    schema.prop(this, 'thetaRes', 'string');
end % function
