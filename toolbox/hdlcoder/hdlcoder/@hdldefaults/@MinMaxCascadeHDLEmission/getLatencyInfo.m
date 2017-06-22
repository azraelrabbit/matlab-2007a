function latencyInfo = getLatencyInfo(this, hC)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    decomposition = this.getDecomposition();
    % 15 16
    in = hC.InputPorts(1.0).getSignal;
    invectsize = max(hdlsignalvector(in));
    decompose_vector = hdlcascadedecompose(invectsize, decomposition);
    % 19 20
    Up = decompose_vector(1.0);
    Down = 1.0;
    Phase = 0.0;
    % 23 24
    if ge(Up, 1.0)
        userData.Latency = 1.0;
    else
        userData.Latency = 0.0;
    end % if
    % 29 30
    for ii=1.0:length(hC.InputPorts)
        latencyInfo.Inputs{ii} = 0.0;
    end % for
    % 33 34
    for ii=1.0:length(hC.OutputPorts)
        latencyInfo.Outputs{ii} = userData.Latency;
    end % for
    % 37 38
    this.setHDLUserData(hC, userData);
end % function
