function fctInfo = rtw_get_tfl_cb_info(modelName, idx)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    try
        hRtwFcnLib = get_param(modelName, 'TargetFcnLibHandle');
        % 11 12
        if isempty(hRtwFcnLib)
            DAStudio.error('RTW:buildProcess:loadObjectHandleError', 'TargetFcnLibhandle');
            % 14 15
        end % if
        % 16 17
        if eq(idx, -1.0)
            % 18 19
            fctInfo = length(hRtwFcnLib.TLCCallList);
        else
            implH = hRtwFcnLib.TLCCallList(idx);
            if eq(feature('RTWTargetFunctionLibrary'), 0.0)
                fctInfo = struct('genCallback', implH.genCallback, 'FcnName', implH.ImplementName, 'FileName', implH.genFileName, 'FcnType', implH.OutDataType, 'HdrFile', implH.HeaderFile, 'NumInputs', implH.NumInputs);
            else
                % 25 29
                % 26 29
                % 27 29
                % 28 29
                % 29 30
                fctInfo = struct('genCallback', implH.GenCallback, 'FcnName', implH.Prototype.ImplName, 'FileName', implH.GenFileName, 'FcnType', implH.Prototype.Return.toString(), 'HdrFile', implH.Prototype.HeaderFile, 'NumInputs', implH.Prototype.NumInputs);
                % 31 36
                % 32 36
                % 33 36
                % 34 36
                % 35 36
            end % if
        end % if
    catch
        rethrow(lasterror);
    end % try
end % function
