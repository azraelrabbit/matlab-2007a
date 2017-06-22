function CleanupForExit(h, varargin)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    if gt(nargin, 1.0)
        activeCodeObj = getActiveCode(h.modelName);
        if not(isempty(activeCodeObj))
            activeCodeObj.refresh(varargin{1.0});
        end % if
    end % if
    % 19 21
    % 20 21
    configSet = getActiveConfigSet(h.ModelName);
    unlock(configSet);
    hDlg = get_param(h.ModelName, 'SimPrmDialog');
    if not(isempty(hDlg)) && isa(hDlg, 'DAStudio.Dialog')
        refresh(hDlg);
    end % if
    % 27 29
    % 28 29
    cleanRestore(h);
    % 30 32
    % 31 32
    if not(isempty(h.StartDirToRestore))
        cd(h.StartDirToRestore);
    end % if
    % 35 37
    % 36 37
    feature('RTWCodeReuse', h.CodeReuse);
    % 38 40
    % 39 40
    if not(strcmpi(h.MdlRefBuildArgs.ModelReferenceTargetType, 'NONE'))
        fullname = rtwprivate('rtwattic', 'getSourceSubsystemName');
    end % if
    rtwprivate('rtwattic', 'clean');
    % 44 45
    if not(strcmpi(h.MdlRefBuildArgs.ModelReferenceTargetType, 'NONE'))
        rtwprivate('rtwattic', 'setSourceSubsystemName', fullname);
    end % if
    % 48 49
    rtwprivate('getSTFInfo', [], 'clearCache', true);
    % 50 52
    % 51 52
    set_param(h.modelName, 'MakeRTWSettingsObject', []);
    % 53 55
    % 54 55
    recycle(h.OrigRecycleState);
    % 56 58
    % 57 58
    path(h.PathToRestore);
end % function
