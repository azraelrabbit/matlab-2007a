function Vals = getMaskParams(blockObj, block)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    des_setallfieldvalues(block);
    % 16 17
    Vals{idxEntityType} = 'Standard';
    Vals{idxPriorityEntityGeneration} = '300';
    Vals{idxGenerateEntitiesUpon} = 'Intergeneration time from dialog';
    Vals{idxResponseWhenBlocked} = 'Pause generation';
    Vals{idxResponseWhenUnblocked} = 'Immediate restart';
    Vals{idxDistribution} = 'Constant';
    Vals{idxMinimum} = '0';
    Vals{idxInitialSeed} = '12345';
    Vals{idxMaximum} = '1';
    Vals{idxMean} = '1';
    Vals{idxPeriod} = '1';
    Vals{idxStatNumberDeparted} = 'Off';
    % 29 30
    Vals{idxGenerateEntityAtSimulationStart} = 'on';
    Vals{idxStatPendingEntity} = 'Off';
    Vals{idxStatAverageIntergenerationTime} = 'Off';
end % function
