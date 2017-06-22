function y = GetVideoFrame(src, idx)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if lt(nargin, 2.0)
        % 8 9
        idx = src.playbackControls.currframe;
    end % if
    y = GetVideoFrame(src.dataSource, idx);
end % function
