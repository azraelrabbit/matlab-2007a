function val = rtw_gen_shared_utils(modelName)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    val = false;
    % 20 21
    h = get_param(modelName, 'MakeRTWSettingsObject');
    % 22 23
    if isempty(h)
        % 24 25
        return;
    end % if
    % 27 28
    if strcmp(get_param(modelName, 'UtilityFuncGeneration'), 'Shared location')
        mdlForceSharedLoc = true;
    else
        mdlForceSharedLoc = false;
    end % if
    % 33 34
    infoStruct = rtwprivate('rtwinfomatman', h.StartDirToRestore, 'load', 'binary', h.ModelName, h.MdlRefBuildArgs.ModelReferenceTargetType);
    % 35 37
    % 36 37
    if not(strcmp(h.MdlRefBuildArgs.ModelReferenceTargetType, 'NONE')) || not(isempty(infoStruct.modelRefs)) || mdlForceSharedLoc
        % 38 39
        val = true;
    end % if
end % function
