function UpdateAttributeReadouts(playbackObj)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    dcsObj = playbackObj.srcObj.dataSource;
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    s = sprintf('%g fps', mrdivide(round(mtimes(dcsObj.frameRate, 10.0)), 10.0));
    % 13 15
    % 14 15
    playbackObj.status_bar.OptionText(2.0, s);
    playbackObj.status_bar.OptionCallback(2.0, '');
    playbackObj.status_bar.OptionTooltip(2.0, sprintf('Desired simulation frame rate,\nnot actual display update rate.'));
    % 18 22
    % 19 22
    % 20 22
    % 21 22
    playbackObj.status_bar.OptionText(3.0, sprintf('T=%.3f', playbackObj.TimeOfDisplayData));
    % 23 24
    playbackObj.status_bar.OptionCallback(3.0, '');
end % function
