function i = summ_getDefaultTypeInfo(typeID)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    switch typeID
    case 'Model'
        mdlLooper = rptgen_sl.csl_mdl_loop;
        mdlLooper.LoopList(1.0).MdlName = '$all';
        % 12 14
        i = rptgen.summsrc(typeID, rptgen_sl.propsrc_sl_mdl, mdlLooper, {'Name','Description','FileName'}, false);
        % 15 19
        % 16 19
        % 17 19
    case 'System'
        % 18 20
        i = rptgen.summsrc(typeID, rptgen_sl.propsrc_sl_sys, rptgen_sl.csl_sys_loop, {'Name','Description'}, false);
        % 21 25
        % 22 25
        % 23 25
    case 'Block'
        % 24 26
        i = rptgen_sl.summsrc_sl_blk(typeID, rptgen_sl.propsrc_sl_blk, rptgen_sl.csl_blk_loop, {'Name','Parent','%<SplitDialogParameters>'}, true);
        % 27 31
        % 28 31
        % 29 31
    case 'Signal'
        % 30 32
        i = rptgen.summsrc(typeID, rptgen_sl.propsrc_sl_sig, rptgen_sl.csl_sig_loop('SortBy', 'alphabetical-exclude-empty'), {'Name','ParentBlock'}, true);
        % 33 37
        % 34 37
        % 35 37
    case 'Annotation'
        % 36 38
        i = rptgen.summsrc(typeID, rptgen_sl.propsrc_sl_annotation, rptgen_sl.CAnnotationLoop, {'Text'}, true);
        % 39 43
        % 40 43
        % 41 43
    case 'ConfigSet'
        % 42 44
        i = rptgen.summsrc(typeID, rptgen_sl.propsrc_sl_configset, rptgen_sl.CConfigSetLoop, {'Name'}, true);
    otherwise
        % 45 49
        % 46 49
        % 47 49
        % 48 50
        error('rptgen:InvalidSummsrc', 'Unrecognized summsrc type "%s"', typeID);
    end % switch
