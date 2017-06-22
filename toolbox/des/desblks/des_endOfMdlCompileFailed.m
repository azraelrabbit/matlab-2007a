function des_endOfMdlCompileFailed(blockDiagramObj, listenerObj)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    persistent modelInfo;
    % 6 8
    mdlHndl = blockDiagramObj.handle;
    mdlName = blockDiagramObj.name;
    % 9 12
    % 10 12
    debug_catch_err = 0.0;
    % 12 14
    try
        feature('des_endOfMdlCompileFailed', mdlName);
    catch
        % 16 20
        % 17 20
        % 18 20
        if eq(debug_catch_err, 1.0)
            err = lasterr;
            error(horzcat('Error in EngineCompFailed event handler: ', err));
        else
            error('Internal error in SimEvents engine compilation');
        end
    end % try
end
