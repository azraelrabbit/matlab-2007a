function GetSystemTargetFile(h)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    [nu, gSet] = rtwprivate('getSTFInfo', h.ModelName, 'forceread', true, 'ModelReferenceTargetType', h.MdlRefBuildArgs.ModelReferenceTargetType);
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    h.SystemTargetFilename = gSet.SystemTargetFile;
    % 15 17
    % 16 17
    h.MakeRTWHookMFile = rtwprivate('rtw_hook_name', h.SystemTargetFilename, 'make_rtw');
    % 18 19
end % function
