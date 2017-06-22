function validSig = findSignalWithValidRate(this, hN, hC, hSignals)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hCoder = hdlcurrentdriver;
    % 8 9
    if isempty(hCoder)
        error(hdlcodererrormsgid('NoDriver'), 'Unable to connect to model driver');
        % 11 12
    end % if
    % 13 14
    if isempty(hCoder.ModelConnection)
        error(hdlcodererrormsgid('BadConnectionState'), 'Unable to get model rates--no connection available.');
        % 16 17
    end % if
    % 18 19
    modelRates = hCoder.ModelConnection.ModelRates;
    % 20 21
    for ii=1.0:length(hSignals)
        hS = hSignals(ii);
        rate = hS.SimulinkRate;
        if not(isinf(rate)) && gt(rate, 0.0)
            validSig = hS;
            return;
        else
            % 28 29
        end % if
    end % for
    % 31 32
    error(hdlcodererrormsgid('CannotFindValidRate'), 'Cannot find valid sample time for clock request from block %s--please ensure that the block has a valid discrete sample time', getfullname(hC.SimulinkHandle));
    % 33 34
end % function
function result = allModelRatesInfOrZero(modelRates)
    % 36 37
    InfOrZero = or(isinf(modelRates), eq(modelRates, 0.0));
    result = all(InfOrZero);
end % function
