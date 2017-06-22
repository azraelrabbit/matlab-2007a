function i = summ_getDefaultTypeInfo(typeID)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    typeID = lower(typeID);
    % 10 12
    switch typeID
    case 'figure'
        i = rptgen.summsrc(typeID, rptgen_hg.propsrc_hg_fig, rptgen_hg.chg_fig_loop('LoopType', 'All'), {'name','children'}, true);
        % 15 19
        % 16 19
        % 17 19
    case 'axes'
        % 18 20
        i = rptgen.summsrc(typeID, rptgen_hg.propsrc_hg_ax, rptgen_hg.chg_ax_loop, {'parent','children'}, true);
        % 21 25
        % 22 25
        % 23 25
    case 'object'
        % 24 26
        i = rptgen.summsrc(typeID, rptgen_hg.propsrc_hg_obj, rptgen_hg.chg_obj_loop, {'type','parent','tag'}, true);
    otherwise
        % 27 31
        % 28 31
        % 29 31
        % 30 32
        error('rptgen:InvalidSummsrc', 'Unrecognized summsrc type "%s"', typeID);
    end % switch
