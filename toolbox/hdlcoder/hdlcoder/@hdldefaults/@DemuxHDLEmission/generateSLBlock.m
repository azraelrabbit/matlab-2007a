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
    latencyInfo.Outputs{1.0} = 0.0;
    % 17 18
    if validBlk
        add_block(originalBlkPath, targetBlkPath);
        set_param(targetBlkPath, 'BusSelectionMode', 'off')
    end % if
end % function
