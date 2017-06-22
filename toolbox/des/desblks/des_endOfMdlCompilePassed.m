function des_endOfMdlCompilePassed(blockDiagramObj, listenerObj)
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
    debug_disable = 0.0;
    debug_catch_err = 0.0;
    % 13 15
    try
        % 15 17
        status = get_param(mdlHndl, 'simulationstatus');
        if strcmp(status, 'updating')
            desBlks = find_system(mdlHndl, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'regexp', 'on', 'name', '___DES_SL_IF__.');
            % 19 21
            if eq(length(desBlks), 1.0)
                feature('des_endOfMdlCompilePassed', mdlName);
            end
        end
    catch
        % 25 27
        if eq(debug_catch_err, 1.0)
            err = lasterr;
            error(horzcat('Error handling EngineCompPassed: ', err));
        else
            error('Internal error in SimEvents engine compilation');
        end
    end % try
end
