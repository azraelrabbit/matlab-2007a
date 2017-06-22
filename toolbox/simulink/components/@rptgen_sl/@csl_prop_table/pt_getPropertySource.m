function ps = pt_getPropertySource(c)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    switch lower(c.ObjectType)
    case 'system'
        ps = rptgen_sl.propsrc_sl_sys;
    case 'model'
        ps = rptgen_sl.propsrc_sl_mdl;
    case 'signal'
        ps = rptgen_sl.propsrc_sl_sig;
    case 'block'
        ps = rptgen_sl.propsrc_sl_blk;
    case 'annotation'
        ps = rptgen_sl.propsrc_sl_annotation;
    case 'configset'
        ps = rptgen_sl.propsrc_sl_configset;
    otherwise
        error('rptgen:InvalidObjectType', 'Invalid object type')
    end % switch
end % function
