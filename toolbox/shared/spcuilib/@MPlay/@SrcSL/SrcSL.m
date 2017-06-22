function h = SrcSL(mplayObj, varargin)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    h = MPlay.SrcSL;
    h.init(mplayObj);
    % 15 25
    % 16 25
    % 17 25
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    h.playbackControls = MPlay.PlaybackControlsSimulink(mplayObj, h);
    % 25 29
    % 26 29
    % 27 29
    h.resources = [];
    % 29 37
    % 30 37
    % 31 37
    % 32 37
    % 33 37
    % 34 37
    % 35 37
    dcsObj = MPlay.DataConnectSimulink(h);
    h.dataSource = dcsObj;
    % 38 50
    % 39 50
    % 40 50
    % 41 50
    % 42 50
    % 43 50
    % 44 50
    % 45 50
    % 46 50
    % 47 50
    % 48 50
    isFloating = gt(nargin, 1.0) && not(isempty(varargin{end})) && all(strcmp(varargin{end}, 'floating'));
    % 50 52
    if isFloating
        varargin(end) = [];
    end
    % 54 59
    % 55 59
    % 56 59
    % 57 59
    dcsObj.connect('connect', isFloating, varargin{:});
    % 59 63
    % 60 63
    % 61 63
    h.errorStatus = dcsObj.errorStatus;
    h.errorMsg = dcsObj.errorMsg;
    if strcmp(h.errorStatus, 'failure')
        return
    end
end
