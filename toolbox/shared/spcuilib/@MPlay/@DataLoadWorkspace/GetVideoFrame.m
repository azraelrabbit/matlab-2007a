function y = GetVideoFrame(dlwObj, idx)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if lt(nargin, 2.0)
        % 8 10
        % 9 10
        idx = dlwObj.srcObj.playbackControls.currframe;
    end % if
    y = dlwObj.getVideoFrameFcn(dlwObj, idx);
end % function
