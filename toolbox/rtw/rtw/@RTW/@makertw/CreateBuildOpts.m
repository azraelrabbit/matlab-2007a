function buildOpts = CreateBuildOpts(h, hModel, systemTargetFilename, rtwroot, rtwVerbose, compilerEnvVal, buildRes, codeFormat)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    if strcmp(codeFormat, 'RealTimeMalloc')
        buildOpts.mem_alloc = 'RT_MALLOC';
    else
        buildOpts.mem_alloc = 'RT_STATIC';
    end % if
    % 22 34
    % 23 34
    % 24 34
    % 25 34
    % 26 34
    % 27 34
    % 28 34
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    fid = fopen(buildRes.rtwFile, 'r');
    if eq(fid, -1.0)
        DAStudio.error('RTW:utility:fileIOError', buildRes.rtwFile, 'open');
    end % if
    % 37 39
    solver = [];
    solverType = [];
    tid01eq = '';
    solverMode = [];
    ncstates = [];
    numst = [];
    % 44 46
    while 1
        line = fgetl(fid);
        if not(ischar(line))
            break
        end % if
        if isempty(solver)
            if gt(length(line), 8.0) && all(eq(line(1.0:8.0), '  Solver'))
                line(1.0:8.0) = [];
                solver = sscanf(line, '%s');
            end % if
        end % if
        if isempty(solverType)
            if gt(length(line), 12.0) && all(eq(line(1.0:12.0), '  SolverType'))
                line(1.0:12.0) = [];
                solverType = sscanf(line, '%s');
            end % if
        end % if
        if isempty(solverMode)
            if gt(length(line), 14.0) && all(eq(line(1.0:14.0), '    SolverMode'))
                line(1.0:14.0) = [];
                solverMode = sscanf(line, '%s');
            end % if
        end % if
        [parsedLine, count] = sscanf(line, '%s%g%1s');
        if eq(count, 2.0)
            parsedLine = sscanf(line, '%s%s%1s');
            if isempty(tid01eq)
                if gt(length(parsedLine), 7.0) && all(eq(parsedLine(1.0:7.0), 'TID01EQ'))
                    parsedLine(1.0:7.0) = [];
                    tid01eq = parsedLine;
                end % if
            end % if
            if isempty(ncstates)
                if gt(length(parsedLine), 13.0) && all(eq(parsedLine(1.0:13.0), 'NumContStates'))
                    parsedLine(1.0:13.0) = [];
                    ncstates = parsedLine;
                end % if
            end % if
            if gt(length(parsedLine), 25.0) && all(eq(parsedLine(1.0:25.0), 'NumSynchronousSampleTimes'))
                parsedLine(1.0:25.0) = [];
                numst = parsedLine;
                break
            end % if
        end % if
    end % while
    fclose(fid);
    deleteRTWFile = strcmp(get_param(hModel, 'RTWRetainRTWFile'), 'off');
    if deleteRTWFile && eq(feature('RTWTesting'), 0.0) && lt(feature('RTWCGIR'), 3.0)
        rtw_delete_file(buildRes.rtwFile);
        generatedTLCDir = fullfile(h.BuildDirectory, h.GeneratedTLCSubDir);
        if exist(generatedTLCDir, 'dir')
            [success, message, messageID] = rmdir(generatedTLCDir, 's');
            if not(success)
                error(messageID, message);
            end % if
        end % if
    end % if
    % 102 104
    if isempty(numst)
        DAStudio.error('RTW:makertw:undefinedNumSampleTimes', buildRes.rtwFile);
    end % if
    % 106 116
    % 107 116
    % 108 116
    % 109 116
    % 110 116
    % 111 116
    % 112 116
    % 113 116
    % 114 116
    [filePath, systemTargetFilename, ext, tmp2] = fileparts(systemTargetFilename);
    % 116 118
    buildOpts.sysTargetFile = horzcat(systemTargetFilename, ext);
    buildOpts.noninlinedSFcns = buildRes.noninlinedSFcns;
    buildOpts.noninlinednonSFcns = buildRes.noninlinednonSFcns;
    buildOpts.solver = solver;
    buildOpts.solverType = solverType;
    buildOpts.solverMode = solverMode;
    buildOpts.tid01eq = tid01eq;
    buildOpts.ncstates = ncstates;
    buildOpts.numst = numst;
    buildOpts.modules = buildRes.modules;
    buildOpts.codeFormat = codeFormat;
    buildOpts.listSFcns = buildRes.listSFcns;
    buildOpts.generateCodeOnly = strcmp(get_param(hModel, 'RTWGenerateCodeOnly'), 'on');
    % 130 132
    buildOpts.RTWVerbose = rtwVerbose;
    buildOpts.compilerEnvVal = compilerEnvVal;
    buildOpts.DispHook = h.DispHook;
    buildOpts.modelrefInfo = buildRes.modelrefInfo;
end % function
