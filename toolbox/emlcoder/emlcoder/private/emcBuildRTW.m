function makelog = emcBuildRTW(project, buildInfo)
    % 1 5
    % 2 5
    % 3 5
    makelog = [];
    % 5 7
    templateMakefile = emcGetTMF(project);
    projName = GetTokenValue(buildInfo, 'EMC_PROJECT');
    if isempty(projName)
        projName = 'Untitled';
    end % if
    ParseBuildArgs(project, buildInfo);
    emcPCGHook(project, buildInfo);
    % 13 15
    buildOpts.buildName = projName;
    buildOpts.makefileName = horzcat(projName, '_make.mk');
    buildOpts.RTWVerbose = project.ConfigSet.RTWConfig.RTWVerbose;
    buildOpts.generateCodeOnly = project.ConfigSet.RTWConfig.GenCodeOnly;
    buildOpts.codeFormat = 'E-Coder';
    buildOpts.mexOpts = [];
    buildOpts.installDirmexopts = [];
    buildOpts.PreferredTMF = [];
    buildOpts.CompilerName = [];
    buildOpts.compilerEnvVal = '';
    buildOpts.modules = getModuleList(buildInfo);
    % 25 27
    allModules = buildOpts.modules;
    modelModulesObj = change_file_ext(allModules);
    tmfToks = locNewTok('|>MAKEFILE_NAME<|', buildOpts.makefileName);
    tmfToks = horzcat(tmfToks, locNewTok('|>MODELREF_LINK_RSPFILE_NAME<|', horzcat(projName, '_ref.rsp')));
    tmfToks = horzcat(tmfToks, locNewTok('|>MODEL_MODULES<|', allModules));
    tmfToks = horzcat(tmfToks, locNewTok('|>MODEL_MODULES_OBJ<|', modelModulesObj));
    tmfToks = horzcat(tmfToks, locNewTok('|>COMPUTER<|', computer));
    tmfToks = horzcat(tmfToks, locNewTok('|>MEXEXT<|', mexext));
    tmfToks = horzcat(tmfToks, locNewTok('|>TGT_FCN_LIB<|', project.ConfigSet.RTWConfig.GenFloatMathFcnCalls));
    buildInfo.addTMFTokens(cellhorzcat(tmfToks(:).token), cellhorzcat(tmfToks(:).value), cellhorzcat(tmfToks(:).group));
    % 36 38
    targetDir = emcAltPathName(project.OutDirectory);
    buildInfo.addBuildArgs('RELATIVE_PATH_TO_ANCHOR', targetDir);
    targetName = GetTokenValue(buildInfo, 'MODEL_NAME', 'BuildArgs');
    if ispc
        mdlLibSuffix = '.lib';
        mdlObjSuffix = '.obj';
    else
        mdlLibSuffix = '.a';
        mdlObjSuffix = '.o';
    end % if
    modelLibName = horzcat(targetName, mdlLibSuffix);
    buildInfo.addBuildArgs('MODELLIB', modelLibName);
    % 49 51
    modelObjName = horzcat(targetName, mdlObjSuffix);
    removeOldTarget(project.BldDirectory, modelObjName);
    switch lower(project.ConfigSet.CompilerOptions.CodingTarget)
    case 'rtw:lib'
        removeOldTarget(project.BldDirectory, modelLibName);
    end % switch
    % 56 58
    gen_tmwfile(buildInfo, templateMakefile, projName);
    gen_rspfile(buildInfo, projName);
    % 59 61
    if project.ConfigSet.RTWConfig.GenerateMakefile
        locGenMakefileAndBuild(buildInfo, templateMakefile, buildOpts);
    end % if
function [status, result] = removeOldTarget(targetDir, targetName)
    % 64 68
    % 65 68
    % 66 68
    status = 0.0;
    result = [];
    try
        [status, result] = emcRemoveFile(targetDir, targetName);
    catch
        status = 1.0;
        disp(result);
        result = 'Unable to remove previous file version';
        rethrow(lasterror);
    end % try
function ParseBuildArgs(project, buildInfo)
    % 78 82
    % 79 82
    % 80 82
    buildArgs = project.ConfigSet.RTWConfig.MakeCommand;
    sp = findstr(buildArgs, ' ');
    if not(isempty(sp))
        buildArgs(1.0:sp(1.0)) = [];
        buildInfo.MakeArgs = horzcat(buildInfo.MakeArgs, ' ', buildArgs);
    end % if
function buildResults = locGenMakefileAndBuild(buildInfo, templateMakefile, buildOpts)
    % 88 92
    % 89 92
    % 90 92
    buildDirs = buildInfo.getSourcePaths(true, {'BuildDir'});
    buildDir = buildDirs{1.0};
    oldDir = cd(buildDir);
    try
        % 95 99
        % 96 99
        % 97 99
        buildResults = RTW.genMakefileAndBuild(buildInfo, templateMakefile, buildOpts);
    catch
        buildResults = [];
        cd(oldDir);
        rethrow(lasterror);
    end % try
    cd(oldDir);
function modules = getModuleList(buildInfo)
    % 106 110
    % 107 110
    % 108 110
    concatenatePaths = false;
    replaceMatlabroot = true;
    modules = '';
    sources = buildInfo.getSourceFiles(concatenatePaths, replaceMatlabroot);
    for i=1.0:length(sources)
        modules = horzcat(modules, horzcat(sources{i}, ' '));
    end % for
function gen_tmwfile(buildInfo, templateMakefile, projName)
    % 117 121
    % 118 121
    % 119 121
    file = OpenSupportFile(buildInfo, 'rtw_proj.tmw');
    fprintf(file, 'Real-Time Workshop project for %s using %s. MATLAB root = %s.\n', projName, templateMakefile, matlabroot);
    % 122 124
    fclose(file);
function gen_rspfile(buildInfo, projName)
    % 125 129
    % 126 129
    % 127 129
    file = OpenSupportFile(buildInfo, horzcat(projName, '_ref.rsp'));
    fclose(file);
function result = change_file_ext(filenames)
    % 131 136
    % 132 136
    % 133 136
    % 134 136
    result = filenames;
    % 136 138
    if isempty(filenames)
        return;
    end % if
    % 140 142
    if ne(filenames(length(filenames)), ' ')
        filenames = horzcat(filenames, ' ');
    end % if
    % 144 146
    filenames = strrep(filenames, '.c ', '.obj ');
    filenames = strrep(filenames, '.C ', '.obj ');
    filenames = strrep(filenames, '.cpp ', '.obj ');
    filenames = strrep(filenames, '.CPP ', '.obj ');
    % 149 151
    result = filenames;
function tok = locNewTok(new_tok, new_val, varargin)
    % 152 157
    % 153 157
    % 154 157
    % 155 157
    if eq(nargin, 4.0)
        group = varargin{1.0};
    else
        group = '';
    end % if
    tok.token = new_tok;
    tok.value = new_val;
    tok.group = group;
