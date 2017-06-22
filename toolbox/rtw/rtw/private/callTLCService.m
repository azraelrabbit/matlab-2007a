function retVal = callTLCService(action, tlcCmd, tlcProfilerOn, buildDir, modelName, tlcLogsSaveDir)
    % 1 23
    % 2 23
    % 3 23
    % 4 23
    % 5 23
    % 6 23
    % 7 23
    % 8 23
    % 9 23
    % 10 23
    % 11 23
    % 12 23
    % 13 23
    % 14 23
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    persistent sharedTLCServerHandle;
    if isempty(sharedTLCServerHandle)
        sharedTLCServerHandle = -1.0;
    end
    % 26 29
    % 27 29
    persistent callStats;
    if isempty(callStats)
        callStats = LocResetStats(callStats);
    end
    % 32 34
    retVal = [];
    % 34 37
    % 35 37
    switch action
    case 'OutputStats'
        % 38 40
        retVal = callStats;
        return
    case 'CleanUpSharedServer'
        tlcServerList = tlc('list', sharedTLCServerHandle);
        if ge(sharedTLCServerHandle, 0.0) && not(isempty(tlcServerList)) && ismember(sharedTLCServerHandle, tlcServerList)
            % 44 47
            % 45 47
            tlc('close', sharedTLCServerHandle);
        end
        return
        clear tlc_new;
    case 'ResetStats'
        callStats = LocResetStats(callStats);
        return
    case 'ProvideTLCService'
    otherwise
        % 55 57
        DAStudio.error('RTW:buildProcess:callTLCServiceInvalidAction');
    end
    % 58 63
    % 59 63
    % 60 63
    % 61 63
    curTLCHandle = -1.0;
    try
        lasterr('');
        % 65 67
        curTLCHandle = -1.0;
        % 67 69
        if tlcProfilerOn
            % 69 72
            % 70 72
            serviceMode = 'OneServerPerCallMode';
        else
            % 73 75
            serviceMode = get_param(0.0, 'SlBuildTLCServiceMode');
        end
        % 76 78
        switch serviceMode
        case 'NoServerMode'
            % 79 81
            curTLCHandle = -1.0;
            callStats.statsNumNoServerCalls = plus(callStats.statsNumNoServerCalls, 1.0);
            % 83 85
        case 'OneServerPerSessionMode'
            % 84 87
            % 85 87
            callStats.statsNumOneServerPerSessionCalls = plus(callStats.statsNumOneServerPerSessionCalls, 1.0);
            % 87 89
            tlcServerList = tlc('list', sharedTLCServerHandle);
            % 89 94
            % 90 94
            % 91 94
            % 92 94
            if lt(sharedTLCServerHandle, 0.0) || isempty(tlcServerList) || not(ismember(sharedTLCServerHandle, tlcServerList))
                % 94 97
                % 95 97
                sharedTLCServerHandle = tlc('new');
                callStats.statsNumOneServerPerSessionCreates = plus(callStats.statsNumOneServerPerSessionCreates, 1.0);
                % 98 100
            end
            curTLCHandle = sharedTLCServerHandle;
            % 101 104
            % 102 104
            tlc('cleanglobalscope', curTLCHandle);
        case 'OneServerPerCallMode'
            % 105 108
            % 106 108
            curTLCHandle = tlc('new');
            callStats.statsNumOneServerPerCallCalls = plus(callStats.statsNumOneServerPerCallCalls, 1.0);
        otherwise
            % 110 112
            % 111 113
            DAStudio.error('RTW:buildProcess:callTLCServiceUnhandledMode');
        end
        % 114 117
        % 115 117
        if tlcProfilerOn
            tlc('startprofiler', curTLCHandle);
        end
        % 119 121
        if lt(curTLCHandle, 0.0)
            % 121 124
            % 122 124
            tlcCmdArgs = {};
        else
            % 125 127
            tlcCmdArgs = cellhorzcat('execcmdline', curTLCHandle);
        end
        % 128 133
        % 129 133
        % 130 133
        % 131 133
        tlcStatus = feval(tlcCmd{1.0}, tlcCmdArgs{:}, tlcCmd{2.0:end});
        if eq(tlcStatus, -2.0)
            DAStudio.error('RTW:buildProcess:userInterrupt');
        end
    catch
        % 137 139
        if ge(curTLCHandle, 0.0)
            tlc('close', curTLCHandle);
        end
        % 141 145
        % 142 145
        % 143 145
        if not(isequal(curTLCHandle, sharedTLCServerHandle))
            callTLCService('CleanUpSharedServer');
        end
        rethrow(lasterror);
    end % try
    % 149 154
    % 150 154
    % 151 154
    % 152 154
    if not(isempty(tlcLogsSaveDir))
        stowe_away_tlc_logs_for_testing(modelName, buildDir, tlcLogsSaveDir);
    end
    % 156 159
    % 157 159
    if tlcProfilerOn
        % 159 161
        tlc('stopprofiler', curTLCHandle);
        h = tlc('getprofiler', curTLCHandle);
        slprofreport(h, buildDir, modelName);
    end
    % 164 167
    % 165 167
    if strcmp(serviceMode, 'OneServerPerCallMode')
        % 167 169
        tlc('close', curTLCHandle);
    end
end
function callStats = LocResetStats(callStats)
    % 172 179
    % 173 179
    % 174 179
    % 175 179
    % 176 179
    % 177 179
    callStats.statsNumNoServerCalls = 0.0;
    callStats.statsNumOneServerPerSessionCreates = 0.0;
    callStats.statsNumOneServerPerSessionCalls = 0.0;
    callStats.statsNumOneServerPerCallCalls = 0.0;
end
