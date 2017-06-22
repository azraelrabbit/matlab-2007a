function varName = GetExportNameOfFrame(dcfObj)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    frameNum = dcfObj.srcObj.playbackControls.currframe;
    [p, fname, v] = fileparts(dcfObj.sourceNameShort);
    varName = sprintf('%s_%d', fname, frameNum);
end % function
