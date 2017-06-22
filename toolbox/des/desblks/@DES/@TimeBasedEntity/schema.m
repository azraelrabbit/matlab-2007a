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
    hThisClass = schema.class(package, 'TimeBasedEntity', parent);
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
    if isempty(findtype('DESEntityType'))
        schema.EnumType('DESEntityType', {'Blank','Standard'});
    end % if
    if isempty(findtype('DESResponseWhenBlocked'))
        schema.EnumType('DESResponseWhenBlocked', {'Pause generation','Error'});
    end % if
    if isempty(findtype('DESResponseWhenUnBlocked'))
        schema.EnumType('DESResponseWhenUnBlocked', {'Immediate restart','Delayed restart'});
    end % if
    % 51 54
    % 52 54
    % 53 54
    if isempty(findtype('DESTimeGenerateEntitiesUpon'))
        schema.EnumType('DESTimeGenerateEntitiesUpon', {'Intergeneration time from dialog';'Intergeneration time from port t'});
        % 56 58
        % 57 58
    end % if
    % 59 60
    if isempty(findtype('DESDistribution'))
        schema.EnumType('DESDistribution', {'Constant','Uniform','Exponential'});
    end % if
    % 63 67
    % 64 67
    % 65 67
    % 66 67
    if isempty(findtype('DESStatNumberDeparted'))
        schema.EnumType('DESStatNumberDeparted', {'Off','On','Upon stop or pause','To attribute'});
    end % if
    if isempty(findtype('DESStat'))
        schema.EnumType('DESStat', {'Off','On','Upon stop or pause'});
    end % if
    % 73 79
    % 74 79
    % 75 79
    % 76 79
    % 77 79
    % 78 79
    schema.prop(hThisClass, 'EntityType', 'DESEntityType');
    % 80 81
    schema.prop(hThisClass, 'ResponseWhenBlocked', 'DESResponseWhenBlocked');
    schema.prop(hThisClass, 'ResponseWhenUnblocked', 'DESResponseWhenUnBlocked');
    % 83 85
    % 84 85
    schema.prop(hThisClass, 'GenerateEntitiesUpon', 'DESTimeGenerateEntitiesUpon');
    % 86 87
    schema.prop(hThisClass, 'Distribution', 'DESDistribution');
    % 88 89
    schema.prop(hThisClass, 'Period', 'string');
    % 90 91
    schema.prop(hThisClass, 'Minimum', 'string');
    schema.prop(hThisClass, 'Maximum', 'string');
    schema.prop(hThisClass, 'InitialSeed', 'string');
    % 94 95
    schema.prop(hThisClass, 'Mean', 'string');
    % 96 97
    schema.prop(hThisClass, 'GenerateEntityAtSimulationStart', 'bool');
    % 98 100
    % 99 100
    schema.prop(hThisClass, 'PriorityEntityGeneration', 'string');
    % 101 103
    % 102 103
    schema.prop(hThisClass, 'StatNumberDeparted', 'DESStat');
    % 104 106
    % 105 106
    schema.prop(hThisClass, 'StatPendingEntity', 'DESStat');
    schema.prop(hThisClass, 'StatAverageIntergenerationTime', 'DESStat');
end % function
