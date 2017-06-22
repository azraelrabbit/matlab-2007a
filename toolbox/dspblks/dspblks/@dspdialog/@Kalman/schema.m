function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    package = findpackage('dspdialog');
    parent = findclass(package, 'DSPDDG');
    this = schema.class(package, 'Kalman', parent);
    % 11 13
    % 12 13
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 18 19
    if isempty(findtype('DSPKalmanSourceEnable'))
        schema.EnumType('DSPKalmanSourceEnable', {'Always','Specify via input port <Enable>'});
        % 21 23
        % 22 23
    end % if
    % 24 25
    if isempty(findtype('DSPKalmanSourceMeasure'))
        schema.EnumType('DSPKalmanSourceMeasure', {'Specify via dialog','Input port <H>'});
        % 27 29
        % 28 29
    end % if
    % 30 32
    % 31 32
    schema.prop(this, 'num_targets', 'string');
    schema.prop(this, 'sourceEnable', 'DSPKalmanSourceEnable');
    schema.prop(this, 'isReset', 'bool');
    schema.prop(this, 'sourceMeasure', 'DSPKalmanSourceMeasure');
    % 36 38
    % 37 38
    schema.prop(this, 'X', 'string');
    schema.prop(this, 'P', 'string');
    schema.prop(this, 'A', 'string');
    schema.prop(this, 'H', 'string');
    schema.prop(this, 'Q', 'string');
    schema.prop(this, 'R', 'string');
    % 44 46
    % 45 46
    schema.prop(this, 'isOutputPrdState', 'bool');
    schema.prop(this, 'isOutputPrdMeasure', 'bool');
    schema.prop(this, 'isOutputPrdError', 'bool');
    schema.prop(this, 'isOutputEstState', 'bool');
    schema.prop(this, 'isOutputEstMeasure', 'bool');
    schema.prop(this, 'isOutputEstError', 'bool');
end % function
