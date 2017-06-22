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
    case 'A'
        paramNames.modeStr = 'firstCoeffMode';
        paramNames.wlStr = 'firstCoeffWordLength';
        paramNames.flStr = 'firstCoeffFracLength';
    case 'K'
        paramNames.modeStr = 'firstCoeffMode';
        paramNames.wlStr = 'firstCoeffWordLength';
        paramNames.flStr = 'secondCoeffFracLength';
    case 'P'
        paramNames.modeStr = 'outputMode';
        paramNames.wlStr = 'outputWordLength';
        paramNames.flStr = 'outputFracLength';
    otherwise
        paramNames.unknownParam = 1.0;
    end % switch
end % function
