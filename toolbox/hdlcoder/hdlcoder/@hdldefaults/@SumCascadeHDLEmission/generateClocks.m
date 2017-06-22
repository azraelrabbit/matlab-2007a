function generateClocks(this, hN, hC)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    decomposition = 1.0;
    in = hC.InputPorts(1.0).getSignal;
    invectsize = max(hdlsignalvector(in));
    userData.decompose_vector = hdlcascadedecompose(invectsize, decomposition);
    % 16 17
    Up = userData.decompose_vector(1.0);
    Down = 1.0;
    Phase = 0.0;
    % 20 21
    if gt(Up, 1.0)
        hS = this.findSignalWithValidRate(hN, hC, horzcat(hC.InputPorts(1.0).getSignal, hC.OutputPorts(1.0).getSignal));
        % 23 24
        [c, enb, r] = hdlgetclockbundle(hC.Owner, hC, hS, 1.0, 1.0, 0.0);
        [c, enb, r] = hdlgetclockbundle(hC.Owner, hC, hS, Up, Down, Phase);
    end % if
    % 27 28
    if ge(Up, 1.0)
        userData.Latency = 1.0;
    else
        userData.Latency = 0.0;
    end % if
    % 33 34
    this.setHDLUserData(hC, userData);
end % function
