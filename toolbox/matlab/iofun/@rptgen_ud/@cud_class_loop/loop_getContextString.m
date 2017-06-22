function cs = loop_getContextString(c)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if strcmp(c.LoopType, 'manual')
        cs = rptgen.toString(c.ClassList, ' ');
        if gt(length(cs), 16.0)
            cs = horzcat(cs(1.0:13.0), '...');
        end
    else
        ct = getContextType(rptgen_ud.appdata_ud, c, logical(0));
        switch ct
        case 'Package'
            cs = xlate('All classes in current package');
        case 'Class'
            cs = xlate('Current class');
        case {'Object','Method','Property'}
            cs = sprintf('Classhandle of current %s', lower(ct));
        otherwise
            cs = xlate('No context, no classes reported');
        end
    end
end
