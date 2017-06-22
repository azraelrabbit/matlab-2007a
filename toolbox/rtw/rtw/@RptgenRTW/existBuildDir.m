function out = existBuildDir
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    try
        [buildDir, prjDir] = RptgenRTW.getBuildDir;
    catch
        out = false;
        return
    end % try
    % 12 14
    if exist(buildDir, 'dir') && exist(prjDir, 'dir')
        out = true;
    else
        out = false;
    end
end
