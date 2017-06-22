function [files, includepaths] = pResolveCustomCode(obj, modelName, userIncludePaths, userSrcFiles, userLibFiles, customCodeString)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    modelPath = getModelRootPath(modelName);
    % 16 18
    try
        [prevLastErr, prevLastErrId] = lasterr;
        % 19 23
        % 20 23
        % 21 23
        sfCustomCodeInfo = sf_rtw('get_custom_code_info', modelName);
        if not(isempty(sfCustomCodeInfo))
            userIncludePaths = horzcat(userIncludePaths, 10.0, sfCustomCodeInfo.userIncludeDirs);
            userSrcFiles = horzcat(userSrcFiles, 10.0, sfCustomCodeInfo.userSources);
            % 26 28
        end % if
    catch
        % 29 31
        lasterr(prevLastErr, prevLastErrId);
    end % try
    % 32 36
    % 33 36
    % 34 36
    parsedIncludePaths = do_tokenize(modelPath, userIncludePaths, 'custom include directory paths string', {});
    % 36 43
    % 37 43
    % 38 43
    % 39 43
    % 40 43
    % 41 43
    includepaths = parsedIncludePaths;
    % 43 45
    if not(isempty(modelPath))
        parsedIncludePaths = horzcat(parsedIncludePaths, cellhorzcat(modelPath));
    end % if
    % 47 49
    parsedIncludePaths = do_ordered_unique_paths(parsedIncludePaths);
    % 49 53
    % 50 53
    % 51 53
    mlPath = do_tokenize('', strrep(horzcat('"', path, '"'), ';', '";"'), '', {});
    filter = strncmp(mlPath, matlabroot, length(matlabroot));
    mlPath(filter) = [];
    searchPath = horzcat(parsedIncludePaths, mlPath);
    searchPath = do_ordered_unique_paths(searchPath);
    % 57 66
    % 58 66
    % 59 66
    % 60 66
    % 61 66
    % 62 66
    % 63 66
    % 64 66
    parsedSrcFiles = do_tokenize(modelPath, userSrcFiles, 'custom source files string', {});
    % 66 77
    % 67 77
    % 68 77
    % 69 77
    % 70 77
    % 71 77
    % 72 77
    % 73 77
    % 74 77
    % 75 77
    parsedLibFiles = do_tokenize(modelPath, userLibFiles, 'custom libraries string', searchPath);
    % 77 83
    % 78 83
    % 79 83
    % 80 83
    % 81 83
    custcodefiles = i_parse_includestatements(customCodeString, modelPath, searchPath);
    % 83 87
    % 84 87
    % 85 87
    files = horzcat(parsedSrcFiles, parsedLibFiles, custcodefiles);
    % 87 122
    % 88 122
    % 89 122
    % 90 122
    % 91 122
    % 92 122
    % 93 122
    % 94 122
    % 95 122
    % 96 122
    % 97 122
    % 98 122
    % 99 122
    % 100 122
    % 101 122
    % 102 122
    % 103 122
    % 104 122
    % 105 122
    % 106 122
    % 107 122
    % 108 122
    % 109 122
    % 110 122
    % 111 122
    % 112 122
    % 113 122
    % 114 122
    % 115 122
    % 116 122
    % 117 122
    % 118 122
    % 119 122
    % 120 122
end % function
function result = getModelRootPath(modelName)
    % 123 127
    % 124 127
    % 125 127
    fileName = which(modelName);
    % 127 129
    if strcmp(fileName, 'new Simulink model')
        % 129 134
        % 130 134
        % 131 134
        % 132 134
        genModel = rtwattic('AtticData', 'GenModelHdl');
        if ishandle(genModel)
            blockHandle = rtwattic('AtticData', 'OrigBlockHdl');
            if ishandle(blockHandle)
                fileName = bdroot(getfullname(blockHandle));
                fileName = which(fileName);
            end % if
        end % if
    end % if
    result = fileparts(fileName);
end % function
function [tokenList, errorStr] = do_tokenize(rootDirectory, str, description, searchDirectories)
    % 145 156
    % 146 156
    % 147 156
    % 148 156
    % 149 156
    % 150 156
    % 151 156
    % 152 156
    % 153 156
    % 154 156
    [tokenList, errorStr] = sf('Private', 'tokenize', rootDirectory, str, description, searchDirectories);
end % function
function orderedList = do_ordered_unique_paths(orderedList)
    % 158 162
    % 159 162
    % 160 162
    if ispc
        orderedList = RTW.unique(orderedList, 'ignorecase', 'removetrailingfilesep');
    else
        % 164 166
        orderedList = RTW.unique(orderedList);
    end % if
end % function
function files = i_parse_includestatements(customCodeString, rootDirectory, searchDirectories)
    % 169 180
    % 170 180
    % 171 180
    % 172 180
    % 173 180
    % 174 180
    % 175 180
    % 176 180
    % 177 180
    % 178 180
    [s, e] = regexp(customCodeString, '#include\s*\"[^\"\n]+\"');
    % 180 182
    files = {};
    % 182 184
    for jj=1.0:length(s)
        includeStr = customCodeString(s(jj):e(jj));
        [s1, e1] = regexp(includeStr, '\"[^\"]+\"', 'once');
        files{jj} = includeStr(plus(s1, 1.0):minus(e1, 1.0));
        % 187 189
        [foundFile, errorStr] = sf('Private', 'tokenize', rootDirectory, files{jj}, 'include file', searchDirectories);
        % 189 192
        % 190 192
        if isempty(errorStr)
            % 192 194
            files{jj} = foundFile{1.0};
        end % if
    end % for
    files = files(not(cellfun('isempty', files)));
end % function
