function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    package = findpackage('DES');
    parent = findclass(package, 'DESDDGBase');
    hThisClass = schema.class(package, 'EntityGenerator', parent);
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    p = schema.prop(hThisClass, 'Block', 'handle');
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    p.SetFunction = @setBlock;
    % 22 26
    % 23 26
    % 24 26
    % 25 26
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 31 42
    % 32 42
    % 33 42
    % 34 42
    % 35 42
    % 36 42
    % 37 42
    % 38 42
    % 39 42
    % 40 42
    % 41 42
    if isempty(findtype('DESEntityGenEntityType'))
        schema.EnumType('DESEntityGenEntityType', {'Blank','Default'});
    end % if
    % 45 48
    % 46 48
    % 47 48
    if isempty(findtype('DESEntityGenInterGenTime'))
        schema.EnumType('DESEntityGenInterGenTime', {'With inter-generation time from dialog';'With inter-generation time from port';'At Simulink sample times';'Upon trigger';'Upon function call'});
        % 50 55
        % 51 55
        % 52 55
        % 53 55
        % 54 55
    end % if
    if isempty(findtype('DESEntityGenBlockable'))
        schema.EnumType('DESEntityGenBlockable', {'No','Yes with immediate restart','Yes with delayed restart'});
    end % if
    % 59 61
    % 60 61
    if isempty(findtype('DESEntityGenDistribution'))
        schema.EnumType('DESEntityGenDistribution', {'Constant','Uniform','Exponential'});
    end % if
    if isempty(findtype('DESEntityGenBlockable'))
        schema.EnumType('DESEntityGenBlockable', {'Yes with immediate restart','Yes with delayed restart','No'});
    end % if
    if isempty(findtype('DESEntityGenTrigger'))
        schema.EnumType('DESEntityGenTrigger', {'Rising','Falling','Either'});
    end % if
    if isempty(findtype('DESEntityGenSLHits'))
        schema.EnumType('DESEntityGenSLHits', {'According to sorted block order','As scheduled events'});
    end % if
    % 73 77
    % 74 77
    % 75 77
    % 76 77
    if isempty(findtype('DESEntityGenStatCountOpt'))
        schema.EnumType('DESEntityGenStatCountOpt', {'Disabled','Enabled','Final value only','To attribute'});
    end % if
    if isempty(findtype('DESEntityStat'))
        schema.EnumType('DESEntityStat', {'Disabled','Enabled','Final value only'});
    end % if
    % 83 89
    % 84 89
    % 85 89
    % 86 89
    % 87 89
    % 88 89
    schema.prop(hThisClass, 'entityType', 'DESEntityGenEntityType');
    % 90 93
    % 91 93
    % 92 93
    schema.prop(hThisClass, 'interGenTime', 'DESEntityGenInterGenTime');
    % 94 95
    schema.prop(hThisClass, 'distribution', 'DESEntityGenDistribution');
    % 96 97
    schema.prop(hThisClass, 'time', 'string');
    % 98 99
    schema.prop(hThisClass, 'minUnif', 'string');
    schema.prop(hThisClass, 'maxUnif', 'string');
    schema.prop(hThisClass, 'seed', 'string');
    % 102 103
    schema.prop(hThisClass, 'mean', 'string');
    % 104 105
    schema.prop(hThisClass, 'genFirstEvtOpt', 'bool');
    % 106 108
    % 107 108
    schema.prop(hThisClass, 'blockable', 'DESEntityGenBlockable');
    % 109 110
    schema.prop(hThisClass, 'PriorityEntityGeneration', 'string');
    % 111 113
    % 112 113
    schema.prop(hThisClass, 'sampleTime', 'string');
    schema.prop(hThisClass, 'offsetTime', 'string');
    % 115 116
    schema.prop(hThisClass, 'schedule', 'DESEntityGenSLHits');
    % 117 119
    % 118 119
    schema.prop(hThisClass, 'trigger', 'DESEntityGenTrigger');
    % 120 122
    % 121 122
    schema.prop(hThisClass, 'statCountOpt', 'DESEntityStat');
    % 123 125
    % 124 125
    schema.prop(hThisClass, 'outPortStatus', 'DESEntityStat');
    schema.prop(hThisClass, 'avgGenTimeOpt', 'DESEntityStat');
    schema.prop(hThisClass, 'fcnCallOpt', 'DESEntityStat');
end % function
