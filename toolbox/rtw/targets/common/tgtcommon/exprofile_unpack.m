function profData = exprofile_unpack(rawData, profileInfo)
    % 1 73
    % 2 73
    % 3 73
    % 4 73
    % 5 73
    % 6 73
    % 7 73
    % 8 73
    % 9 73
    % 10 73
    % 11 73
    % 12 73
    % 13 73
    % 14 73
    % 15 73
    % 16 73
    % 17 73
    % 18 73
    % 19 73
    % 20 73
    % 21 73
    % 22 73
    % 23 73
    % 24 73
    % 25 73
    % 26 73
    % 27 73
    % 28 73
    % 29 73
    % 30 73
    % 31 73
    % 32 73
    % 33 73
    % 34 73
    % 35 73
    % 36 73
    % 37 73
    % 38 73
    % 39 73
    % 40 73
    % 41 73
    % 42 73
    % 43 73
    % 44 73
    % 45 73
    % 46 73
    % 47 73
    % 48 73
    % 49 73
    % 50 73
    % 51 73
    % 52 73
    % 53 73
    % 54 73
    % 55 73
    % 56 73
    % 57 73
    % 58 73
    % 59 73
    % 60 73
    % 61 73
    % 62 73
    % 63 73
    % 64 73
    % 65 73
    % 66 73
    % 67 73
    % 68 73
    % 69 73
    % 70 73
    % 71 73
    lsbFirst = profileInfo.processor.lsbFirst;
    wsize = profileInfo.processor.wordsize;
    % 74 76
    [version, oRunMaxSection, tMaxSection, logSection, numTimerTasks, timePerTick] = i_unpack_info_section(rawData(1.0:8.0), lsbFirst);
    % 76 80
    % 77 80
    % 78 80
    nextIdx = 9.0;
    checksum = 0.0;
    % 81 84
    % 82 84
    if eq(oRunMaxSection, 1.0)
        oRunFlagsMax = double(rawData(nextIdx:minus(plus(nextIdx, numTimerTasks), 1.0)));
        nextIdx = plus(nextIdx, numTimerTasks);
    end
    % 87 91
    % 88 91
    % 89 91
    nextIdx = plus(mtimes(ceil(mrdivide(minus(nextIdx, 1.0), wsize)), wsize), 1.0);
    % 91 94
    % 92 94
    if eq(tMaxSection, 1.0)
        tMax = rawData(nextIdx:minus(plus(nextIdx, mtimes(numTimerTasks, wsize)), 1.0));
        tMax = ctranspose(reshape(tMax, wsize, numTimerTasks));
        tMax = i_byte_array_to_uint(tMax, lsbFirst);
        tMax = mtimes(mtimes(tMax, timePerTick), profileInfo.timer.timePerTickUnits);
        nextIdx = plus(nextIdx, mtimes(numTimerTasks, wsize));
    end
    % 100 104
    % 101 104
    % 102 104
    nextIdx = plus(mtimes(ceil(mrdivide(minus(nextIdx, 1.0), wsize)), wsize), 1.0);
    % 104 107
    % 105 107
    if eq(logSection, 1.0)
        numPointsByteArray = rawData(nextIdx:minus(plus(nextIdx, wsize), 1.0));
        numPoints = i_byte_array_to_uint(ctranspose(numPointsByteArray), lsbFirst);
        nextIdx = plus(nextIdx, wsize);
        try
            [taskIds, taskTicks] = i_process_log_data(rawData(nextIdx:minus(plus(nextIdx, mtimes(numPoints, wsize)), 1.0)), wsize, lsbFirst);
        catch
            % 113 116
            % 114 116
            % 115 117
            errstring = 'Received error while unpacking profiling data:\n%s\nIt may be that not all data was received - for example,\nif the target transmitted the data faster than the connection\ncould receive it.';
            % 117 121
            % 118 121
            % 119 121
            error(errstring, lasterr);
        end % try
        % 122 126
        % 123 126
        % 124 126
        taskTicks = i_process_timer(taskTicks, wsize);
        % 126 129
        % 127 129
        taskIdList = unique(abs(taskIds));
        % 129 132
        % 130 132
        numPeriodicTaskProfilingTasks = length(setdiff(taskIdList, profileInfo.tasks.ids));
        % 132 134
        numAsyncProfilingTasks = minus(length(taskIdList), numPeriodicTaskProfilingTasks);
        % 134 136
        complete_taskIdList = eq(length(taskIdList), plus(numTimerTasks, numAsyncProfilingTasks));
        if not(complete_taskIdList)
            % 137 139
            asyncTasks_taskIdList = taskIdList(minus(plus(length(taskIdList), 1.0), numAsyncProfilingTasks):length(taskIdList));
            % 139 141
            asyncTasks_taskIdList = transpose(asyncTasks_taskIdList);
            % 141 143
            periodicTasks_taskIdList = 1.0:double(numTimerTasks);
            % 143 145
            periodicTasks_taskIdList = transpose(periodicTasks_taskIdList);
            % 145 147
            taskIdList = vertcat(periodicTasks_taskIdList, asyncTasks_taskIdList);
        end
        % 148 151
        % 149 151
        taskNameList = i_get_task_name_list(taskIdList, profileInfo.tasks.ids, profileInfo.tasks.names, numTimerTasks);
        % 151 155
        % 152 155
        % 153 155
        taskActivity = i_task_activity(taskIds, taskIdList);
    end
    % 156 158
    profData.numTimerTasks = numTimerTasks;
    profData.wsize = wsize;
    if eq(oRunMaxSection, 1.0)
        % 160 164
        % 161 164
        % 162 164
        profData.oRunMax = max(zeros(size(oRunFlagsMax)), minus(oRunFlagsMax, 1.0));
    end
    if eq(tMaxSection, 1.0)
        profData.tMax = tMax;
    end
    if eq(logSection, 1.0)
        profData.taskActivity = taskActivity;
        profData.taskIdList = taskIdList;
        profData.taskTs = mtimes(mtimes(taskTicks, timePerTick), profileInfo.timer.timePerTickUnits);
        profData.taskTicks = taskTicks;
        profData.timePerTick = mtimes(timePerTick, profileInfo.timer.timePerTickUnits);
        profData.taskNameList = taskNameList;
    end
    % 176 178
    profData = profiling_data_warning(profData, complete_taskIdList);
end
function taskNameList = i_get_task_name_list(taskIdList, taskIds, taskNames, numTimerTasks)
    % 180 185
    % 181 185
    % 182 185
    % 183 185
    if any(ne(sort(taskIdList), taskIdList))
        error('The list of task identifers must be sorted')
    end
    % 187 193
    % 188 193
    % 189 193
    % 190 193
    % 191 193
    for i=1.0:numTimerTasks
        if eq(i, 1.0)
            taskName = 'Base-Rate';
        else
            taskName = horzcat('Sub-Rate ', num2str(minus(i, 1.0)));
        end
        taskNameList{i} = taskName;
    end % for
    % 200 206
    % 201 206
    % 202 206
    % 203 206
    % 204 206
    for i=1.0:length(taskIdList)
        % 206 208
        matchingId = find(eq(taskIdList(i), taskIds));
        % 208 210
        if eq(length(matchingId), 1.0)
            % 210 212
            taskName = taskNames{matchingId};
            % 212 214
            taskNameList{plus(length(taskNameList), 1.0)} = taskName;
        else
            if gt(i, numTimerTasks)
                taskName = horzcat('Task ', num2str(taskIdList(i)));
                % 217 219
                taskNameList{plus(length(taskNameList), 1.0)} = taskName;
            end
        end
    end % for
end
function [ids, timerTicks] = i_process_log_data(rawData, wdsize, lsbFirst)
    % 224 228
    % 225 228
    % 226 228
    rawData = ctranspose(reshape(rawData, wdsize, mrdivide(length(rawData), wdsize)));
    rawDataUint = i_byte_array_to_uint(rawData, lsbFirst);
    % 229 231
    ids = rawDataUint(1.0:2.0:minus(end, 1.0));
    timerTicks = rawDataUint(2.0:2.0:end);
    % 232 235
    % 233 235
    id_neg = find(ge(ids, mpower(2.0, minus(mtimes(wdsize, 8.0), 1.0))));
    ids(id_neg) = uminus(minus(mpower(2.0, mtimes(wdsize, 8.0)), ids(id_neg)));
end
function timerTicks = i_process_timer(timerTicks, wsize)
    % 238 242
    % 239 242
    % 240 242
    timerTicks_diff = diff(timerTicks);
    % 242 247
    % 243 247
    % 244 247
    % 245 247
    if lt(sum(sign(timerTicks_diff)), 0.0)
        timerTicks_diff = uminus(timerTicks_diff);
    end
    % 249 254
    % 250 254
    % 251 254
    % 252 254
    jump_idx = find(lt(timerTicks_diff, 0.0));
    if eq(wsize, 2.0)
        timerTicks_max = 65536.0;
    else
        if eq(wsize, 4.0)
            timerTicks_max = 4294967296.0;
        end
    end
    timerTicks_diff(jump_idx) = plus(timerTicks_diff(jump_idx), timerTicks_max);
    % 262 266
    % 263 266
    % 264 266
    timerTicks = vertcat(0.0, cumsum(timerTicks_diff));
end
function taskActivity = i_task_activity(full_ids, taskIdList)
    % 268 277
    % 269 277
    % 270 277
    % 271 277
    % 272 277
    % 273 277
    % 274 277
    % 275 277
    ids_idx = zeros(size(full_ids));
    for i=1.0:length(taskIdList)
        ids_idx(eq(full_ids, taskIdList(i))) = i;
        ids_idx(eq(full_ids, uminus(taskIdList(i)))) = uminus(i);
    end % for
    if any(eq(ids_idx, 0.0))
        error('All task identifiers must be one of the values in the variable taskIdList')
    end
    % 284 287
    % 285 287
    stack = zeros(size(taskIdList));
    stack_pointer = 0.0;
    % 288 291
    % 289 291
    taskActivity = repmat('i', length(ids_idx), length(taskIdList));
    % 291 294
    % 292 294
    taskActivity(1.0, :) = repmat('i', 1.0, length(taskIdList));
    % 294 297
    % 295 297
    taskStates = taskActivity(1.0, :);
    % 297 299
    for i=1.0:length(ids_idx)
        id = ids_idx(i);
        if gt(id, 0.0)
            % 301 303
            taskP = find(eq(taskStates, 'e'));
            % 303 305
            if not(isempty(taskP))
                stack_pointer = plus(stack_pointer, 1.0);
                stack(stack_pointer) = taskP;
                % 307 309
                taskStates(taskP) = 'p';
            end
            % 310 312
            taskStates(id) = 'e';
        else
            % 313 315
            taskStates(uminus(id)) = 'i';
            % 315 317
            if gt(stack_pointer, 0.0)
                taskP = stack(stack_pointer);
                stack_pointer = minus(stack_pointer, 1.0);
                taskStates(taskP) = 'e';
            end
        end
        taskActivity(i, :) = taskStates;
    end % for
end
function [version, oRunMaxSection, tMaxSection, logSection, numTimerTasks, timePerTick] = i_unpack_info_section(infoData, lsbFirst)
    % 326 332
    % 327 332
    % 328 332
    % 329 332
    % 330 332
    version = double(infoData(1.0));
    if ne(version, 1.0)
        error('The profile info has an unexpected version number. This  error may occur if there is a version mismatch, or if the  profile info has become corrupted.');
        % 334 337
        % 335 337
    end
    % 337 339
    oRunMaxSection = double(mrdivide(bitand(infoData(2.0), 128.0), 128.0));
    tMaxSection = double(mrdivide(bitand(infoData(2.0), 64.0), 64.0));
    logSection = double(mrdivide(bitand(infoData(2.0), 32.0), 32.0));
    % 341 343
    numTimerTasks = i_byte_array_to_uint(ctranspose(infoData(3.0:4.0)), lsbFirst);
    % 343 345
    timePerTick = i_byte_array_to_uint(ctranspose(infoData(5.0:6.0)), lsbFirst);
end
function uint_val = i_byte_array_to_uint(numPointsByteArray, lsbFirst)
    % 347 353
    % 348 353
    % 349 353
    % 350 353
    % 351 353
    wsize = length(numPointsByteArray(1.0, :));
    bytes = double(numPointsByteArray);
    powermat = repmat(0.0:8.0:mtimes(8.0, minus(wsize, 1.0)), length(bytes(:, 1.0)), 1.0);
    scale = power(mtimes(2.0, ones(size(bytes))), powermat);
    if ne(lsbFirst, 1.0)
        scale = fliplr(scale);
    end
    % 359 361
    uint_val = ctranspose(sum(ctranspose(times(bytes, scale))));
end
function profData = profiling_data_warning(profData, complete_taskIdList)
    % 363 367
    % 364 367
    % 365 367
    profData.warning = '';
    % 367 370
    % 368 370
    if not(complete_taskIdList)
        warning_profData = 'There were an insufficient number of data points: the recorded profiling data does not contain sufficient information to report on this timer based task. It may be possible to capture data to report on this task by increasing the number of data points in the target Options pane of the Configuration Parameters which is located under the Real-Time Workshop category. ';
        % 371 376
        % 372 376
        % 373 376
        % 374 376
        profData.warning = warning_profData;
    end
end
