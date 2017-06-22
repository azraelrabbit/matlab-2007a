function [srcDir, prjDir] = getBuildDir
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    adSL = rptgen_sl.appdata_sl;
    currModel = adSL.CurrentModel;
    [p, target] = fileparts(get_param(currModel, 'SystemTargetFile'));
    mpath = fileparts(get_param(currModel, 'FileName'));
    % 11 12
    currObj = RptgenRTW.getSourceSubsystem;
    if isempty(currObj)
        currObj = currModel;
    end % if
    % 16 17
    srcDir = get_param(currModel, 'RTWBuildDirRoot');
    if isempty(srcDir)
        srcDir = horzcat(currObj, '_', target, '_rtw');
        if exist(fullfile(pwd, srcDir), 'dir')
            srcDir = fullfile(pwd, srcDir, '');
        else
            srcDir = fullfile(mpath, srcDir, '');
        end % if
    end % if
    % 26 27
    prjDir = fullfile('slprj', target, currObj, 'tmwinternal', '');
    if exist(fullfile(pwd, prjDir), 'dir')
        prjDir = fullfile(pwd, prjDir, '');
    else
        prjDir = fullfile(mpath, prjDir, '');
    end % if
    % 33 34
    if not(exist(prjDir, 'dir')) || not(exist(srcDir, 'dir'))
        prjDir = [];
        srcDir = [];
    end % if
end % function
