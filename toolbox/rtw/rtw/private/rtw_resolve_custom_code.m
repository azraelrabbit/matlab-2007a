function result = rtw_resolve_custom_code(h, userIncludePaths, userSrcFiles, userLibFiles)
    % 1 5
    % 2 5
    % 3 5
    modelName = h.ModelName;
    modelPath = getModelRootPath(modelName);
    % 6 8
    try
        [prevLastErr, prevLastErrId] = lasterr;
        if not(strcmp(h.BuildOpts.codeFormat, 'Accelerator_S-Function'))
            % 10 13
            % 11 13
            sfCustomCodeInfo = sf_rtw('get_custom_code_info', modelName);
            if not(isempty(sfCustomCodeInfo))
                userIncludePaths = horzcat(userIncludePaths, 10.0, sfCustomCodeInfo.userIncludeDirs);
                userSrcFiles = horzcat(userSrcFiles, 10.0, sfCustomCodeInfo.userSources);
                userLibFiles = horzcat(userLibFiles, 10.0, sfCustomCodeInfo.userLibraries);
            end % if
        end % if
    catch
        lasterr(prevLastErr, prevLastErrId);
    end % try
    % 22 26
    % 23 26
    % 24 26
    [parsedIncludePaths, errorStr] = do_tokenize(modelPath, userIncludePaths, 'custom include directory paths string', {});
    % 26 28
    if not(isempty(errorStr))
        error(errorStr);
    end % if
    if not(isempty(modelPath))
        parsedIncludePaths = horzcat(parsedIncludePaths, cellhorzcat(modelPath));
    end % if
    parsedIncludePaths = horzcat(parsedIncludePaths, cellhorzcat(h.StartDirToRestore), cellhorzcat(h.BuildDirectory));
    parsedIncludePaths = do_ordered_unique_paths(parsedIncludePaths);
    % 35 39
    % 36 39
    % 37 39
    mlPath = do_tokenize('', strrep(horzcat('"', path, '"'), ';', '";"'), '', {});
    filter = strncmp(mlPath, matlabroot, length(matlabroot));
    mlPath(filter) = [];
    searchPath = horzcat(parsedIncludePaths, mlPath);
    searchPath = do_ordered_unique_paths(searchPath);
    % 43 47
    % 44 47
    % 45 47
    customCodeIncludeDirs = do_extract_relevant_dirs(modelPath, mlPath, userSrcFiles);
    parsedIncludePaths = horzcat(parsedIncludePaths, customCodeIncludeDirs);
    parsedIncludePaths = do_ordered_unique_paths(parsedIncludePaths);
    % 49 52
    % 50 52
    [parsedSrcFiles, errorStr] = do_tokenize(modelPath, userSrcFiles, 'custom source files string', searchPath);
    if not(isempty(errorStr))
        error(errorStr);
    end % if
    % 55 58
    % 56 58
    [parsedLibFiles, errorStr] = do_tokenize(modelPath, userLibFiles, 'custom libraries string', searchPath);
    if not(isempty(errorStr))
        error(errorStr);
    end % if
    % 61 64
    % 62 64
    parsedSrcPaths = {};
    parsedSrcFileNames = {};
    for i=1.0:length(parsedSrcFiles)
        [parsedSrcPaths{i}, parsedSrcFileNames{i}] = parseFullFileName(parsedSrcFiles{i});
    end % for
    % 68 71
    % 69 71
    parsedSrcPaths = do_ordered_unique_paths(parsedSrcPaths);
    parsedIncludePaths = horzcat(parsedIncludePaths, parsedSrcPaths);
    parsedIncludePaths = do_ordered_unique_paths(parsedIncludePaths);
    % 73 76
    % 74 76
    for i=1.0:length(parsedIncludePaths)
        parsedIncludePaths{i} = eval('rtw_alt_pathname(parsedIncludePaths{i})', 'parsedIncludePaths{i}');
    end % for
    for i=1.0:length(parsedSrcFiles)
        parsedSrcFiles{i} = eval('rtw_alt_pathname(parsedSrcFiles{i})', 'parsedSrcFiles{i}');
    end % for
    for i=1.0:length(parsedSrcPaths)
        parsedSrcPaths{i} = eval('rtw_alt_pathname(parsedSrcPaths{i})', 'parsedSrcPaths{i}');
    end % for
    for i=1.0:length(parsedLibFiles)
        parsedLibFiles{i} = eval('rtw_alt_pathname(parsedLibFiles{i})', 'parsedLibFiles{i}');
    end % for
    % 87 90
    % 88 90
    result.parsedIncludePaths = parsedIncludePaths;
    result.parsedLibFiles = parsedLibFiles;
    result.parsedSrcFiles = parsedSrcFiles;
    result.parsedSrcPaths = parsedSrcPaths;
    result.parsedSrcFileNames = parsedSrcFileNames;
function result = getModelRootPath(modelName)
    % 95 100
    % 96 100
    % 97 100
    % 98 100
    fileName = which(modelName);
    % 100 102
    if strcmp(fileName, 'new Simulink model')
        % 102 107
        % 103 107
        % 104 107
        % 105 107
        genModel = rtwattic('AtticData', 'GenModelHdl');
        if ishandle(genModel)
            blockHandle = rtwattic('AtticData', 'OrigBlockHdl');
            if ishandle(blockHandle)
                fileName = bdroot(getfullname(blockHandle));
                fileName = which(fileName);
            end % if
        end % if
    end % if
    [pathStr, nameStr, extStr, versionStr] = fileparts(fileName);
    % 116 118
    result = pathStr;
function [pathStr, nameStr] = parseFullFileName(fullFileName)
    % 119 124
    % 120 124
    % 121 124
    % 122 124
    [pathStr, nameStr, extStr, versionStr] = fileparts(fullFileName);
    % 124 126
    nameStr = horzcat(nameStr, extStr);
function [tokenList, errorStr] = do_tokenize(rootDirectory, str, description, searchDirectories)
    % 127 132
    % 128 132
    % 129 132
    % 130 132
    [tokenList, errorStr] = sf('Private', 'tokenize', rootDirectory, str, description, searchDirectories);
function orderedList = do_ordered_unique_paths(orderedList)
    % 133 139
    % 134 139
    % 135 139
    % 136 139
    % 137 139
    if ispc
        orderedList = RTW.unique(orderedList, 'ignorecase', 'removetrailingfilesep');
    else
        % 141 143
        orderedList = RTW.unique(orderedList);
    end % if
function newSearchDirectories = do_extract_relevant_dirs(rootDirectory, searchDirectories, customCodeString)
    % 145 149
    % 146 149
    % 147 149
    newSearchDirectories = sf('Private', 'extract_relevant_dirs', rootDirectory, searchDirectories, customCodeString);
