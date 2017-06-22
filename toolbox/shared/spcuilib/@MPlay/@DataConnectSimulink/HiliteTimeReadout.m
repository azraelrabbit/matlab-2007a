function HiliteTimeReadout(dcsObj, doHilite)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if lt(nargin, 2.0)
        doHilite = true;
    end % if
    % 9 11
    dcsObj.playbackControls.status_bar.OptionHilite(3.0, doHilite);
    % 11 15
    % 12 15
    % 13 15
    m = FindOtherMPlaySameBD(dcsObj);
    for i=1.0:numel(m)
        pi = m(i).datasourceObj.playbackControls;
        pi.status_bar.OptionHilite(3.0, false);
    end % for
end % function
