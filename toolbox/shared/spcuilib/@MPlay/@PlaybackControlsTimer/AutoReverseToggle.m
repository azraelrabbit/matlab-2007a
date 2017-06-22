function AutoReverseToggle(playbackObj)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    newMode = plus(rem(playbackObj.button_autorev.Selection, 3.0), 1.0);
    playbackObj.AutoReverse(newMode);
end % function
