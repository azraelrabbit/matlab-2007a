function install(src)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    InstallControls(src.playbackControls);
    InstallKeyHandler(src.playbackControls);
    % 11 12
    update(src.playbackControls);
end % function
