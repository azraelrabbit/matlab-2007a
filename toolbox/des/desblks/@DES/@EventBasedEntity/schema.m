function schema
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    package = findpackage('DES');
    parent = findclass(package, 'DESDDGBase');
    hThisClass = schema.class(package, 'EventBasedEntity', parent);
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    p = schema.prop(hThisClass, 'Block', 'handle');
    % 18 22
    % 19 22
    % 20 22
    % 21 22
    p.SetFunction = @setBlock;
    % 23 27
    % 24 27
    % 25 27
    % 26 27
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 32 43
    % 33 43
    % 34 43
    % 35 43
    % 36 43
    % 37 43
    % 38 43
    % 39 43
    % 40 43
    % 41 43
    % 42 43
    if isempty(findtype('DESEntityType'))
        schema.EnumType('DESEntityType', {'Blank','Standard'});
    end % if
    if isempty(findtype('DESResponseDuringBlockage'))
        schema.EnumType('DESResponseDuringBlockage', {'Discard generated entities','Delay first pending entity'});
    end % if
    % 49 53
    % 50 53
    % 51 53
    % 52 53
    if isempty(findtype('DESEventGenerateEntitiesUpon'))
        schema.EnumType('DESEventGenerateEntitiesUpon', {'Sample time hit from port ts','Trigger from port tr','Change in signal from port vc','Function call from port fcn'});
        % 55 59
        % 56 59
        % 57 59
        % 58 59
    end % if
    % 60 61
    if isempty(findtype('DESSignalEdgeType'))
        schema.EnumType('DESSignalEdgeType', {'Rising','Falling','Either'});
    end % if
    % 64 68
    % 65 68
    % 66 68
    % 67 68
    if isempty(findtype('DESStatNumberDeparted'))
        schema.EnumType('DESStatNumberDeparted', {'Off','On','Upon stop or pause','To attribute'});
    end % if
    if isempty(findtype('DESStat'))
        schema.EnumType('DESStat', {'Off','On','Upon stop or pause'});
    end % if
    % 74 80
    % 75 80
    % 76 80
    % 77 80
    % 78 80
    % 79 80
    schema.prop(hThisClass, 'EntityType', 'DESEntityType');
    % 81 83
    % 82 83
    schema.prop(hThisClass, 'ResponseDuringBlockage', 'DESResponseDuringBlockage');
    % 84 86
    % 85 86
    schema.prop(hThisClass, 'GenerateEntitiesUpon', 'DESEventGenerateEntitiesUpon');
    % 87 88
    schema.prop(hThisClass, 'AllowBlocking', 'bool');
    % 89 90
    schema.prop(hThisClass, 'PriorityEntityGeneration', 'string');
    % 91 92
    schema.prop(hThisClass, 'GenerateEntityAtSimulationStart', 'bool');
    % 93 94
    schema.prop(hThisClass, 'SpecifyEventPriority', 'bool');
    % 95 96
    schema.prop(hThisClass, 'SignalEdgeType', 'DESSignalEdgeType');
    % 97 98
    schema.prop(hThisClass, 'StatNumberDeparted', 'DESStat');
    % 99 101
    % 100 101
    schema.prop(hThisClass, 'StatPendingEntity', 'DESStat');
    schema.prop(hThisClass, 'StatAverageIntergenerationTime', 'DESStat');
end % function
