function h = SrcFile(mplayObj, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    h = MPlay.SrcFile;
    % 8 10
    % 9 10
    h.init(mplayObj);
    % 11 13
    % 12 13
    dcfObj = MPlay.DataConnectFile(h, varargin{:});
    % 14 15
    h.errorStatus = dcfObj.errorStatus;
    h.errorMsg = dcfObj.errorMsg;
    if strcmp(h.errorStatus, 'failure')
        return;
    end % if
    h.dataSource = dcfObj;
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    h.playbackControls = MPlay.PlaybackControlsTimer(mplayObj, h);
    % 26 28
    % 27 28
    h.resources = [];
end % function
