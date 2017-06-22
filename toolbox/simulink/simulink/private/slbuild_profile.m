function varargout = slbuild_profile(mdl, action, message)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    persistent profileLogs;
    % 9 11
    retArg = [];
    % 11 13
    try
        mdlHdl = get_param(mdl, 'Handle');
    catch
        lasterr('');
        disp('slbuild_profile: Profiling disabled because because invalid model passed in')
        return
    end % try
    if strcmp(get_param(mdlHdl, 'DisplayCompileStats'), 'off')
        return
    end
    % 22 25
    % 23 25
    [currentLog, currentLogIdx] = LocGetLog(mdlHdl, profileLogs);
    % 25 27
    switch action
    case 'init'
        % 28 34
        % 29 34
        % 30 34
        % 31 34
        % 32 34
        if not(isempty(currentLog))
            profileLogs(currentLogIdx) = [];
            currentLog = [];
        end
        % 37 40
        % 38 40
        currentLog = LocCreateLog(mdlHdl);
        % 40 42
        if isempty(profileLogs)
            profileLogs = currentLog;
        else
            profileLogs(plus(end, 1.0)) = currentLog;
        end
    case 'log'
        % 47 53
        % 48 53
        % 49 53
        % 50 53
        % 51 53
        if isempty(currentLog)
            disp('slbuild_profile: Profiling disabled because log cannot be retrieved');
            return
        end
        % 56 58
        currentLog = LocAddStatistic(currentLog, message);
        % 58 60
        profileLogs(currentLogIdx) = currentLog;
    case 'get'
        % 61 64
        % 62 64
        currentLog = rmfield(currentLog, 'ModelHandle');
        currentLog = rmfield(currentLog, 'StartStamp');
        retArg = currentLog;
    case 'clear'
        % 67 72
        % 68 72
        % 69 72
        % 70 72
        if not(isempty(currentLog))
            profileLogs(currentLogIdx) = [];
        end
    otherwise
        % 75 77
        error('slbuild_profile called with invalid option');
    end
    % 78 80
    if eq(nargout, 1.0) || strcmp(action, 'get')
        varargout = cellhorzcat(retArg);
    else
        varargout = {};
    end
end
function [cLog, cLogIdx] = LocGetLog(mdlHdl, allLogs)
    % 86 91
    % 87 91
    % 88 91
    % 89 91
    cLog = [];
    cLogIdx = [];
    for i=1.0:length(allLogs)
        if eq(allLogs(i).ModelHandle, mdlHdl)
            cLog = allLogs(i);
            cLogIdx = i;
        end
    end % for
end
function newLog = LocCreateLog(mdlHdl)
    % 100 107
    % 101 107
    % 102 107
    % 103 107
    % 104 107
    % 105 107
    newLog.Model = get_param(mdlHdl, 'Name');
    newLog.ModelHandle = mdlHdl;
    newLog.StatisticsType = 'slbuild';
    newLog.CollectionStartTime = clock;
    newLog.MachineConfiguration = get_param(0.0, 'MachineConfiguration');
    newLog.StartStamp = get_param(0.0, 'ProcessTimeAndMemoryReading');
    newLog.Statistics = [];
    % 113 115
    newLog.Statistics = repmat(struct('Description', '', 'TimeStamp', [], 'ProcessMemUsage', [], 'ProcessMemUsagePeak', [], 'ProcessVMSize', [], 'CheckMallocStageMem', [], 'MATLABClockTime', []), 0.0, 0.0);
    % 115 122
    % 116 122
    % 117 122
    % 118 122
    % 119 122
    % 120 122
end
function currentLog = LocAddStatistic(currentLog, message)
    % 123 131
    % 124 131
    % 125 131
    % 126 131
    % 127 131
    % 128 131
    % 129 131
    reading = get_param(0.0, 'ProcessTimeAndMemoryReading');
    % 131 133
    newStat.Description = message;
    newStat.TimeStamp = minus(reading(1.0), currentLog.StartStamp(1.0));
    % 134 136
    newStat.ProcessMemUsage = reading(2.0);
    newStat.ProcessMemUsagePeak = reading(3.0);
    newStat.ProcessVMSize = reading(4.0);
    newStat.CheckMallocStageMem = minus(reading(5.0), currentLog.StartStamp(5.0));
    newStat.MATLABClockTime = etime(clock, currentLog.CollectionStartTime);
    % 140 142
    currentLog.Statistics(plus(end, 1.0)) = newStat;
end
