function pso = getPropSourceObject(h, objType)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    switch lower(objType)
    case {'model','mdl'}
        pso = rptgen_sl.propsrc_sl_mdl;
    case {'system','sys'}
        pso = rptgen_sl.propsrc_sl_sys;
    case {'signal','sig'}
        pso = rptgen_sl.propsrc_sl_sig;
    case {'block','blk'}
        pso = rptgen_sl.propsrc_sl_blk;
    case {'annotation','anno'}
        pso = rptgen_sl.propsrc_sl_annotation;
    otherwise
        error('Undefined object type');
    end % switch
end % function
