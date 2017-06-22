function Enable(playbackObj, ena)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    isDisabled = strcmpi(ena, 'off');
    playbackObj.disableInput = isDisabled;
    % 11 13
    % 12 13
    set(get(playbackObj.parent_toolbar, 'children'), 'enable', ena);
    set(get(playbackObj.parent_menu, 'children'), 'enable', ena);
end % function
