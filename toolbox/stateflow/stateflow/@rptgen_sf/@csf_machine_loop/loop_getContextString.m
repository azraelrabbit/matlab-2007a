function cs = loop_getContextString(c)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    sfContext = getContextType(rptgen_sf.appdata_sf, c, logical(0));
    % 9 11
    if (strcmpi(sfContext, 'None')) | (isempty(sfContext))
        slContext = getContextType(rptgen_sl.appdata_sl, c, logical(0));
        if (isempty(slContext)) | (strcmpi(slContext, 'None'))
            cs = xlate('All machines in all models');
        else
            cs = xlate('Current model''s machine');
        end
    else
        cs = xlate('Current machine');
    end
end
