function connect(dcsObj, connType, isFloating, varargin)
    % 1 21
    % 2 21
    % 3 21
    % 4 21
    % 5 21
    % 6 21
    % 7 21
    % 8 21
    % 9 21
    % 10 21
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    srcObj = dcsObj.srcObj;
    % 21 27
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    if dcsObj.debug
        if isFloating
            disp('DCS: isFloating');
        else
            disp('DCS: not isFloating');
        end % if
    end % if
    % 33 39
    % 34 39
    % 35 39
    % 36 39
    % 37 39
    switch connType
    case 'connect'
        % 40 42
        if lt(nargin, 4.0)
            sl_path = {[]};
        else
            sl_path = varargin;
        end % if
    case 'reconnect'
        % 47 50
        % 48 50
        sl_path = cellhorzcat(dcsObj.hSLConnectMgr.hSignalSelectMgr);
    otherwise
        % 51 53
        error('Assert: unrecognized connection type "%s"', ctype)
    end % switch
    % 54 58
    % 55 58
    % 56 58
    okToOpenModel = srcObj.mplayObj.preferencesObj.OpenSimulinkModel;
    hSLConnectMgr = slmgr.SLConnectMgr;
    if isempty(sl_path{:})
        % 60 62
        hSLConnectMgr.subscribeToEvent(dcsObj, okToOpenModel);
    else
        hSLConnectMgr.subscribeToEvent(dcsObj, sl_path{:}, okToOpenModel);
    end % if
    % 65 70
    % 66 70
    % 67 70
    % 68 70
    isValid = hSLConnectMgr.connected;
    if not(isValid)
        if isFloating
            if dcsObj.debug
                disp('DCS: SLSignalData files to connect, but in floating mode');
            end % if
            dcsObj.errorStatus = 'cancel';
            dcsObj.srcObj.mplayObj.ScreenMsg(hSLConnectMgr.errMsg);
        else
            % 78 81
            % 79 81
            if dcsObj.debug
                disp('DCS: SLSignalData failed to connect');
                drawnow
            end % if
            dcsObj.errorMsg = hSLConnectMgr.errMsg;
            dcsObj.errorStatus = 'cancel';
            % 86 88
            dcsObj.srcObj.mplayObj.ScreenMsg(hSLConnectMgr.errMsg);
            disconnect_state(dcsObj);
        end % if
        % 90 93
        % 91 93
        return;
    end % if
    % 94 97
    % 95 97
    dcsObj.hSLConnectMgr = hSLConnectMgr;
    dcsObj.errorStatus = 'success';
    % 98 101
    % 99 101
    if isFloating
        % 101 103
        dcsObj.connectMode = 'floating';
    else
        % 104 106
        srcObj.ConnectionMode('persistent');
    end % if
    % 107 114
    % 108 114
    % 109 114
    % 110 114
    % 111 114
    % 112 114
    srcObj.SnapshotMode('off');
    % 114 119
    % 115 119
    % 116 119
    % 117 119
    if not(isempty(dcsObj.hSLConnectMgr))
        installSourceName(dcsObj, getFullName(dcsObj.hSLConnectMgr));
    end % if
    connect_state(srcObj.playbackControls);
    % 122 129
    % 123 129
    % 124 129
    % 125 129
    % 126 129
    % 127 129
    if isRunning(hSLConnectMgr.hSimState)
        % 129 132
        % 130 132
        subscribeToData(dcsObj);
        % 132 146
        % 133 146
        % 134 146
        % 135 146
        % 136 146
        % 137 146
        % 138 146
        % 139 146
        % 140 146
        % 141 146
        % 142 146
        % 143 146
        % 144 146
    end % if
function installSourceName(dcsObj, fullName)
    % 147 155
    % 148 155
    % 149 155
    % 150 155
    % 151 155
    % 152 155
    % 153 155
    full_blk_path = no_cr(fullName);
    short_blk_path = sl_block_name(full_blk_path);
    % 156 158
    dcsObj.sourceName = full_blk_path;
    dcsObj.sourceNameShort = short_blk_path;
function blk = sl_block_name(full_sl_path)
    % 160 166
    % 161 166
    % 162 166
    % 163 166
    % 164 166
    idx = find(eq(full_sl_path, '/'), 1.0, 'last');
    if isempty(idx)
        blk = '';
    else
        blk = strtrim(full_sl_path(plus(idx, 1.0):end));
    end % if
function y = no_cr(y)
    % 172 175
    % 173 175
    y(eq(y, sprintf('\n'))) = ' ';
