function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    dspPackage = findpackage('dspfixptddg');
    vipPackage = findpackage('vipfixptddg');
    parent = findclass(dspPackage, 'DSPDDGBase');
    this = schema.class(vipPackage, 'BlockMatch', parent);
    % 13 15
    % 14 15
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 20 23
    % 21 23
    % 22 23
    if isempty(findtype('VIPBlockMatchWhich2img'))
        schema.EnumType('VIPBlockMatchWhich2img', {'Two images','Current frame and N-th frame back'});
    end % if
    % 26 27
    if isempty(findtype('VIPBlockMatchSearchMethod'))
        schema.EnumType('VIPBlockMatchSearchMethod', {'Exhaustive','Three-step'});
    end % if
    % 30 31
    if isempty(findtype('VIPBlockMatchMatchCriteria'))
        schema.EnumType('VIPBlockMatchMatchCriteria', {'Mean square error (MSE)','Mean absolute difference (MAD)'});
    end % if
    % 34 35
    if isempty(findtype('VIPBlockMatchOutVelForm'))
        schema.EnumType('VIPBlockMatchOutVelForm', {'Horizontal and vertical components in complex form','Magnitude-squared'});
        % 37 38
    end % if
    % 39 41
    % 40 41
    schema.prop(this, 'which2img', 'VIPBlockMatchWhich2img');
    schema.prop(this, 'N', 'string');
    schema.prop(this, 'searchMethod', 'VIPBlockMatchSearchMethod');
    schema.prop(this, 'blockSize', 'string');
    schema.prop(this, 'overlapping', 'string');
    schema.prop(this, 'maxDisplacement', 'string');
    schema.prop(this, 'matchCriteria', 'VIPBlockMatchMatchCriteria');
    schema.prop(this, 'outVelForm', 'VIPBlockMatchOutVelForm');
end % function
