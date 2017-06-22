function UpdateAllSimTimeReadouts(srcObj)
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
    playbackControls = srcObj.playbackControls;
    % 14 17
    % 15 17
    % 16 17
    playbackControls.status_bar.OptionText(3.0, sprintf('T=%.3f', playbackControls.TimeOfDisplayData));
    % 18 21
    % 19 21
    % 20 21
    m = FindOtherMPlaySameBD(srcObj);
    for i=1.0:numel(m)
        pi = m(i).datasourceObj.playbackControls;
        pi.status_bar.OptionText(3.0, sprintf('T=%.3f', pi.TimeOfDisplayData));
    end % for
end % function
