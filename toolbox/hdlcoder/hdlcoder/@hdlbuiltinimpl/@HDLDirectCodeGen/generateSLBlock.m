function generateSLBlock(this, hC, targetBlkPath)
    % 1 23
    % 2 23
    % 3 23
    % 4 23
    % 5 23
    % 6 23
    % 7 23
    % 8 23
    % 9 23
    % 10 23
    % 11 23
    % 12 23
    % 13 23
    % 14 23
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    % 22 23
    validBlk = 1.0;
    % 24 25
    try
        originalBlkPath = getfullname(hC.SimulinkHandle);
    catch
        validBlk = 0.0;
    end % try
    % 30 31
    if validBlk
        add_block(originalBlkPath, targetBlkPath);
    else
        % 34 35
    end % if
end % function
