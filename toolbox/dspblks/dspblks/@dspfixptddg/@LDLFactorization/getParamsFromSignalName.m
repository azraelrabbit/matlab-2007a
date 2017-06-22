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
    % 10 13
    % 11 13
    % 12 13
    switch SignalName
    case 'Intermediate product'
        paramNames.modeStr = 'interProdMode';
        paramNames.wlStr = 'interProdWordLength';
        paramNames.flStr = 'interProdFracLength';
    otherwise
        % 19 20
        paramNames.unknownParam = 1.0;
    end % switch
end % function
