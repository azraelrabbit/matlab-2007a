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
    case 'Accumulator u''u'
        paramNames.modeStr = 'accumMode';
        paramNames.wlStr = 'accumWordLength';
        paramNames.flStr = 'accumFracLength';
    case 'Accumulator W''u'
        paramNames.modeStr = 'accumMode';
        paramNames.wlStr = 'accumWordLength';
        paramNames.flStr = 'accum2FracLength';
    case 'Error Signal'
        % 21 26
        % 22 26
        % 23 26
        % 24 26
        % 25 26
        paramNames.skipThisSignal = 1.0;
    case 'Output Signal'
        % 28 33
        % 29 33
        % 30 33
        % 31 33
        % 32 33
        paramNames.skipThisSignal = 1.0;
    case 'Product output u''u'
        paramNames.modeStr = 'prodOutputMode';
        paramNames.wlStr = 'prodOutputWordLength';
        paramNames.flStr = 'prodOutputFracLength';
    case 'Product output W''u'
        paramNames.modeStr = 'prodOutputMode';
        paramNames.wlStr = 'prodOutputWordLength';
        paramNames.flStr = 'prodOutput2FracLength';
    case 'Product output mu*e'
        paramNames.modeStr = 'prodOutputMode';
        paramNames.wlStr = 'prodOutputWordLength';
        paramNames.flStr = 'prodOutput3FracLength';
    case 'Product output Q*u'
        paramNames.modeStr = 'prodOutputMode';
        paramNames.wlStr = 'prodOutputWordLength';
        paramNames.flStr = 'prodOutput4FracLength';
    case 'Quotient'
        paramNames.modeStr = 'prodOutputMode';
        paramNames.wlStr = 'prodOutputWordLength';
        paramNames.flStr = 'quotientFracLength';
    case 'Weights'
        paramNames.modeStr = 'memoryMode';
        paramNames.wlStr = 'memoryWordLength';
        paramNames.flStr = 'memoryFracLength';
    otherwise
        paramNames.unknownParam = 1.0;
    end % switch
end % function
