function i = summ_getDefaultTypeInfo(typeID)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    switch typeID
    case 'System'
        i = rptgen.summsrc(typeID, rptgen_sl.propsrc_sl_sys, RptgenRMI.CSystemLoop, {'Name','RequirementInfo'}, false);
        % 12 16
        % 13 16
        % 14 16
    case 'Block'
        % 15 17
        i = rptgen_sl.summsrc_sl_blk(typeID, rptgen_sl.propsrc_sl_blk, RptgenRMI.CBlockLoop, {'Name','RequirementInfo'}, true);
        % 18 22
        % 19 22
        % 20 22
    case 'Stateflow'
        % 21 23
        i = rptgen.summsrc(typeID, rptgen_sf.propsrc_sf, rptgen_sf.csf_hier_loop('isSFFilterList', true, 'SFFilterTerms', {'RequirementInfo','.+'}), {'Name','RequirementInfo'}, true);
    otherwise
        % 24 28
        % 25 28
        % 26 28
        % 27 29
        error('rptgen:InvalidSummsrc', 'Unrecognized summsrc type "%s"', typeID);
    end % switch
