function wh = gr_getIntrinsicSize(c, gm, varargin)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    try
        imgFileInfo = imfinfo(c.RuntimeFileName);
        wh = horzcat(imgFileInfo.Width, imgFileInfo.Height);
    catch
        c.status('Unable to gather image file dimensions', 2.0);
        c.status(lasterr, 5.0);
        wh = [-1.0 -1.0];
    end % try
end % function
