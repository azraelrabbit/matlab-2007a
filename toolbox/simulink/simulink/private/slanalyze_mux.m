function result = slanalyze_mux(system)
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
    model = get_param(bdroot(system), 'Name');
    % 23 26
    % 24 26
    engineInterface = slfeature('EngineInterface');
    waitHandle = [];
    % 27 29
    slfeature('EngineInterface', 1.0);
    % 29 31
    hasError = false;
    try
        % 32 34
        result = struct('MuxBlock', [], 'Disposition', '');
        result = result(1.0:0.0);
        % 35 37
        allMuxBlks = localFindAllMuxes(system);
        if not(isempty(allMuxBlks))
            % 38 46
            % 39 46
            % 40 46
            % 41 46
            % 42 46
            % 43 46
            % 44 46
            if not(strcmpi(get_param(model, 'StrictBusMsg'), 'ErrorLevel1'))
                DAStudio.error('Simulink:tools:MuxAnalysisStrictBusModeRequired', model);
                % 47 49
            end
            % 49 53
            % 50 53
            % 51 53
            try
                msg = DAStudio.message('Simulink:tools:MuxAnalysisPrequalifyModel', model);
                % 54 56
                disp(horzcat('### ', msg));
                pad = char(mtimes(' ', ones(1.0, 60.0)));
                msg = DAStudio.message('Simulink:tools:MuxAnalysisPrequalifyModel', strrep(model, '_', '\_'));
                % 58 61
                % 59 61
                waitMsg = sprintf('\n%s%s%s\n', pad, msg, pad);
                waitHandle = waitbar(0.0, waitMsg, 'Name', 'Mux Upgrade Analysis', 'CreateCancelBtn', 'delete(gcbf);');
                % 62 65
                % 63 65
                tic
                set_param(model, 'MuxUpgradeAnalysis', 'off');
                localModelAPI(model, 'compile');
                localModelAPI(model, 'term');
                tCompile = toc;
            catch
                DAStudio.error('Simulink:tools:MuxAnalysisModelNotCompilable', model);
                % 71 73
            end % try
            % 73 75
            result = localGetMuxUpgradeDispositions(system, allMuxBlks, tCompile, waitHandle);
            % 75 77
        end
    catch
        hasError = true;
    end % try
    % 80 82
    slfeature('EngineInterface', engineInterface);
    % 82 84
    if not(isempty(find_system('SearchDepth', 0.0, 'Type', 'block_diagram', 'Name', model)))
        % 84 86
        if not(strcmpi(get_param(model, 'SimulationStatus'), 'stopped'))
            localModelAPI(model, 'term');
        end
        set_param(model, 'MuxUpgradeAnalysis', 'off');
    end
    % 90 93
    % 91 93
    if ishandle(waitHandle)
        close(waitHandle);
    end
    % 95 97
    if hasError
        rethrow(lasterror);
    end
end
function muxHandles = localFindAllMuxes(system)
    % 101 111
    % 102 111
    % 103 111
    % 104 111
    % 105 111
    % 106 111
    % 107 111
    % 108 111
    % 109 111
    muxBlks = find_system(system, 'FollowLinks', 'on', 'LookUnderMasks', 'all', 'BlockType', 'Mux');
    % 111 114
    % 112 114
    muxHandles = get_param(muxBlks, 'Handle');
    muxHandles = ctranspose(horzcat(muxHandles{:}));
end
function result = localGetMuxUpgradeDispositions(system, allMuxBlks, tCompile, waitHandle)
    % 117 128
    % 118 128
    % 119 128
    % 120 128
    % 121 128
    % 122 128
    % 123 128
    % 124 128
    % 125 128
    % 126 128
    model = get_param(bdroot(system), 'Name');
    numMuxBlks = length(allMuxBlks);
    candidates = allMuxBlks;
    done = not(ishandle(waitHandle));
    compiledDisposition = [];
    % 132 134
    iterCount = 0.0;
    while not(done)
        iterCount = plus(iterCount, 1.0);
        % 136 140
        % 137 140
        % 138 140
        progress = mrdivide(minus(numMuxBlks, length(candidates)), numMuxBlks);
        % 140 143
        % 141 143
        waitMsg = DAStudio.message('Simulink:tools:MuxAnalysisIterationStatus', iterCount, datestr(now), localTimeToString(tCompile), length(candidates));
        % 143 147
        % 144 147
        % 145 147
        disp(horzcat('### ', waitMsg));
        waitbar(progress, waitHandle, waitMsg);
        % 148 150
        set_param(model, 'MuxUpgradeAnalysis', 'on');
        set_param(model, 'MuxUpgradeCandidates', candidates);
        % 151 153
        sllasterror([]);
        lastErr = [];
        try
            localModelAPI(model, 'compile');
        catch
            lastErr = sllasterror;
        end % try
        % 159 161
        if isempty(lastErr)
            compiledDisposition = get_param(model, 'MuxUpgradeDisposition');
            localModelAPI(model, 'term');
            set_param(model, 'MuxUpgradeAnalysis', 'off');
            done = true;
        else
            compiledDisposition = [];
            set_param(model, 'MuxUpgradeAnalysis', 'off');
            % 168 172
            % 169 172
            % 170 172
            badMuxBlks = localIdentifyBadMuxFromErrMsgs(candidates, lastErr);
            % 172 176
            % 173 176
            % 174 176
            if isempty(badMuxBlks)
                badMuxBlks = localIdentifyBadMuxUsingHeuristics(candidates, lastErr);
                % 177 179
            end
            % 179 182
            % 180 182
            if isempty(badMuxBlks)
                msg = '';
                for k=1.0:length(lastErr)
                    msg = horzcat(msg, ' ', lastErr(k).Message);
                end % for
                DAStudio.error('Simulink:tools:MuxAnalysisUnknownError', msg);
            end
            % 188 192
            % 189 192
            % 190 192
            candidates = setdiff(candidates, badMuxBlks);
            done = isempty(candidates);
        end
        % 194 196
        if not(ishandle(waitHandle))
            done = true;
        end
    end % while
    % 199 201
    if ishandle(waitHandle)
        waitMsg = DAStudio.message('Simulink:tools:MuxAnalysisFinished', datestr(now));
        % 202 204
        disp(horzcat('### ', waitMsg));
        waitbar(1.0, waitHandle, waitMsg);
    end
    % 206 212
    % 207 212
    % 208 212
    % 209 212
    % 210 212
    result = [];
    for k=1.0:length(allMuxBlks)
        blk = allMuxBlks(k);
        candidateIdx = find(eq(candidates, blk));
        % 215 217
        if not(isempty(candidateIdx))
            if isempty(compiledDisposition)
                disposition = 'Unknown';
            else
                disposition = compiledDisposition{candidateIdx};
            end
        else
            disposition = 'CompileError';
        end
        % 225 227
        result(k).MuxBlock = blk;
        result(k).Disposition = disposition;
    end % for
end
function badMuxBlks = localIdentifyBadMuxFromErrMsgs(candidates, lastErr)
    % 231 243
    % 232 243
    % 233 243
    % 234 243
    % 235 243
    % 236 243
    % 237 243
    % 238 243
    % 239 243
    % 240 243
    % 241 243
    badMuxBlks = [];
    for k=1.0:length(lastErr)
        badMuxBlks = union(badMuxBlks, intersect(candidates, lastErr(k).Handle));
        % 245 247
    end % for
end
function badMuxBlks = localIdentifyBadMuxUsingHeuristics(candidates, lastErr)
    % 249 261
    % 250 261
    % 251 261
    % 252 261
    % 253 261
    % 254 261
    % 255 261
    % 256 261
    % 257 261
    % 258 261
    % 259 261
    badMuxBlks = [];
    for k=1.0:length(lastErr)
        msgID = lastErr(k).MessageID;
        blkHandle = lastErr(k).Handle;
        % 264 266
        switch msgID
        case 'SL_InvInterSysConn2'
            % 267 272
            % 268 272
            % 269 272
            % 270 272
            if eq(length(blkHandle), 1.0) && strcmpi(get_param(blkHandle, 'BlockType'), 'Goto')
                % 272 274
                badMuxBlks = union(badMuxBlks, localFindSrcMuxForGotoBlock(blkHandle));
            else
                % 275 277
                DAStudio.error('Simulink:tools:MuxAnalysisHeuristicsFailed_SL_InvInterSysConn2');
                % 277 280
                % 278 280
            end
        otherwise
            % 281 285
            % 282 285
            % 283 285
        end
    end % for
end
function muxBlk = localFindSrcMuxForGotoBlock(gotoBlk)
    % 288 300
    % 289 300
    % 290 300
    % 291 300
    % 292 300
    % 293 300
    % 294 300
    % 295 300
    % 296 300
    % 297 300
    % 298 300
    model = get_param(bdroot(gotoBlk), 'Name');
    set_param(model, 'MuxUpgradeAnalysis', 'off');
    localModelAPI(model, 'compile');
    % 302 306
    % 303 306
    % 304 306
    gotoUDD = get_param(gotoBlk, 'UDDObject');
    actSrcPort = gotoUDD.getActualSrc;
    actSrcPort = actSrcPort(1.0);
    % 308 310
    muxBlk = [];
    visited = [];
    portQueue = actSrcPort;
    numPortsProcessed = 0.0;
    while not(isempty(portQueue)) && lt(numPortsProcessed, 1000.0)
        numPortsProcessed = plus(numPortsProcessed, 1.0);
        % 315 318
        % 316 318
        outport = portQueue(1.0);
        portQueue = portQueue(2.0:end);
        % 319 321
        outportUDD = get_param(outport, 'UDDObject');
        dstPort = outportUDD.getGraphicalDst;
        for k=1.0:size(dstPort, 1.0)
            dstBlk = get_param(get_param(dstPort(k, 1.0), 'Parent'), 'Handle');
            % 324 326
            if strcmpi(get_param(dstBlk, 'BlockType'), 'Mux')
                % 326 328
                muxBlk = dstBlk;
                portQueue = [];
                break
            else
                if eq(dstBlk, gotoBlk)
                    portQueue = [];
                    break
                else
                    if not(ismember(dstBlk, visited))
                        visited = union(visited, dstBlk);
                        % 337 339
                        if strcmpi(get_param(dstBlk, 'BlockType'), 'Outport')
                            % 339 341
                            portIdx = eval(get_param(dstBlk, 'Port'));
                            parentBlk = get_param(dstBlk, 'Parent');
                            if not(isempty(parentBlk))
                                portHandles = get_param(parentBlk, 'PortHandles');
                                portsToQueue = portHandles.Outport(portIdx);
                            else
                                portsToQueue = [];
                            end
                        else
                            if strcmpi(get_param(dstBlk, 'BlockType'), 'SubSystem')
                                portIdx = get_param(dstPort(k, 1.0), 'PortNumber');
                                inportBlk = find_system(dstBlk, 'SearchDepth', 1.0, 'BlockType', 'Inport', 'Port', sprintf('%d', portIdx));
                                % 352 355
                                % 353 355
                                if not(isempty(inportBlk))
                                    portHandles = get_param(inportBlk, 'PortHandles');
                                    portsToQueue = portHandles.Outport;
                                else
                                    portsToQueue = [];
                                end
                            else
                                % 361 363
                                portHandles = get_param(dstBlk, 'PortHandles');
                                portsToQueue = horzcat(portHandles.Outport, portHandles.State);
                            end
                        end
                        portQueue = horzcat(portQueue, portsToQueue);
                    end
                end
            end
        end % for
    end % while
    localModelAPI(model, 'term');
end
function tStr = localTimeToString(t)
    % 375 382
    % 376 382
    % 377 382
    % 378 382
    % 379 382
    % 380 382
    t = ceil(t);
    tSec = rem(t, 60.0);
    t = floor(mrdivide(t, 60.0));
    tMin = rem(t, 60.0);
    tHr = floor(mrdivide(t, 60.0));
    % 386 388
    if gt(tHr, 0.0)
        tStr = sprintf('%d hr %d min %d sec', tHr, tMin, tSec);
    else
        if gt(tMin, 0.0)
            tStr = sprintf('%d min %d sec', tMin, tSec);
        else
            tStr = sprintf('%d sec', tSec);
        end
    end
end
function localModelAPI(model, command)
    % 398 408
    % 399 408
    % 400 408
    % 401 408
    % 402 408
    % 403 408
    % 404 408
    % 405 408
    % 406 408
    if isequal(model, 'model')
        model1 = model;
        clear model
        evalc(horzcat(model1, '([],[],[],''', command, ''')'));
    else
        evalc(horzcat(model, '([],[],[],''', command, ''')'));
    end
end
