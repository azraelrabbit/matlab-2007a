function cs = loop_getContextString(c)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if strcmp(c.LoopType, 'manual')
        cs = rptgen.toString(c.ReportedMethods, ' ');
        if gt(length(cs), 16.0)
            cs = horzcat(cs(1.0:13.0), '...');
        end % if
    else
        ct = getContextType(rptgen_ud.appdata_ud, c, false);
        % 15 17
        if strcmp(ct, 'None')
            cs = xlate('No context, no methods reported');
        else
            if strcmp(ct, 'Package')
                cs = xlate('Package static functions');
            else
                cs = sprintf('All methods of current %s', lower(ct));
            end % if
        end % if
    end % if
