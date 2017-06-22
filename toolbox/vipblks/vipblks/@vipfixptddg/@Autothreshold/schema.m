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
    this = schema.class(vipPackage, 'Autothreshold', parent);
    % 12 14
    % 13 14
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 19 21
    % 20 21
    m = schema.method(this, 'getFixptModeandWLParams');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'mxArray'};
    % 26 28
    % 27 28
    m = schema.method(this, 'getParamsFromSignalName');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 33 35
    % 34 35
    m = schema.method(this, 'instrumentThisParam');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string','string'};
    s.OutputTypes = {'mxArray'};
    % 40 42
    % 41 42
    if isempty(findtype('VIPAutothresholdOperator'))
        schema.EnumType('VIPAutothresholdOperator', {'>','<='});
    end % if
    if isempty(findtype('VIPAutothresholdOutOfRngOpt'))
        schema.EnumType('VIPAutothresholdOutOfRngOpt', {'Ignore','Saturate','Warn and saturate','Error'});
        % 47 48
    end % if
    % 49 51
    % 50 51
    schema.prop(this, 'operator', 'VIPAutothresholdOperator');
    schema.prop(this, 'threshOut', 'bool');
    schema.prop(this, 'effMetricOut', 'bool');
    schema.prop(this, 'userDefinedRange', 'bool');
    schema.prop(this, 'umin', 'string');
    schema.prop(this, 'umax', 'string');
    schema.prop(this, 'outOfRngOpt', 'VIPAutothresholdOutOfRngOpt');
    schema.prop(this, 'scaleThreshold', 'bool');
    schema.prop(this, 'scaleFactor', 'string');
end % function
