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
    this = schema.class(package, 'LMS', parent);
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
    if isempty(findtype('DSPLMSAlgorithm'))
        schema.EnumType('DSPLMSAlgorithm', {'LMS','Normalized LMS','Sign-Error LMS','Sign-Data LMS','Sign-Sign LMS'});
        % 37 42
        % 38 42
        % 39 42
        % 40 42
        % 41 42
    end % if
    % 43 44
    if isempty(findtype('DSPLMSStepSource'))
        schema.EnumType('DSPLMSStepSource', {'Dialog','Input port'});
        % 46 48
        % 47 48
    end % if
    % 49 51
    % 50 51
    schema.prop(this, 'Algo', 'DSPLMSAlgorithm');
    schema.prop(this, 'L', 'string');
    schema.prop(this, 'stepflag', 'DSPLMSStepSource');
    schema.prop(this, 'mu', 'string');
    schema.prop(this, 'leakage', 'string');
    schema.prop(this, 'ic', 'string');
    schema.prop(this, 'Adapt', 'bool');
    schema.prop(this, 'resetflag', 'DSPResetPortEnum');
    schema.prop(this, 'weights', 'bool');
end % function
