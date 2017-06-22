function runFcnImpCallbacks(hRtwFcnLib, modelName, dispOpts, genDir)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if eq(length(hRtwFcnLib.MCallList), 0.0)
        return;
    end % if
    % 10 11
    dh = dispOpts.DispHook;
    % 12 14
    % 13 14
    for i=1.0:length(hRtwFcnLib.MCallList)
        implH = hRtwFcnLib.MCallList(i);
        fctInfo = struct('FcnName', implH.ImplementName, 'FcnType', implH.OutDataType, 'HdrFile', implH.HeaderFile, 'NumInputs', implH.NumInputs);
        % 17 20
        % 18 20
        % 19 20
        try
            feval(implH.genCallback, modelName, fctInfo, genDir);
        catch
            feval(dh{:}, horzcat('###    Error invoking Library Function callback ', implH.genCallback));
            error('%s', lasterr);
        end % try
    end % for
end % function
