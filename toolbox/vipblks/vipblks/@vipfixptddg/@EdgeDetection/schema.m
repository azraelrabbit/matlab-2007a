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
    this = schema.class(vipPackage, 'EdgeDetection', parent);
    % 12 14
    % 13 14
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 19 21
    % 20 21
    m = schema.method(this, 'getParamsFromSignalName');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 26 28
    % 27 28
    m = schema.method(this, 'instrumentThisParam');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string','string'};
    s.OutputTypes = {'mxArray'};
    % 33 35
    % 34 35
    if isempty(findtype('VIPEdgeMethod'))
        schema.EnumType('VIPEdgeMethod', {'Sobel','Prewitt','Roberts','Canny'});
    end % if
    if isempty(findtype('VIPEdgeType'))
        schema.EnumType('VIPEdgeType', {'Binary image','Gradient components','Binary image and gradient components'});
        % 40 41
    end % if
    if isempty(findtype('VIPEdgeSource'))
        schema.EnumType('VIPEdgeSource', {'Specify via dialog','Input port'});
    end % if
    % 45 48
    % 46 48
    % 47 48
    schema.prop(this, 'method', 'VIPEdgeMethod');
    schema.prop(this, 'outputType', 'VIPEdgeType');
    schema.prop(this, 'userDefinedThreshold', 'bool');
    schema.prop(this, 'thresholdSource', 'VIPEdgeSource');
    schema.prop(this, 'threshold', 'string');
    schema.prop(this, 'thresholdTuning', 'string');
    schema.prop(this, 'edgeThinning', 'bool');
    schema.prop(this, 'threshold_canny', 'string');
    schema.prop(this, 'autoPercent', 'string');
    schema.prop(this, 'sigma', 'string');
end % function
