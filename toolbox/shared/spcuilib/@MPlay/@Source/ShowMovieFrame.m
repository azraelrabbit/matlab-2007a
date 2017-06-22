function ShowMovieFrame(src, doReadoutUpdate)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    mplayObj = src.mplayObj;
    % 8 9
    if isempty(mplayObj.conversionFcn)
        set(mplayObj.widgetsObj.himage, 'cdata', GetVideoFrame(src));
    else
        set(mplayObj.widgetsObj.himage, 'cdata', mplayObj.conversionFcn(GetVideoFrame(src)));
        % 13 14
    end % if
    % 15 17
    % 16 17
    if lt(nargin, 2.0) || doReadoutUpdate
        UpdateFrameReadout(src.playbackControls);
    end % if
    % 20 22
    % 21 22
    drawnow
end % function
