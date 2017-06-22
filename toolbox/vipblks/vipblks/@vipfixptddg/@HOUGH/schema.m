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
    this = schema.class(vipPackage, 'HOUGH', parent);
    % 12 14
    % 13 14
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    % 23 24
    if isempty(findtype('VIPHOUGHoutdtmode'))
        schema.EnumType('VIPHOUGHoutdtmode', {'double','single','Specify via Fixed-point tab'});
        % 26 27
    end % if
    schema.prop(this, 'theta_res', 'string');
    schema.prop(this, 'rho_res', 'string');
    schema.prop(this, 'out_theta_rho', 'bool');
    schema.prop(this, 'outdtmode', 'VIPHOUGHoutdtmode');
    schema.prop(this, 'dummy_zero', 'string');
end % function
