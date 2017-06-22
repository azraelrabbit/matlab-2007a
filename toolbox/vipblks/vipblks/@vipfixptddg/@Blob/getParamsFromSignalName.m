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
    case 'Centroid output'
        paramNames.modeStr = 'outputMode';
        paramNames.wlStr = 'outputWordLength';
        paramNames.flStr = 'outputFracLength';
    case 'Equiv Diam^2 output'
        paramNames.modeStr = 'memoryMode';
        paramNames.wlStr = 'memoryWordLength';
        paramNames.flStr = 'memoryFracLength';
    case 'Extent output'
        paramNames.modeStr = 'firstCoeffMode';
        paramNames.wlStr = 'firstCoeffWordLength';
        paramNames.flStr = 'firstCoeffFracLength';
    otherwise
        paramNames.unknownParam = 1.0;
    end % switch
end % function
