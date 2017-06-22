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
    case 'Product 1'
        paramNames.modeStr = 'prod1Mode';
        paramNames.wlStr = 'prod1WordLength';
        paramNames.flStr = 'prod1FracLength';
    case 'Product 2'
        paramNames.modeStr = 'prod2Mode';
        paramNames.wlStr = 'prod2WordLength';
        paramNames.flStr = 'prod2FracLength';
    otherwise
        paramNames.unknownParam = 1.0;
    end % switch
end % function
