function generateSLBlock(this, hC, targetBlkPath)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    validBlk = 1.0;
    % 9 10
    try
        originalBlkPath = getfullname(hC.SimulinkHandle);
    catch
        validBlk = 0.0;
    end % try
    % 15 16
    latencyInfo = this.getLatencyInfo(hC);
    % 17 18
    if validBlk
        in1 = hC.InputPorts(1.0).getSignal;
        in1vect = hdlsignalvector(in1);
        vectorsize = max(in1vect);
        % 22 24
        % 23 24
        if gt(length(hC.InputPorts), 1.0) || lt(vectorsize, 2.0)
            error(hdlcodererrormsgid('TooManyInputs'), 'Product block with cascade implementation requires a single vector as input.');
            % 26 27
        end % if
        this.addSLBlockSubsystem(hC, originalBlkPath, targetBlkPath);
        [outputBlk, outputBlkPosition] = this.addSLBlockModel(hC, originalBlkPath, targetBlkPath);
        this.addSLBlockLatency(hC, targetBlkPath, latencyInfo, outputBlk, outputBlkPosition);
    end % if
end % function
