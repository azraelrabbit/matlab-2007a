function idx = hdlsignalfindrate(rate)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if hdlisbeta2
        % 9 10
        idx = [];
        hDriver = hdlcurrentdriver;
        hN = hDriver.getCurrentNetwork;
        vS = hN.Signals;
        for ii=1.0:length(vS)
            hS = vS(ii);
            if eq(hS.SimulinkRate, rate)
                idx = horzcat(idx, hS);
            end % if
        end % for
    else
        % 21 22
        signalTable = hdlgetsignaltable;
        idx = signalTable.findSignalFromRate(rate);
    end % if
end % function
