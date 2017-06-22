function [tlcArgs, gensettings, rtwVerbose] = ConfigForTLC(h)
    % 1 24
    % 2 24
    % 3 24
    % 4 24
    % 5 24
    % 6 24
    % 7 24
    % 8 24
    % 9 24
    % 10 24
    % 11 24
    % 12 24
    % 13 24
    % 14 24
    % 15 24
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    [nu, gensettings] = rtwprivate('getSTFInfo', [], 'getCachedValues', true);
    % 24 26
    matFileLogging = str2double(gensettings.matFileLogging);
    % 26 29
    % 27 29
    configset = getActiveConfigSet(h.ModelHandle);
    configset.extraOptions = RetainStackOptions(getProp(configset, 'TLCOptions'));
    rtwOptions = get_param(h.ModelHandle, 'RTWOptions');
    configset.extraOptions = '';
    % 32 34
    rtwOptionsArray = rtwprivate('optstr_struct', rtwOptions);
    optionsArray = rtwOptionsArray;
    % 35 38
    % 36 38
    gensettings = CacheBuildDirectory(h, gensettings);
    set_param(h.ModelHandle, 'RTWGenSettings', locGetCSParamFields(gensettings));
    % 39 44
    % 40 44
    % 41 44
    % 42 44
    modelName = h.ModelName;
    % 44 46
    LocMapSolverToTargetType(h, h.ModelHandle, get_param(h.ModelHandle, 'Solver'), gensettings.tlcTargetType);
    % 46 52
    % 47 52
    % 48 52
    % 49 52
    % 50 52
    language = 'C';
    if not(strcmp(gensettings.tlcLanguage, language))
        DAStudio.error('RTW:makertw:tlcLanguageMismatch', gensettings.tlcLanguage, modelName, language);
        % 54 56
    end % if
    % 56 60
    % 57 60
    % 58 60
    if rtwprivate('isval', optionsArray, 'name', 'RTWVerbose')
        location = rtwprivate('array_index', optionsArray, 'name', 'RTWVerbose');
        rtwVerbose = str2double(optionsArray(location).value);
    else
        % 63 67
        % 64 67
        % 65 67
        rtwVerbose = 1.0;
    end % if
    % 68 75
    % 69 75
    % 70 75
    % 71 75
    % 72 75
    % 73 75
    extraOptions = [];
    % 75 77
    opt.name = 'InlineParameters';
    opt.value = strcmp(get_param(h.ModelHandle, 'RTWInlineParameters'), 'on');
    extraOptions = horzcat(extraOptions, ' -a', opt.name, '=', num2str(opt.value));
    % 79 81
    mdlRef = eq(strcmpi(h.MdlRefBuildArgs.ModelReferenceTargetType, 'NONE'), 0.0);
    if eq(matFileLogging, 0.0) || mdlRef
        % 82 89
        % 83 89
        % 84 89
        % 85 89
        % 86 89
        % 87 89
        set_param(configset, 'MatFileLogging', 'off');
        extraOptions = horzcat(extraOptions, ' -aMatFileLogging=0');
    else
        set_param(configset, 'MatFileLogging', 'on');
        extraOptions = horzcat(extraOptions, ' -aMatFileLogging=1');
    end % if
    % 94 96
    extraOptions = strtrim(extraOptions);
    extraOptionsArray = rtwprivate('optstr_struct', extraOptions);
    % 97 99
    optionsArray = rtwprivate('combinestruct', optionsArray, extraOptionsArray, 'name');
    % 99 103
    % 100 103
    % 101 103
    if not(mdlRef)
        tlcArgsFromMakeArgs = LocMapMakeVarsToTLCVars(h, h.BuildArgs);
        if not(isempty(tlcArgsFromMakeArgs))
            tlcArgsFromMakeArgs = strtrim(tlcArgsFromMakeArgs);
        end % if
        tlcFromMakeArray = rtwprivate('optstr_struct', tlcArgsFromMakeArgs);
        % 108 110
        optionsArray = rtwprivate('combinestruct', optionsArray, tlcFromMakeArray, 'name');
        % 110 112
        for i=1.0:length(tlcFromMakeArray)
            if strcmp(tlcFromMakeArray(i).name, 'MatFileLogging')
                set_param(configset, 'MatFileLogging', str2double(tlcFromMakeArray(i).value));
            end % if
        end % for
    end % if
    % 117 120
    % 118 120
    tlcArgs = get_param(h.ModelHandle, 'TLCOptions');
    tlcArgs = horzcat(rtwprivate('struct_optstr', optionsArray), ' ', tlcArgs);
    % 121 128
    % 122 128
    % 123 128
    % 124 128
    % 125 128
    % 126 128
    idx = findstr(tlcArgs, '-aInlineParameters=1');
    val = 'on';
    if isempty(idx)
        val = 'off';
    end % if
    set_param(h.ModelHandle, 'RTWInlineParameters', val);
    % 133 135
    setRTWOptions(getActiveConfigSet(h.ModelHandle), tlcArgs);
    tlcArgs = configset.getStringRepresentation('tlc_options');
end % function
function gensettings = CacheBuildDirectory(h, gensettings)
    % 138 141
    % 139 141
    if strcmpi(h.MdlRefBuildArgs.ModelReferenceTargetType, 'NONE')
        h.BuildDirectory = gensettings.BuildDirectory;
        h.GeneratedTLCSubDir = gensettings.GeneratedTLCSubDir;
        % 143 149
        % 144 149
        % 145 149
        % 146 149
        % 147 149
        if not(isempty(gensettings.relativePathToAnchor))
            rtwprivate('rtwinfomatman', pwd, 'updateField', 'minfo', h.ModelName, 'NONE', 'relativePathToAnchor', gensettings.relativePathToAnchor);
            % 150 153
            % 151 153
        end % if
    else
        infoStruct = rtwprivate('rtwinfomatman', pwd, 'load', 'minfo', h.ModelName, h.MdlRefBuildArgs.ModelReferenceTargetType);
        % 155 158
        % 156 158
        gensettings.RelativeBuildDir = infoStruct.srcCoreDir;
        h.BuildDirectory = fullfile(pwd, gensettings.RelativeBuildDir);
        h.GeneratedTLCSubDir = fullfile('tmwinternal', 'tlc');
    end % if
end % function
function y = RetainStackOptions(options)
    % 163 169
    % 164 169
    % 165 169
    % 166 169
    % 167 169
    y = '';
    stackOptions = {'MaxStackSize','MaxStackVariableSize','DivideStackByRate','ProtectCallInitFcnTwice','ProfileGenCode'};
    % 170 176
    % 171 176
    % 172 176
    % 173 176
    % 174 176
    optionsStruct = rtwprivate('optstr_struct', options);
    for i=1.0:size(optionsStruct, 2.0)
        for j=1.0:size(stackOptions, 2.0)
            if strcmp(optionsStruct(i).name, stackOptions{j})
                y = horzcat(y, '-a', stackOptions{j}, '=', optionsStruct(i).value, ' ');
            end % if
        end % for
    end % for
end % function
function csParam = locGetCSParamFields(genSet)
    % 185 196
    % 186 196
    % 187 196
    % 188 196
    % 189 196
    % 190 196
    % 191 196
    % 192 196
    % 193 196
    % 194 196
    csParam = [];
    % 196 202
    % 197 202
    % 198 202
    % 199 202
    % 200 202
    omitFields = {'tlcTargetType','tlcLanguage','matFileLogging','ModelReferenceTargetType','GeneratedTLCSubDir','relativePathToAnchor','mdlRefRelativeBuildDir','BuildDirectory','SystemTargetFile','model'};
    % 202 213
    % 203 213
    % 204 213
    % 205 213
    % 206 213
    % 207 213
    % 208 213
    % 209 213
    % 210 213
    % 211 213
    curFields = fields(genSet);
    % 213 215
    saveFields = setdiff(curFields, omitFields);
    % 215 217
    for i=1.0:length(saveFields)
        eval(horzcat('csParam.', saveFields{i}, ' = genSet.', saveFields{i}, ';'));
    end % for
end % function
