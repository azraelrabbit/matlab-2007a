function eventData = NewMovie(mplayObj, doStop, varargin)
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    args = varargin;
    % 20 22
    if doStop
        % 22 29
        % 23 29
        % 24 29
        % 25 29
        % 26 29
        % 27 29
        mplayObj.listenObj.StopMethod.Callback = @(h,e)local_NewSource_continue(h,args);
        mplayObj.listenObj.StopMethod.Enabled = 'on';
        Stop(mplayObj);
    else
        % 32 40
        % 33 40
        % 34 40
        % 35 40
        % 36 40
        % 37 40
        % 38 40
        eventData = local_NewSource_continue(mplayObj, args);
    end
end
function eventData = local_NewSource_continue(mplayObj, args)
    % 43 54
    % 44 54
    % 45 54
    % 46 54
    % 47 54
    % 48 54
    % 49 54
    % 50 54
    % 51 54
    % 52 54
    mplayObj.listenObj.StopMethod.Enabled = 'off';
    % 54 95
    % 55 95
    % 56 95
    % 57 95
    % 58 95
    % 59 95
    % 60 95
    % 61 95
    % 62 95
    % 63 95
    % 64 95
    % 65 95
    % 66 95
    % 67 95
    % 68 95
    % 69 95
    % 70 95
    % 71 95
    % 72 95
    % 73 95
    % 74 95
    % 75 95
    % 76 95
    % 77 95
    % 78 95
    % 79 95
    % 80 95
    % 81 95
    % 82 95
    % 83 95
    % 84 95
    % 85 95
    % 86 95
    % 87 95
    % 88 95
    % 89 95
    % 90 95
    % 91 95
    % 92 95
    % 93 95
    oldSrc = mplayObj.datasourceObj;
    oldData = oldSrc.dataSource;
    if oldSrc.disconnectForNewSource
        oldData.disconnectData;
    end
    % 99 105
    % 100 105
    % 101 105
    % 102 105
    % 103 105
    if isempty(args) || ~(isa(args{1.0}, 'function_handle'))
        % 105 107
        newSrc = mplayObj.ParseCmdLineArgs(args{:});
    else
        % 108 114
        % 109 114
        % 110 114
        % 111 114
        % 112 114
        newSrc = feval(args{:});
    end
    % 115 122
    % 116 122
    % 117 122
    % 118 122
    % 119 122
    % 120 122
    switch newSrc.errorStatus
    case 'success'
        % 123 127
        % 124 127
        % 125 127
        if oldSrc.disconnectForNewSource(newSrc)
            oldData.disconnectData;
        end
        if ~(isempty(oldSrc.playbackControls))
            close(oldSrc.playbackControls);
        end
        % 132 134
        mplayObj.InstallDataSource(newSrc);
    case 'failure'
        % 135 140
        % 136 140
        % 137 140
        % 138 140
        oldData.reconnectData;
    case 'cancel'
        % 141 151
        % 142 151
        % 143 151
        % 144 151
        % 145 151
        % 146 151
        % 147 151
        % 148 151
        % 149 151
        isFirstLaunch = strcmp(get(mplayObj.widgetsObj.hfig, 'vis'), 'off');
        if isFirstLaunch
            % 152 155
            % 153 155
            mplayObj.InstallDataSource(newSrc);
            disconnectData(mplayObj.datasourceObj.dataSource);
        else
            % 157 159
            oldData.reconnectData;
        end
    otherwise
        % 161 163
        error('Assert: unrecognized error status "%s"', newSrc.errorStatus)
    end
    % 164 166
    local_MaintainFitToWindow(mplayObj);
    % 166 168
    drawnow;
    % 168 172
    % 169 172
    % 170 172
    status.errorStatus = newSrc.errorStatus;
    status.errorMsg = newSrc.errorMsg;
    eventData = MPlay.MPlayEvent(mplayObj, 'NewMovieEvent', status);
    % 174 178
    % 175 178
    % 176 178
    send(mplayObj, 'NewMovieEvent', eventData);
end
function local_MaintainFitToWindow(mplayObj)
    % 180 193
    % 181 193
    % 182 193
    % 183 193
    % 184 193
    % 185 193
    % 186 193
    % 187 193
    % 188 193
    % 189 193
    % 190 193
    % 191 193
    if strcmp(get(mplayObj.widgetsObj.hfig, 'vis'), 'off') && mplayObj.preferencesObj.MaintainFitToWindow
        % 193 196
        % 194 196
        mplayObj.FitToView(true);
    end
end
