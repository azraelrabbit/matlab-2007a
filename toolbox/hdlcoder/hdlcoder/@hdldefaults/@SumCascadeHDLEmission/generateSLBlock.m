function generateSLBlock(this, hC, targetBlkPath)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    validBlk = 1.0;
    % 8 9
    try
        originalBlkPath = getfullname(hC.SimulinkHandle);
    catch
        validBlk = 0.0;
    end % try
    % 14 15
    latencyInfo = this.getLatencyInfo(hC);
    % 16 17
    if validBlk
        in1 = hC.InputPorts(1.0).getSignal;
        in1vect = hdlsignalvector(in1);
        vectorsize = max(in1vect);
        % 21 23
        % 22 23
        if gt(length(hC.InputPorts), 1.0) || lt(vectorsize, 2.0)
            error(hdlcodererrormsgid('TooManyInputs'), 'Sum block with cascade implementation requires a single vector as input.');
            % 25 26
        end % if
        this.addSLBlockSubsystem(hC, originalBlkPath, targetBlkPath);
        [outputBlk, outputBlkPosition] = this.addSLBlockModel(hC, originalBlkPath, targetBlkPath);
        this.addSLBlockLatency(hC, targetBlkPath, latencyInfo, outputBlk, outputBlkPosition);
    end % if
end % function
