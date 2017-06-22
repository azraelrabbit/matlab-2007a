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
    wh = c.RuntimeViewportSize;
    % 18 19
    if not(strcmp(c.RuntimePaperOrientation, 'portrait'))
        wh = wh([2.0 1.0]);
    end % if
end % function
