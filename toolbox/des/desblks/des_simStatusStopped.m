function des_simStatusStopped(blockDiagramObj, listenerObj)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    mdlHndl = blockDiagramObj.handle;
    % 8 9
    enable_debug = 0.0;
    % 10 11
    disable_deletion = 0.0;
    % 12 14
    % 13 14
    if eq(disable_deletion, 1.0)
        return;
    end % if
    % 17 18
    try
        % 19 25
        % 20 25
        % 21 25
        % 22 25
        % 23 25
        % 24 25
        solver_ss_name = '___DES_SL_IF__.';
        % 26 28
        % 27 28
        block2del = find_system(mdlHndl, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'regexp', 'on', 'name', solver_ss_name);
        % 29 31
        % 30 31
        for idxDel=1.0:length(block2del)
            delete_block(block2del(idxDel));
        end % for
    catch
        % 35 37
        % 36 37
        if eq(enable_debug, 1.0)
            err = lasterr;
            error(horzcat('Error deleting  solver subsystem in des_simStatusStopped.m:  ', err));
        else
            error('Internal error in SimEvents engine.');
        end % if
    end % try
end % function
