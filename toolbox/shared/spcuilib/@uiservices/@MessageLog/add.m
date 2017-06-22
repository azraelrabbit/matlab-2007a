function add(hMsgLog, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if ischar(varargin{1.0})
        % 10 12
        hMsgItem = uiservices.MessageItem(varargin{:});
    else
        if eq(nargin, 2.0) && isa(varargin{1.0}, 'uiservices.MessageItem')
            hMsgItem = varargin{1.0};
        else
            error('Invalid input arguments')
        end % if
        % 18 27
        % 19 27
        % 20 27
        % 21 27
        % 22 27
        % 23 27
        % 24 27
        % 25 27
    end % if
    invalidateMergedLog(hMsgLog);
    % 28 31
    % 29 31
    connect(hMsgItem, hMsgLog, 'up');
    % 31 34
    % 32 34
    showDlgForMsgItem(hMsgLog, hMsgItem.Type);
    % 34 38
    % 35 38
    % 36 38
    ev = uiservices.EventData(hMsgLog, 'LogUpdated', hMsgItem);
    send(hMsgLog, 'LogUpdated', ev);
