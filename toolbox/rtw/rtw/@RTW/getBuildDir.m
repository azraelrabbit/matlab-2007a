function info = getBuildDir(model)
    % 1 22
    % 2 22
    % 3 22
    % 4 22
    % 5 22
    % 6 22
    % 7 22
    % 8 22
    % 9 22
    % 10 22
    % 11 22
    % 12 22
    % 13 22
    % 14 22
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    % 21 22
    if not(ischar(model))
        DAStudio.error('RTW:utility:invalidArgType', 'char array');
    end % if
    % 25 26
    if ne(exist(model, 'file'), 4.0)
        DAStudio.error('RTW:utility:invalidModel', model);
    end % if
    % 29 31
    % 30 31
    load_system(model);
    % 32 33
    [nu, genSet] = rtwprivate('getSTFInfo', model, 'forceread', true, 'donotcache', true);
    % 34 37
    % 35 37
    % 36 37
    info.BuildDirectory = genSet.BuildDirectory;
    info.RelativeBuildDir = genSet.RelativeBuildDir;
    info.BuildDirSuffix = genSet.BuildDirSuffix;
    info.RelativeBuildDir = genSet.RelativeBuildDir;
    info.ModelRefRelativeBuildDir = genSet.mdlRefRelativeBuildDir;
    info.ModelRefDirSuffix = genSet.ModelReferenceDirSuffix;
end % function
