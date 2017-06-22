function generateClocks(this, hN, hC)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    decomposition = 1.0;
    in = hC.InputPorts(1.0).getSignal;
    invectsize = max(hdlsignalvector(in));
    userData.decompose_vector = hdlcascadedecompose(invectsize, decomposition);
    % 15 16
    Up = userData.decompose_vector(1.0);
    Down = 1.0;
    Phase = 0.0;
    % 19 20
    if gt(Up, 1.0)
        hS = this.findSignalWithValidRate(hC.Owner, hC, horzcat(hC.InputPorts(1.0).getSignal, hC.OutputPorts(1.0).getSignal));
        % 22 24
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
