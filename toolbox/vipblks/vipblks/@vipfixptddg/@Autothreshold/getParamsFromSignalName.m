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
    case 'Accumulator 1'
        paramNames.modeStr = 'A1Mode';
        paramNames.wlStr = 'A1WordLength';
        paramNames.flStr = 'A1FracLength';
    case 'Accumulator 2'
        paramNames.modeStr = 'A2Mode';
        paramNames.wlStr = 'A2WordLength';
        paramNames.flStr = 'A2FracLength';
    case 'Accumulator 3'
        paramNames.modeStr = 'A3Mode';
        paramNames.wlStr = 'A3WordLength';
        paramNames.flStr = 'A3FracLength';
    case 'Accumulator 4'
        paramNames.modeStr = 'A4Mode';
        paramNames.wlStr = 'A4WordLength';
        paramNames.flStr = 'A4FracLength';
    case 'Product 1'
        paramNames.modeStr = 'P1Mode';
        paramNames.wlStr = 'P1WordLength';
        paramNames.flStr = 'P1FracLength';
    case 'Product 2'
        paramNames.modeStr = 'P2Mode';
        paramNames.wlStr = 'P2WordLength';
        paramNames.flStr = 'P2FracLength';
    case 'Product 3'
        paramNames.modeStr = 'P3Mode';
        paramNames.wlStr = 'P3WordLength';
        paramNames.flStr = 'P3FracLength';
    case 'Product 4'
        paramNames.modeStr = 'P4Mode';
        paramNames.wlStr = 'P4WordLength';
        paramNames.flStr = 'P4FracLength';
    case 'EffMetric'
        paramNames.modeStr = 'EMMode';
        paramNames.wlStr = 'EMWordLength';
        paramNames.flStr = 'EMFracLength';
    case 'Quotient'
        paramNames.modeStr = 'Q1Mode';
        paramNames.wlStr = 'Q1WordLength';
        paramNames.flStr = 'Q1FracLength';
    otherwise
        paramNames.unknownParam = 1.0;
    end % switch
end % function
