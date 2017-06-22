function loadFromBlock(h)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    h.GenerateEntitiesUpon = h.Block.GenerateEntitiesUpon;
    h.SignalEdgeType = h.Block.SignalEdgeType;
    h.PriorityEntityGeneration = h.Block.PriorityEntityGeneration;
    h.AllowBlocking = setOnOff(h.Block.AllowBlocking);
    h.EntityType = h.Block.EntityType;
    % 14 15
    h.StatNumberDeparted = h.Block.StatNumberDeparted;
    % 16 17
    h.StatPendingEntity = h.Block.StatPendingEntity;
    h.StatAverageIntergenerationTime = h.Block.StatAverageIntergenerationTime;
    h.SpecifyEventPriority = setOnOff(h.Block.SpecifyEventPriority);
    h.ResponseDuringBlockage = h.Block.ResponseDuringBlockage;
    h.GenerateEntityAtSimulationStart = setOnOff(h.Block.GenerateEntityAtSimulationStart);
end % function
function boolVal = setOnOff(OnOff)
    % 24 28
    % 25 28
    % 26 28
    % 27 28
    switch OnOff
    case 'on'
        boolVal = 1.0;
    case 'off'
        boolVal = 0.0;
    end % switch
end % function
