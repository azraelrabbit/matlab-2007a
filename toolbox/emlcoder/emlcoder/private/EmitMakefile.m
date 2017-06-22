function EmitMakefile(buildInfo, fragName, compilerInfo)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    projName = GetTokenValue(buildInfo, 'EMC_PROJECT');
    if isempty(projName)
        projName = 'Untitled';
    end % if
    if ispc
        gen_batfile(buildInfo, projName, compilerInfo);
    else
        gen_shfile(buildInfo, projName);
    end % if
    gen_makefile(buildInfo, fragName, projName);
function gen_batfile(buildInfo, projName, compilerInfo)
    % 16 19
    % 17 19
    file = OpenSupportFile(buildInfo, horzcat(projName, '_make.bat'));
    buildDirs = buildInfo.getSourcePaths(true, {'BuildDir'});
    buildDir = buildDirs{1.0};
    mexTarget = GetTokenValue(buildInfo, 'MODEL_NAME', 'BuildArgs');
    arch = computer('arch');
    fprintf(file, '@echo off\n');
    fprintf(file, 'set MATLAB=%s\n', emcAltPathName(matlabroot));
    fprintf(file, 'set MATLAB_ARCH=%s\n', arch);
    fprintf(file, 'set MATLAB_BIN="%s"\n', fullfile(matlabroot, 'bin'));
    fprintf(file, 'set ENTRYPOINT=mexFunction\n');
    fprintf(file, 'set OUTDIR=%s\\\n', buildDir);
    fprintf(file, 'set LIB_NAME=%s\n', mexTarget);
    fprintf(file, 'set MEX_NAME=%s\n', mexTarget);
    fprintf(file, 'set MEX_EXT=.%s\n', mexext);
    fprintf(file, 'call "%s"\n', compilerInfo.mexOptsFile);
    gen_makeifile(buildInfo, file, projName);
    if strcmp(arch, 'win32')
        gmake = fullfile(matlabroot, 'rtw', 'bin', arch, 'gmake');
    else
        gmake = 'gmake';
    end % if
    fprintf(file, '"%s" -f %s\n', gmake, horzcat(projName, '_make.mk'));
    fclose(file);
function gen_shfile(buildInfo, projName)
    % 42 47
    % 43 47
    % 44 47
    % 45 47
    file = OpenSupportFile(buildInfo, horzcat(projName, '_make.sh'));
    fprintf(file, 'MATLAB="%s"\n', matlabroot);
    fprintf(file, 'Arch=%s\n', computer('arch'));
    fprintf(file, 'ENTRYPOINT=mexFunction\n');
    fprintf(file, 'MAPFILE=$ENTRYPOINT''.map''\n');
    fprintf(file, 'PREFDIR="%s"\n', prefdir);
    % 52 54
    gen_determine_options_file(file);
    % 54 56
    fprintf(file, '. $OPTIONS_FILE\n');
    fprintf(file, 'COMPILER=$CC\n');
    fprintf(file, '. $OPTIONS_FILE\n');
    gen_makeifile(buildInfo, file, projName);
    fprintf(file, 'gmake -f %s\n', horzcat(projName, '_make.mk'));
    fclose(file);
function gen_determine_options_file(file)
    % 62 66
    % 63 66
    % 64 66
    fprintf(file, 'OPTSFILE_NAME=mexopts.sh\n');
    fprintf(file, 'if [ -f ./$OPTSFILE_NAME ]; then\n');
    fprintf(file, '  OPTIONS_FILE="%s"\n', './$OPTSFILE_NAME');
    fprintf(file, 'elif [ -f "$PREFDIR/$OPTSFILE_NAME" ]; then\n');
    fprintf(file, '  OPTIONS_FILE="%s"\n', '$PREFDIR/$OPTSFILE_NAME');
    fprintf(file, 'elif [ -f "$MATLAB/bin/$OPTSFILE_NAME" ]; then\n');
    fprintf(file, '  OPTIONS_FILE="%s"\n', '$MATLAB/bin/$OPTSFILE_NAME');
    fprintf(file, 'else\n');
    fprintf(file, '  echo "Unable to locate mex options file"\n');
    fprintf(file, '  exit 1\n');
    fprintf(file, 'fi\n');
function gen_makeifile(buildInfo, file, projName)
    % 77 82
    % 78 82
    % 79 82
    % 80 82
    incFile = horzcat(projName, '_make.mki');
    if ispc
        fprintf(file, 'echo # Make settings for %s > %s\n', projName, incFile);
        envVars = {'COMPILER','COMPFLAGS','OPTIMFLAGS','DEBUGFLAGS','LINKER','LINKFLAGS','LINKOPTIMFLAGS','LINKDEBUGFLAGS','MATLAB_ARCH','BORLAND'};
        % 85 89
        % 86 89
        % 87 89
        for i=1.0:numel(envVars)
            varName = envVars{i};
            fprintf(file, 'echo %s=%%%s%%>> %s\n', varName, varName, incFile);
        end % for
    else
        fprintf(file, 'echo "# Make settings for %s" > %s\n', projName, incFile);
        envVars = {'CC','CFLAGS','CLIBS','COPTIMFLAGS','CDEBUGFLAGS','LD','LDFLAGS','LDOPTIMFLAGS','LDDEBUGFLAGS','Arch'};
        % 95 97
        for i=1.0:numel(envVars)
            varName = envVars{i};
            fprintf(file, 'echo "%s=$%s" >> %s\n', varName, varName, incFile);
        end % for
    end % if
    tokVars = {'EMC_COMPILER','EMC_CONFIG'};
    for i=1.0:numel(tokVars)
        tokName = tokVars{i};
        tokValue = GetTokenValue(buildInfo, tokName);
        if ispc
            fprintf(file, 'echo %s=%s>> %s\n', tokName, tokValue, incFile);
        else
            fprintf(file, 'echo "%s=%s" >> %s\n', tokName, tokValue, incFile);
        end % if
    end % for
function gen_makefile(buildInfo, fragName, projName)
    % 112 116
    % 113 116
    % 114 116
    file = gen_prologue(buildInfo, projName);
    % 116 118
    tmfContents = load_tmf(fragName);
    tmfContents = gen_incfiles(tmfContents, buildInfo);
    gen_libfiles(buildInfo, file);
    % 120 122
    gen_flags(file, buildInfo.getCompileFlags, 'COMP_FLAGS');
    gen_flags(file, buildInfo.getLinkFlags, 'LINK_FLAGS');
    % 123 125
    gen_epilogue(tmfContents, file);
    % 125 127
    fclose(file);
function gen_flags(file, flags, name)
    % 128 132
    % 129 132
    % 130 132
    if isempty(flags)
        flags = {};
    end % if
    if not(iscell(flags))
        flags = cellhorzcat(flags);
    end % if
    fprintf(file, '%s =', name);
    for i=1.0:numel(flags)
        fprintf(file, ' %s', flags{i});
    end % for
    fprintf(file, '\n\n');
function file = gen_prologue(buildInfo, projName)
    filename = horzcat(projName, '_make.mk');
    file = OpenSupportFile(buildInfo, filename);
    fprintf(file, 'MATLAB_ROOT = %s\n', emcAltPathName(matlabroot));
    fprintf(file, 'MAKEFILE = %s\n', filename);
    % 147 149
    fprintf(file, '\n');
    fprintf(file, 'include %s\n', horzcat(projName, '_make.mki'));
    fprintf(file, '\n');
    gen_definitions(buildInfo, file);
    % 152 154
    gen_srcfiles(buildInfo, file);
    % 154 156
    mexTarget = GetTokenValue(buildInfo, 'MODEL_NAME', 'BuildArgs');
    fprintf(file, 'MEX_FILE_NAME_WO_EXT = %s\n', mexTarget);
    fprintf(file, 'MEX_FILE_NAME = $(MEX_FILE_NAME_WO_EXT).%s\n', mexext);
    % 158 160
    fprintf(file, 'TARGET = $(MEX_FILE_NAME)\n');
function tmfContents = load_tmf(fragName)
    % 161 165
    % 162 165
    % 163 165
    if eq(exist(fragName, 'file'), 2.0)
        fragFile = fragName;
    else
        fragFile = fullfile(matlabroot, 'toolbox', 'emlcoder', 'emlcoder', 'private', fragName);
    end % if
    fid = fopen(fragFile, 'rt');
    if eq(fid, -1.0)
        error('emlcoder:build:fileIOError', 'Unable to open "%s"', fragFile);
    end % if
    tmfContents = fread(fid, [1.0 Inf], '*char');
    fclose(fid);
function gen_epilogue(tmfContents, file)
    % 176 180
    % 177 180
    % 178 180
    fprintf(file, '\n');
    fprintf(file, '%s', tmfContents);
function gen_definitions(buildInfo, file)
    % 182 186
    % 183 186
    % 184 186
    tokKeys = get(buildInfo.Tokens, 'Key');
    tokVals = get(buildInfo.Tokens, 'Value');
    tokGroups = get(buildInfo.Tokens, 'Group');
    if isempty(tokKeys)
        tokKeys = {};
        tokVals = {};
        tokGroups = {};
    end % if
    if not(iscell(tokKeys))
        tokKeys = cellhorzcat(tokKeys);
        tokVals = cellhorzcat(tokVals);
        tokGroups = cellhorzcat(tokGroups);
    end % if
    tokIdx = find(eq(strcmp(tokGroups, 'Emit'), 1.0));
    for i=1.0:numel(tokIdx)
        fprintf(file, '%s = %s\n', tokKeys{tokIdx(i)}, tokVals{tokIdx(i)});
    end % for
function gen_srcfiles(buildInfo, file)
    % 203 207
    % 204 207
    % 205 207
    fprintf(file, '\n');
    fprintf(file, 'SRC_FILES = ');
    concatenatePaths = false;
    replaceMatlabroot = true;
    srcFiles = buildInfo.getSourceFiles(concatenatePaths, replaceMatlabroot);
    for i=1.0:numel(srcFiles)
        fprintf(file, ' \\\n\t%s', srcFiles{i});
    end % for
    fprintf(file, '\n');
    fprintf(file, '\n');
function tmfContents = gen_incfiles(tmfContents, buildInfo)
    % 217 221
    % 218 221
    % 219 221
    incDirs = get(buildInfo.Inc.Paths, 'Value');
    if isempty(incDirs)
        incDirs = {};
    end % if
    if not(iscell(incDirs))
        incDirs = cellhorzcat(incDirs);
    end % if
    matroot = regexprep(matlabroot, '[\\/]', filesep);
    tmfContents = ExpandRule(tmfContents, incDirs, '|>START_EXPAND_INCLUDES<|', '|>END_EXPAND_INCLUDES<|', '|>EXPAND_DIR_NAME<|', matroot);
    % 229 235
    % 230 235
    % 231 235
    % 232 235
    % 233 235
    srcDirs = get(buildInfo.Src.Paths, 'Value');
    if isempty(srcDirs)
        srcDirs = {};
    end % if
    if not(iscell(srcDirs))
        srcDirs = cellhorzcat(srcDirs);
    end % if
    tmfContents = ExpandRule(tmfContents, srcDirs, '|>START_EXPAND_RULES<|', '|>END_EXPAND_RULES<|', '|>EXPAND_DIR_NAME<|', matroot);
    % 242 244
function gen_libfiles(buildInfo, file)
    % 244 249
    % 245 249
    % 246 249
    % 247 249
    libList = get(buildInfo.LinkObj, 'Name');
    libGroups = get(buildInfo.LinkObj, 'Group');
    libPaths = get(buildInfo.LinkObj, 'Path');
    libLinkOnlys = get(buildInfo.LinkObj, 'LinkOnly');
    % 252 258
    % 253 258
    % 254 258
    % 255 258
    % 256 258
    if isempty(libList)
        libList = {};
        libGroups = {};
        libPaths = {};
        libLinkOnlys = {};
        % 262 264
    end % if
    if not(iscell(libList))
        libList = cellhorzcat(libList);
        libGroups = cellhorzcat(libGroups);
        libPaths = cellhorzcat(libPaths);
    else
        libLinkOnlys = horzcat(libLinkOnlys{:});
        % 270 272
    end % if
    % 272 274
    fprintf(file, '\n');
    libs = unique(libGroups);
    if isempty(libs)
        libs = {};
    end % if
    if not(iscell(libs))
        libs = cellhorzcat(libs);
    end % if
    for i=1.0:numel(libs)
        libIdx = find(eq(strcmp(libGroups, libs{i}), 1.0));
        fprintf(file, '%s_LIBS = ', libs{i});
        for j=1.0:numel(libIdx)
            idx = libIdx(j);
            if eq(libLinkOnlys(idx), 1.0)
                objName = fullfile(libPaths{idx}, libList{idx});
                fprintf(file, '"%s" ', objName);
            end % if
        end % for
        fprintf(file, '\n');
    end % for
    fprintf(file, 'SYS_LIBS = ');
    for i=1.0:numel(libs)
        fprintf(file, '$(%s_LIBS) ', libs{i});
    end % for
    fprintf(file, '\n\n');
    bldIdx = find(eq(libLinkOnlys, 0.0));
    if isempty(bldIdx)
        bldIdx = {};
    end % if
    if not(iscell(bldIdx))
        bldIdx = cellhorzcat(bldIdx);
    end % if
    for i=1.0:numel(bldIdx)
        idx = bldIdx{i};
        concatenatePaths = true;
        replaceMatlabroot = true;
        linkObj = buildInfo.LinkObj(idx);
        srcFiles = linkObj.getSourceFiles(concatenatePaths, replaceMatlabroot);
        if isempty(srcFiles)
            srcFiles = {};
        end % if
        if not(iscell(srcFiles))
            srcFiles = cellhorzcat(srcFiles);
        end % if
        objName = libList{idx};
        fprintf(file, 'OBJLIST += %s\n', objName);
        fprintf(file, '%s:', objName);
        for f=1.0:numel(srcFiles)
            srcName = emlAltPathName(srcFiles{f});
            fprintf(file, ' %s', srcName);
        end % for
        fprintf(file, '\n');
    end % for
function tmfContents = ExpandRule(tmfContents, directories, startToken, endToken, dirToken, matroot)
    % 327 330
    % 328 330
    lengthStartToken = length(startToken);
    lengthEndToken = length(endToken);
    % 331 333
    startPos = findstr(tmfContents, startToken);
    endPos = findstr(tmfContents, endToken);
    % 334 336
    numOfStart = length(startPos);
    numOfEnd = length(endPos);
    % 337 339
    if ne(numOfStart, numOfEnd)
        if gt(numOfStart, numOfEnd)
            error('EMC:buildProcess:tmfSyntaxErrorMissingToken', endToken);
        else
            error('EMC:buildProcess:tmfSyntaxErrorMissingToken', startToken);
            % 343 345
        end % if
    end % if
    % 346 348
    for i=1.0:numOfStart
        expandedRule = '';
        if gt(startPos(i), endPos(i))
            error('EMC:buildProcess:tmfSyntaxErrorDuplicateToken', endToken, startToken);
        end % if
        % 352 354
        tmfRule = tmfContents(plus(startPos(i), lengthStartToken):minus(endPos(i), 1.0));
        % 354 361
        % 355 361
        % 356 361
        % 357 361
        % 358 361
        % 359 361
        try
            % 361 366
            % 362 366
            % 363 366
            % 364 366
            regexpMatRoot = strrep(matroot, '\', '\\');
            if ispc
                relativeDirectories = regexprep(directories, regexpMatRoot, '$(MATLAB_ROOT)', 'ignorecase');
            else
                % 369 371
                relativeDirectories = regexprep(directories, regexpMatRoot, '$(MATLAB_ROOT)');
                % 371 373
            end % if
        catch
            % 374 377
            % 375 377
            relativeDirectories = '';
            lasterr('');
        end % try
        % 379 381
        if not(isempty(relativeDirectories))
            spcIdx = not(cellfun(@isempty, strfind(relativeDirectories, ' ')));
            % 382 384
            relativeDirectories(spcIdx) = RTW.transformPaths(relativeDirectories(spcIdx));
            % 384 386
        end % if
        % 386 388
        for j=1.0:length(relativeDirectories)
            expandedRule = horzcat(expandedRule, char(strrep(tmfRule, dirToken, relativeDirectories{j})));
            % 389 393
            % 390 393
            % 391 393
        end % for
        % 393 395
        tmpStartPos = minus(startPos(i), 1.0);
        tmpEndPos = plus(endPos(i), lengthEndToken);
        tmfContents = horzcat(tmfContents(1.0:tmpStartPos), expandedRule, tmfContents(tmpEndPos:end));
        % 397 400
        % 398 400
        expRuleOffset = plus(plus(minus(length(expandedRule), tmpEndPos), tmpStartPos), 1.0);
        for j=i:numOfStart
            startPos(j) = plus(startPos(j), expRuleOffset);
            endPos(j) = plus(endPos(j), expRuleOffset);
        end % for
    end % for
