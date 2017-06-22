function cs = loop_getContextString(c)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if strcmp(c.LoopType, 'manual')
        cs = rptgen.toString(c.ReportedProperties, ' ');
        if gt(length(cs), 16.0)
            cs = horzcat(cs(1.0:13.0), '...');
        end
    else
        ct = getContextType(rptgen_ud.appdata_ud, c, logical(0));
        % 16 18
        if strcmp(ct, 'None')
            cs = xlate('No context, no properties reported');
        else
            cs = sprintf('All properties of current %s', lower(ct));
        end
    end
end
