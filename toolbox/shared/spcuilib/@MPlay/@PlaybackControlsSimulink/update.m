function update(playbackObj)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    if isempty(playbackObj.button_simulink_stop)
        return;
    end % if
    % 16 17
    UpdateSimControls(playbackObj);
    UpdateOptionsControls(playbackObj);
    UpdateAttributeReadouts(playbackObj);
end % function
