function SetPendingSimTimeReadout(srcObj)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    m = FindOtherMPlaySameBD(srcObj);
    for i=1.0:numel(m)
        m(i).datasourceObj.playbackControls.PendingSimTimeReadout = true;
    end % for
end % function
