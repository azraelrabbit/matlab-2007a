function Vals = getMaskParams(blockObj, block)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    des_setallfieldvalues(block);
    % 17 19
    % 18 19
    Vals{idxEntityType} = 'Standard';
    Vals{idxPriorityEntityGeneration} = '300';
    Vals{idxGenerateEntitiesUpon} = 'Change in signal from port vc';
    Vals{idxAllowBlocking} = 'on';
    Vals{idxSignalEdgeType} = 'Rising';
    Vals{idxStatNumberDeparted} = 'Off';
    % 25 26
    Vals{idxSpecifyEventPriority} = 'off';
    Vals{idxStatPendingEntity} = 'Off';
    Vals{idxStatAverageIntergenerationTime} = 'Off';
    Vals{idxResponseDuringBlockage} = 'Discard generated entities';
    Vals{idxGenerateEntityAtSimulationStart} = 'on';
end % function
