function y = GetVideoFrame(dcfObj, idx)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if lt(nargin, 2.0)
        % 8 10
        % 9 10
        idx = dcfObj.srcObj.playbackControls.currframe;
    end % if
    % 12 13
    if dcfObj.reader
        % 14 15
        x = aviread(dcfObj.fileName, idx);
        y = x.cdata;
    else
        % 18 19
        dcfObj.UserData = vipaviread(dcfObj.UserData, idx);
        y = dcfObj.UserData.lastFrame;
    end % if
end % function
