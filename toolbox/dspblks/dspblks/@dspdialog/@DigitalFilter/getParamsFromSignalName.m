function paramNames = getParamsFromSignalName(this, SignalName)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    paramNames.skipThisSignal = 0.0;
    paramNames.unknownParam = 0.0;
    % 10 11
    switch SignalName
    case 'Accumulator'
        paramNames.modeStr = 'accumMode';
        paramNames.wlStr = 'accumWordLength';
        paramNames.flStr = 'accumFracLength';
    case 'Product output'
        % 17 18
        paramNames.modeStr = 'prodOutputMode';
        paramNames.wlStr = 'prodOutputWordLength';
        paramNames.flStr = 'prodOutputFracLength';
    case 'Output'
        % 22 23
        paramNames.modeStr = 'outputMode';
        paramNames.wlStr = 'outputWordLength';
        paramNames.flStr = 'outputFracLength';
    case {'State','Input state','Output state'}
        % 27 28
        paramNames.modeStr = 'memoryMode';
        paramNames.wlStr = 'memoryWordLength';
        paramNames.flStr = 'memoryFracLength';
    case 'Tap sum'
        % 32 33
        paramNames.modeStr = 'tapSumMode';
        paramNames.wlStr = 'tapSumWordLength';
        paramNames.flStr = 'tapSumFracLength';
    case 'Multiplicand'
        % 37 38
        paramNames.modeStr = 'multiplicandMode';
        paramNames.wlStr = 'multiplicandWordLength';
        paramNames.flStr = 'multiplicandFracLength';
    case 'Section input'
        % 42 43
        paramNames.modeStr = 'stageIOMode';
        paramNames.wlStr = 'stageIOWordLength';
        paramNames.flStr = 'stageInFracLength';
    case 'Section output'
        % 47 48
        paramNames.modeStr = 'stageIOMode';
        paramNames.wlStr = 'stageIOWordLength';
        paramNames.flStr = 'stageOutFracLength';
    otherwise
        % 52 53
        paramNames.unknownParam = 1.0;
    end % switch
end % function
