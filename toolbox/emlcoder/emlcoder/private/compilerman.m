function compilerInfo = compilerman(method, varargin)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    persistent sCompilerInfo;
    % 6 10
    % 7 10
    % 8 10
    if isempty(sCompilerInfo)
        sCompilerInfo = unknown_compiler;
    end
    % 12 14
    if not(ispc)
        compilerInfo = sCompilerInfo;
        return
    end
    % 17 19
    switch method
    case 'get_compiler_info'
        if eq(sCompilerInfo.ignoreMexOptsFile, 0.0)
            if lt(nargin, 2.0)
                mexOptsFile = '';
            else
                mexOptsFile = varargin{1.0};
            end
            sCompilerInfo = parse_opts_file(sCompilerInfo, mexOptsFile);
        end
    case 'set_compiler_info'
        if lt(nargin, 2.0)
            error('Usage: compilerman(''set_compiler_info'',customMexOptsFileName)');
        end
        sCompilerInfo = parse_opts_file(sCompilerInfo, varargin{1.0});
        sCompilerInfo.ignoreMexOptsFile = 1.0;
    case 'reset_compiler_info'
        sCompilerInfo = unknown_compiler;
    end
    % 37 39
    compilerInfo = sCompilerInfo;
end
function newCompilerInfo = parse_opts_file(cachedCompilerInfo, mexOptsFile)
    % 41 44
    % 42 44
    newCompilerInfo = cachedCompilerInfo;
    % 44 46
    if isempty(mexOptsFile)
        % 46 48
        directoryList = cellhorzcat(pwd, prefdir, fullfile(matlabroot, 'bin', computer('arch'), 'mexopts'));
        % 48 50
        mexOptsFile = '';
        for i=1.0:length(directoryList)
            tempOptsFile = fullfile(directoryList{i}, 'mexopts.bat');
            if exist(tempOptsFile, 'file')
                mexOptsFile = tempOptsFile;
                break
            end
        end % for
    end
    % 58 60
    if isempty(mexOptsFile)
        newCompilerInfo = unknown_compiler;
        return
    end
    % 63 65
    if strcmp(cachedCompilerInfo.mexOptsFile, mexOptsFile) && check_if_file_is_in_sync(cachedCompilerInfo.mexOptsFile, cachedCompilerInfo.optsFileTimeStamp)
        % 65 67
        return
    end
    % 68 72
    % 69 72
    % 70 72
    try
        fid = fopen(mexOptsFile, 'r');
        if eq(fid, -1.0)
            fprintf(1.0, 'Failed to open file ''%s'' for reading.\n', mexOptsFile);
            error('Failed to open file %s', mexOptsFile);
        end
        mexOptsContents = fread(fid, [1.0 Inf], '*char');
        fclose(fid);
    catch
        newCompilerInfo = unknown_compiler;
        return
    end % try
    % 83 85
    mexOptsContents = lower(mexOptsContents);
    % 85 87
    newCompilerInfo.mexOptsFile = mexOptsFile;
    optsFileDirInfo = dir(mexOptsFile);
    newCompilerInfo.optsFileTimeStamp = datenum(optsFileDirInfo.date);
    % 89 91
    if ispc
        success = 0.0;
        if not(isempty(regexp(mexOptsContents, 'set\s+intel=', 'once')))
            newCompilerInfo.compilerName = 'lcc';
            success = 1.0;
        else
            if not(isempty(regexp(mexOptsContents, 'msvc', 'once')))
                if not(isempty(regexp(mexOptsContents, 'msvc80', 'once')))
                    newCompilerInfo.compilerName = 'msvc80';
                    success = 1.0;
                else
                    if not(isempty(regexp(mexOptsContents, 'msvc71', 'once')))
                        newCompilerInfo.compilerName = 'msvc71';
                        success = 1.0;
                    else
                        if not(isempty(regexp(mexOptsContents, 'msvc60', 'once')))
                            newCompilerInfo.compilerName = 'msvc50';
                            success = sanity_check_for_msvc60(mexOptsContents);
                        else
                            if not(isempty(regexp(mexOptsContents, 'msvcopts', 'once')))
                                newCompilerInfo.compilerName = 'msvc4x';
                                success = sanity_check_for_msvc4x(mexOptsContents);
                            end
                        end
                    end
                end
            else
                if not(isempty(regexp(mexOptsContents, 'watcom', 'once')))
                    newCompilerInfo.compilerName = 'watcom';
                    success = sanity_check_for_watcom(mexOptsContents);
                else
                    if not(isempty(regexp(mexOptsContents, 'bccopts', 'once'))) || not(isempty(regexp(mexOptsContents, 'borland', 'once')))
                        newCompilerInfo.compilerName = 'borland';
                        success = sanity_check_for_borland(mexOptsContents);
                    else
                        if not(isempty(regexp(mexOptsContents, 'lccopts', 'once')))
                            newCompilerInfo.compilerName = 'lcc';
                            success = 1.0;
                        end
                    end
                end
            end
        end
        if eq(success, 0.0)
            newCompilerInfo.compilerName = 'lcc';
        end
    end
end
function success = check_if_dir_exists(mexOptsSetLine)
    success = 0.0;
    newLines = find(or(eq(mexOptsSetLine, 10.0), eq(mexOptsSetLine, 13.0)));
    if isempty(newLines)
        return
    end
    dirName = mexOptsSetLine(1.0:minus(min(newLines), 1.0));
    doAgain = 1.0;
    while doAgain && not(isempty(dirName))
        [s, e] = regexp(dirName, '%[^%]+%', 'once');
        if isempty(s)
            doAgain = 0.0;
        else
            dirName = horzcat(dirName(1.0:minus(s, 1.0)), getenv(dirName(plus(s, 1.0):minus(e, 1.0))), dirName(plus(e, 1.0):end));
        end
    end % while
    if isempty(dirName)
        success = 0.0;
        return
    end
    if eq(dirName(1.0), '"') && eq(dirName(end), '"')
        dirName = dirName(2.0:minus(end, 1.0));
    end
    if exist(dirName, 'dir')
        success = 1.0;
    end
    return
end
function success = sanity_check_for_msvc60(mexOptsContents)
    success = 0.0;
    [s, e] = regexp(mexOptsContents, 'set[\s]*vsinstalldir=', 'once');
    if not(isempty(s))
        success = check_if_dir_exists(mexOptsContents(plus(e, 1.0):end));
    end
end
function success = sanity_check_for_msvc4x(mexOptsContents)
    success = 0.0;
    [s, e] = regexp(mexOptsContents, 'set[\s]*msdevdir=', 'once');
    if not(isempty(s))
        success = check_if_dir_exists(mexOptsContents(plus(e, 1.0):end));
    end
end
function success = sanity_check_for_watcom(mexOptsContents)
    success = 0.0;
    [s, e] = regexp(mexOptsContents, 'set[\s]*watcom=', 'once');
    if not(isempty(s))
        success = check_if_dir_exists(mexOptsContents(plus(e, 1.0):end));
    end
end
function success = sanity_check_for_borland(mexOptsContents)
    success = 0.0;
    [s, e] = regexp(mexOptsContents, 'set[\s]*borland=', 'once');
    if not(isempty(s))
        success = check_if_dir_exists(mexOptsContents(plus(e, 1.0):end));
    end
end
function compilerInfo = unknown_compiler
    compilerInfo.compilerName = '';
    compilerInfo.mexOptsFile = '';
    compilerInfo.optsFileTimeStamp = 0.0;
    compilerInfo.ignoreMexOptsFile = 0.0;
end
function inSync = check_if_file_is_in_sync(fileName, lastBuildDate)
    inSync = false;
    if isempty(fileName) || not(exist(fileName, 'file'))
        return
    end
    fileDirInfo = dir(fileName);
    if gt(datenum(fileDirInfo.date), lastBuildDate)
        return
    end
    inSync = true;
end
