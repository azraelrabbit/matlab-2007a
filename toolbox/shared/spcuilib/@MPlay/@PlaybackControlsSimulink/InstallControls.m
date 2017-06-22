function InstallControls(playbackObj, sw)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if lt(nargin, 2.0)
        sw = true;
    end % if
    ShowSimControls(playbackObj, sw);
    ShowOptionsControls(playbackObj, sw);
end % function
