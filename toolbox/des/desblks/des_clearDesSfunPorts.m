function des_clearDesSfunPorts(sys_root)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    persistent modelInfo;
    success = 0.0;
    % 7 10
    % 8 10
    debug_disable = 0.0;
    debug_catch_err = 0.0;
    % 11 13
    try
        % 13 16
        % 14 16
        status = get_param(sys_root, 'simulationstatus');
        if debug_catch_err
            disp(horzcat('status = ''', status, '''.'));
        end
        % 19 21
        if eq(debug_disable, 1.0)
            success = 1.0;
            return
        end
        % 24 26
        solver_ss_name = '___DES_SL_IF___';
        % 26 29
        % 27 29
        block2del = char(find_system(sys_root, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'name', solver_ss_name));
        % 29 33
        % 30 33
        % 31 33
        idxsDel = strmatch(sys_root, block2del);
        for idxDel=1.0:length(idxsDel)
            blk2delName = deblank(block2del(idxsDel(idxDel), :));
            delete_block(blk2delName);
        end % for
    catch
        % 38 41
        % 39 41
        if eq(debug_catch_err, 1.0)
            err = lasterr;
            warning(horzcat(des_getproductname, ':SolverSubsysUnknown'), horzcat('Error generating solver subsystem ''', mfilename, ''', ''', err));
            pause;
        end
    end % try
end
