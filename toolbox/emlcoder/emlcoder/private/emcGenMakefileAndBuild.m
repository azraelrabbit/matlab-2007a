function makelog = emcGenMakefileAndBuild(project, buildInfo)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    checkArgs(project, buildInfo);
    % 8 9
    target = 'mex';
    if not(isempty(project.ConfigSet)) && not(isempty(project.ConfigSet.CompilerOptions))
        target = lower(project.ConfigSet.CompilerOptions.CodingTarget);
    end % if
    switch target
    case 'mex'
        makelog = emcBuildMEX(project, buildInfo);
    case {'rtw','rtw:lib','rtw:exe'}
        makelog = emcBuildRTW(project, buildInfo);
    otherwise
        error('emlcoder:build:target', 'Unrecognized compilation target');
    end % switch
end % function
function checkArgs(project, buildInfo)
    % 23 26
    % 24 26
    % 25 26
    if ne(nargin, 2.0)
        error('emlcoder:build', 'Project and BuildInfo arguments required');
    end % if
    if not(isa(project, 'emlcoder.Project'))
        error('emlcoder:build', 'Expected a Project argument');
    end % if
    if not(isa(buildInfo, 'RTW.BuildInfo'))
        error('emlcoder:build', 'Expected a BuildInfo argument');
    end % if
    % 35 36
    srcFiles = buildInfo.getSourceFiles(true, true);
    if isempty(srcFiles)
        error('emlcoder:build', 'Nothing to build');
    end % if
end % function
