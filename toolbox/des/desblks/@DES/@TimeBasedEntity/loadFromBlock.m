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
    h.Distribution = h.Block.Distribution;
    h.Minimum = h.Block.Minimum;
    h.Maximum = h.Block.Maximum;
    h.InitialSeed = h.Block.InitialSeed;
    h.Mean = h.Block.Mean;
    h.Period = h.Block.Period;
    h.PriorityEntityGeneration = h.Block.PriorityEntityGeneration;
    h.GenerateEntityAtSimulationStart = setOnOff(h.Block.GenerateEntityAtSimulationStart);
    h.ResponseWhenBlocked = h.Block.ResponseWhenBlocked;
    h.ResponseWhenUnblocked = h.Block.ResponseWhenUnblocked;
    h.EntityType = h.Block.EntityType;
    h.StatNumberDeparted = h.Block.StatNumberDeparted;
    % 22 23
    h.StatPendingEntity = h.Block.StatPendingEntity;
    h.StatAverageIntergenerationTime = h.Block.StatAverageIntergenerationTime;
end % function
function boolVal = setOnOff(OnOff)
    % 27 31
    % 28 31
    % 29 31
    % 30 31
    switch OnOff
    case 'on'
        boolVal = 1.0;
    case 'off'
        boolVal = 0.0;
    end % switch
end % function
