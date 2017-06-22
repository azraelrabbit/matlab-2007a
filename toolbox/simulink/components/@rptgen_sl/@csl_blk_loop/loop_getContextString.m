function cs = loop_getContextString(c)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if strcmp(c.LoopType, 'list')
        cs = 'Blocks from manual list';
    else
        switch lower(getContextType(rptgen_sl.appdata_sl, c, logical(0)))
        case 'model'
            cs = xlate('All blocks in reported systems of current model');
        case 'system'
            cs = xlate('All blocks in current system');
        case 'signal'
            cs = xlate('All blocks connected to current signal');
        case {'annotation','configset'}
            cs = xlate('None');
        case 'block'
            cs = xlate('Current block');
        otherwise
            cs = xlate('All blocks in all models');
        end
    end
end
