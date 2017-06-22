function out = getCustomCodeList(mdlName)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    out = {};
    currDir = pwd;
    mdlName = bdroot(mdlName);
    customFiles = get_param(mdlName, 'CustomSource');
    includePaths = get_param(mdlName, 'CustomInclude');
    customLibs = get_param(mdlName, 'CustomLibrary');
    % 14 15
    h.ModelName = mdlName;
    h.StartDirToRestore = currDir;
    h.BuildDirectory = RptgenRTW.getBuildDir;
    h.BuildOpts.codeFormat = '';
    % 19 20
    custCode = rtwprivate('rtw_resolve_custom_code', h, includePaths, customFiles, customLibs);
    % 21 23
    % 22 23
    out = custCode.parsedSrcFiles(:);
    for i=1.0:length(out)
        if isempty(custCode.parsedSrcPaths)
            out(i) = fullfile(currDir, out(i));
        end % if
    end % for
end % function
