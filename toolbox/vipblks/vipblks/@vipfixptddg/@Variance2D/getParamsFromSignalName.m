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
    case 'Input-squared product'
        paramNames.modeStr = 'prodOutputMode';
        paramNames.wlStr = 'prodOutputWordLength';
        paramNames.flStr = 'prodOutputFracLength';
    case 'Input-sum-squared product'
        paramNames.modeStr = 'memoryMode';
        paramNames.wlStr = 'memoryWordLength';
        paramNames.flStr = 'memoryFracLength';
    otherwise
        paramNames.unknownParam = 1.0;
    end % switch
end % function
