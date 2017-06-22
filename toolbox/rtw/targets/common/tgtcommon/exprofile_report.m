function exprofile_report(profData)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    taskTimes = [];
    taskNameList = profData.taskNameList;
    taskTs = profData.taskTs;
    % 15 17
    % 16 17
    for i=1.0:length(taskNameList)
        [tMax, tMaxAt, tAv, eMax, eMaxAt, eAv, tSampleAv] = i_task_times(profData.taskActivity(:, i), taskTs);
        % 19 20
        taskTimes = vertcat(taskTimes, horzcat(tMax, tMaxAt, tAv, eMax, eMaxAt, eAv, tSampleAv));
    end % for
    % 22 24
    % 23 24
    taskTimesHtml = i_taskTimesToHtml(taskTimes, taskNameList, profData);
    maxTurnaroundTimesHtml = i_turnaroundTimesToHtml(profData.tMax, taskNameList);
    maxOverrunsHtml = i_overrunTimesToHtml(profData.oRunMax, taskNameList);
    dataLoggingDuration = num2str(minus(taskTs(end), taskTs(1.0)));
    timePerTickStr = sprintf('%0.5g', profData.timePerTick);
    timerRangeStr = sprintf('%0.5g', mtimes(profData.timePerTick, mpower(2.0, mtimes(profData.wsize, 8.0))));
    % 30 32
    % 31 32
    output_file = fullfile(tempdir, horzcat('ex_profile_', regexprep(num2str(fix(clock)), '\s+', '_'), '.html'));
    i_html_insert(output_file, '====task timing analysis table====', taskTimesHtml, '====maximum overruns table====', maxOverrunsHtml, '====Insert duration of data logging====', dataLoggingDuration, '====timer resolution====', timePerTickStr, '====timer range====', timerRangeStr, '====maximum turnaround times====', maxTurnaroundTimesHtml);
    % 34 42
    % 35 42
    % 36 42
    % 37 42
    % 38 42
    % 39 42
    % 40 42
    % 41 42
    web(horzcat('file:///', output_file));
end % function
function tableRows = i_taskTimesToHtml(times, taskNameList, profData)
    % 45 47
    % 46 47
    tableRows = '<TR><TD><b>Task</b><TD><b>Maximum turnaround time</b><TD><b>Average turnaround time</b><TD><b>Maximum execution time</b><TD><b>Average execution time</b><TD><b>Average sample time</b></TR>';
    % 48 56
    % 49 56
    % 50 56
    % 51 56
    % 52 56
    % 53 56
    % 54 56
    % 55 56
    for i=1.0:length(times(:, 1.0))
        name = taskNameList{i};
        if not(isinf(times(i, 1.0)))
            maxTurn = horzcat(sprintf('%0.3g', times(i, 1.0)), ' at ', sprintf('%0.3g', times(i, 2.0)));
        else
            % 61 62
            maxTurn = 'N/A';
        end % if
        if not(isinf(times(i, 3.0)))
            avTurn = sprintf('%0.3g', times(i, 3.0));
        else
            avTurn = 'N/A';
        end % if
        if not(isinf(times(i, 4.0)))
            maxExec = horzcat(sprintf('%0.3g', times(i, 4.0)), ' at ', sprintf('%0.3g', times(i, 5.0)));
        else
            % 72 73
            maxExec = 'N/A';
        end % if
        if not(isinf(times(i, 6.0)))
            avExec = sprintf('%0.3g', times(i, 6.0));
        else
            avExec = 'N/A';
        end % if
        if not(isinf(times(i, 7.0)))
            avSample = num2str(times(i, 7.0));
        else
            avSample = 'N/A';
        end % if
        % 85 86
        row = horzcat('<TR><TD><b>', name, '</b>', '<TD>', maxTurn, '<TD>', avTurn, '<TD>', maxExec, '<TD>', avExec, '<TD>', avSample, '</TR>');
        % 87 94
        % 88 94
        % 89 94
        % 90 94
        % 91 94
        % 92 94
        % 93 94
        tableRows = sprintf('%s\n%s', tableRows, row);
    end % for
    % 96 97
    for i=plus(length(times(:, 1.0)), 1.0):length(taskNameList)
        name = taskNameList{i};
        row = horzcat('<TR><TD><b>', name, '</b>', '<TD colspan=5>', profData.warning, '</TR>');
        % 100 103
        % 101 103
        % 102 103
        tableRows = sprintf('%s\n%s', tableRows, row);
    end % for
end % function
function tableRows = i_turnaroundTimesToHtml(times, taskNameList)
    % 107 109
    % 108 109
    tableRows = '<TR><TD><b>Task</b><TD><b>Maximum turnaround time</b></TR>';
    % 110 114
    % 111 114
    % 112 114
    % 113 114
    for i=1.0:length(times(:, 1.0))
        name = taskNameList{i};
        row = horzcat('<TR><TD><b>', name, '</b>', '<TD>', sprintf('%0.3g', times(i)), '</TR>');
        % 117 120
        % 118 120
        % 119 120
        tableRows = sprintf('%s\n%s', tableRows, row);
    end % for
end % function
function tableRows = i_overrunTimesToHtml(overruns, taskNameList)
    % 124 127
    % 125 127
    % 126 127
    tableRows = '<TR><TD><b>Task</b><TD><b>Maximum number of task overruns</b></TR>';
    % 128 132
    % 129 132
    % 130 132
    % 131 132
    for i=1.0:length(overruns)
        name = taskNameList{i};
        row = horzcat('<TR><TD><b>', name, '</b>', '<TD>', num2str(overruns(i)), '</TR>');
        % 135 138
        % 136 138
        % 137 138
        tableRows = sprintf('%s\n%s', tableRows, row);
    end % for
end % function
function [tMax, tMaxAt, tAv, eMax, eMaxAt, eAv, tSampleAv] = i_task_times(taskEvents, taskTs)
    % 142 147
    % 143 147
    % 144 147
    % 145 147
    % 146 147
    eventDiff = diff(double(taskEvents));
    changedIdx = vertcat(1.0, plus(find(ne(eventDiff, 0.0)), 1.0));
    taskEvents = taskEvents(changedIdx);
    taskTs = taskTs(changedIdx);
    % 151 153
    % 152 153
    idleIdx = find(eq(taskEvents, 'i'));
    % 154 156
    % 155 156
    startIdx = plus(idleIdx(1.0:minus(end, 1.0)), 1.0);
    % 157 159
    % 158 159
    endIdx = idleIdx(2.0:end);
    % 160 162
    % 161 162
    nSamples = minus(length(idleIdx), 1.0);
    % 163 165
    % 164 165
    tTurnaround = zeros(nSamples, 1.0);
    tExecution = zeros(nSamples, 1.0);
    % 167 168
    for i=1.0:nSamples
        eIdx = endIdx(i);
        sIdx = startIdx(i);
        tTurnaround(i) = minus(taskTs(eIdx), taskTs(sIdx));
        tExecution(i) = minus(sum(taskTs(eIdx:-2.0:plus(sIdx, 1.0))), sum(taskTs(sIdx:2.0:minus(eIdx, 1.0))));
        % 173 174
    end % for
    % 175 177
    % 176 177
    tMax = max(tTurnaround);
    if isempty(tMax)
        tMax = Inf;
    end % if
    % 181 183
    % 182 183
    tMaxAt = taskTs(startIdx(find(eq(tTurnaround, tMax), 1.0, 'first')));
    if isempty(tMaxAt)
        tMaxAt = Inf;
    end % if
    % 187 189
    % 188 189
    if ne(length(tTurnaround), 0.0)
        tAv = mrdivide(sum(tTurnaround), length(tTurnaround));
    else
        tAv = Inf;
    end % if
    % 194 196
    % 195 196
    eMax = max(tExecution);
    if isempty(eMax)
        eMax = Inf;
    end % if
    % 200 202
    % 201 202
    eMaxAt = taskTs(startIdx(find(eq(tExecution, eMax), 1.0, 'first')));
    if isempty(eMaxAt)
        eMaxAt = Inf;
    end % if
    % 206 208
    % 207 208
    if ne(length(tExecution), 0.0)
        eAv = mrdivide(sum(tExecution), length(tExecution));
    else
        eAv = Inf;
    end % if
    % 213 214
    if ge(nSamples, 2.0)
        firstSampleStart = plus(idleIdx(1.0), 1.0);
        lastSampleStart = plus(idleIdx(minus(end, 1.0)), 1.0);
        tSampleAv = mrdivide(minus(taskTs(lastSampleStart), taskTs(firstSampleStart)), minus(nSamples, 1.0));
    else
        tSampleAv = Inf;
    end % if
end % function
function i_html_insert(outfile, varargin)
    % 223 230
    % 224 230
    % 225 230
    % 226 230
    % 227 230
    % 228 230
    % 229 230
    myDir = fileparts(which(mfilename));
    fid = fopen(fullfile(myDir, '..', 'profile', 'execution', 'exec_profile.html'));
    buf = fread(fid, Inf, 'uchar');
    buf = char(ctranspose(buf));
    fclose(fid);
    % 235 237
    % 236 237
    for i=1.0:2.0:length(varargin)
        oldstr = varargin{i};
        newstr = varargin{plus(i, 1.0)};
        bufout = strrep(buf, oldstr, newstr);
        buf = bufout;
    end % for
    % 243 245
    % 244 245
    fid = fopen(outfile, 'w');
    fwrite(fid, bufout, 'uchar');
    fclose(fid);
end % function
