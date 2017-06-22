function result = emcBuildTarget(project, buildInfo)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    checkArgs(project, buildInfo);
    setup_buildinfo(project, buildInfo);
    result = emcGenMakefileAndBuild(project, buildInfo);
function setup_buildinfo(project, buildInfo)
    % 9 13
    % 10 13
    % 11 13
    if isempty(project.ConfigSet)
        return;
    end % if
    if isempty(project.ConfigSet.CompilerOptions)
        if not(isempty(project.ConfigSet.MEXConfig))
            codingTarget = 'mex';
        else
            codingTarget = 'rtw';
        end % if
    else
        codingTarget = lower(project.ConfigSet.CompilerOptions.CodingTarget);
    end % if
    switch codingTarget
    case 'mex'
        cfgSettings = project.ConfigSet.MEXConfig;
    case {'rtw','rtw:lib','rtw:exe'}
        cfgSettings = project.ConfigSet.RTWConfig;
    otherwise
        error('emlcoder:build:target', 'Unrecognized compilation target');
    end % switch
    if isempty(cfgSettings)
        return;
    end % if
    customCodeGroup = 'CustomCode';
    custCodeFiles = resolve_custom_code(cfgSettings.CustomInclude, cfgSettings.CustomSource, cfgSettings.CustomLibrary);
    includeDirs = custCodeFiles.parsedIncludePaths;
    if not(isempty(includeDirs))
        buildInfo.addIncludePaths(includeDirs, customCodeGroup);
    end % if
    buildInfo.addSourcePaths(custCodeFiles.parsedSrcPaths, customCodeGroup);
    % 42 44
    depSrcFiles = {};
    depSrcFilesPaths = {};
    depSrcFilesGroups = {};
    pathRegexp = '(.*?)[\\/]?[^\\/]*$';
    fileRegexp = '.*?[\\/]?([^\\/]*)$';
    % 48 50
    if not(isempty(custCodeFiles.parsedSrcFiles))
        % 50 52
        [mt, tok] = regexp(custCodeFiles.parsedSrcFiles, pathRegexp, 'match', 'tokens');
        tmp = horzcat(tok{:});
        custCodeFilesPaths = horzcat(tmp{:});
        % 54 57
        % 55 57
        [mt, tok] = regexp(custCodeFiles.parsedSrcFiles, fileRegexp, 'match', 'tokens');
        tmp = horzcat(tok{:});
        custCodeFileNames = horzcat(tmp{:});
        % 59 62
        % 60 62
        custCodeFilesGroups(1.0:length(custCodeFileNames)) = cellhorzcat(customCodeGroup);
        % 62 64
        depSrcFiles = horzcat(depSrcFiles, custCodeFileNames);
        depSrcFilesPaths = horzcat(depSrcFilesPaths, custCodeFilesPaths);
        depSrcFilesGroups = horzcat(depSrcFilesGroups, custCodeFilesGroups);
    end % if
    buildInfo.addSourceFiles(depSrcFiles, depSrcFilesPaths, depSrcFilesGroups);
    % 68 71
    % 69 71
    if not(isempty(custCodeFiles.parsedLibFiles))
        % 71 73
        [mt, tok] = regexp(custCodeFiles.parsedLibFiles, pathRegexp, 'match', 'tokens');
        tmp = horzcat(tok{:});
        depLibsPaths = horzcat(tmp{:});
        % 75 78
        % 76 78
        [mt, tok] = regexp(custCodeFiles.parsedLibFiles, fileRegexp, 'match', 'tokens');
        tmp = horzcat(tok{:});
        depLibs = horzcat(tmp{:});
        % 80 83
        % 81 83
        buildInfo.addLibraries(depLibs, depLibsPaths, 1000.0, false, true, customCodeGroup);
    end % if
function custCodeFiles = resolve_custom_code(userIncludePaths, userSrcFiles, userLibFiles)
    % 85 90
    % 86 90
    % 87 90
    % 88 90
    modelPath = emcAltPathName(pwd);
    % 90 94
    % 91 94
    % 92 94
    parsedIncludePaths = tokenize(modelPath, userIncludePaths, 'custom include directory paths string', {});
    % 94 97
    % 95 97
    searchPath = parsedIncludePaths;
    % 97 100
    % 98 100
    parsedSrcFiles = tokenize(modelPath, userSrcFiles, 'custom source files string', searchPath);
    % 100 104
    % 101 104
    % 102 104
    parsedLibFiles = tokenize(modelPath, userLibFiles, 'custom libraries string', searchPath);
    % 104 108
    % 105 108
    % 106 108
    parsedSrcPaths = {};
    parsedSrcFileNames = {};
    for i=1.0:length(parsedSrcFiles)
        [parsedSrcPaths{i}, parsedSrcFileNames{i}] = parseFullFileName(parsedSrcFiles{i});
    end % for
    % 112 115
    % 113 115
    custCodeFiles.parsedIncludePaths = parsedIncludePaths;
    custCodeFiles.parsedLibFiles = parsedLibFiles;
    custCodeFiles.parsedSrcFiles = parsedSrcFiles;
    custCodeFiles.parsedSrcPaths = parsedSrcPaths;
    custCodeFiles.parsedSrcFileNames = parsedSrcFileNames;
function tokenList = tokenize(rootDirectory, str, description, searchDirectories)
    % 120 124
    % 121 124
    % 122 124
    tokenList = {};
    if isempty(str)
        return;
    end % if
    tokens = TokenizePath(str);
    for idx=1.0:numel(tokens)
        token = tokens{idx};
        if not(isempty(token))
            if eq(token(1.0), '.')
                % 132 134
                token = fullfile(rootDirectory, token);
            else
                if ispc && ge(length(token), 2.0)
                    % 136 138
                    isAnAbsolutePath = or(eq(token(2.0), ':'), and(eq(token(1.0), '\'), eq(token(2.0), '\')));
                else
                    % 139 141
                    isAnAbsolutePath = eq(token(1.0), '/');
                end % if
                if not(isAnAbsolutePath)
                    % 143 146
                    % 144 146
                    if length(searchDirectories)
                        found = 0.0;
                        for i=1.0:length(searchDirectories)
                            fullToken = fullfile(searchDirectories{i}, token);
                            if exist(fullToken, 'file')
                                found = 1.0;
                                break
                            end % if
                        end % for
                        if found
                            token = fullToken;
                        else
                            errorStr = sprintf('%s specified in %s does not exist in any of the following search directories:', token, description);
                            % 158 160
                            for i=1.0:length(searchDirectories)
                                errorStr = sprintf('%s\n\t"%s"', errorStr, searchDirectories{i});
                            end % for
                            error(errorStr);
                        end % if
                    else
                        token = fullfile(rootDirectory, token);
                    end % if
                end % if
            end % if
            tokenList{plus(end, 1.0)} = token;
        end % if
    end % for
    tokenList = unique(tokenList);
function [pathStr, nameStr] = parseFullFileName(fullFileName)
    % 174 179
    % 175 179
    % 176 179
    % 177 179
    [pathStr, nameStr, extStr] = fileparts(fullFileName);
    % 179 181
    nameStr = horzcat(nameStr, extStr);
function tokens = TokenizePath(str)
    % 182 186
    % 183 186
    % 184 186
    tokens = {};
        while not(isempty(str))
        [beg, fin] = regexp(str, '^[\s,;]*', 'once');
        if beg
            if lt(fin, length(str))
                str = str(plus(fin, 1.0):end);
            else
                break
            end % if
        end % if
        toklen = 0.0;
        len = length(str);
            while lt(toklen, len)
            if eq(str(plus(toklen, 1.0)), '"')
                toklen = plus(toklen, 1.0);
                [beg, fin] = regexp(str(plus(toklen, 1.0):end), '"', 'once');
                if beg
                    toklen = plus(fin, toklen);
                end % if
            end % if
            if lt(toklen, len)
                [beg, fin] = regexp(str(plus(toklen, 1.0):end), '^[\w\.:\\/]*', 'once');
                if beg
                    toklen = fin;
                else
                    break
                end % if
            end % if
        end % while
        token = str(1.0:toklen);
        if eq(token(1.0), '"') && eq(token(end), '"')
            token = token(2.0:minus(end, 1.0));
        end % if
        tokens{plus(end, 1.0)} = emcAltPathName(token);
        if lt(toklen, len)
            str = str(plus(toklen, 1.0):end);
        else
            str = [];
        end % if
    end % while
function checkArgs(project, buildInfo)
    % 226 231
    % 227 231
    % 228 231
    % 229 231
    if ne(nargin, 2.0)
        error('emlcoder:build', 'Project and BuildInfo arguments required');
    end % if
    if not(isa(project, 'emlcoder.Project'))
        error('emlcoder:build', 'Expected a Project argument');
    end % if
    if not(isa(buildInfo, 'RTW.BuildInfo'))
        error('emlcoder:build', 'Expected a BuildInfo argument');
    end % if
