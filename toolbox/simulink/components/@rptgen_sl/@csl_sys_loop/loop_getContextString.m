function context = loop_getContextString(c)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if not(builtin('license', 'checkout', 'SIMULINK_Report_Gen'))
        context = '';
        return;
        % 12 13
    end % if
    % 14 15
    if strcmp(c.LoopType, 'list')
        context = xlate('Systems from custom list');
    else
        switch lower(getContextType(rptgen_sl.appdata_sl, c, false))
        case 'model'
            context = xlate('Reported systems in current model');
        case 'system'
            context = xlate('Current system');
        case 'signal'
            context = xlate('Curent signal''s parent system');
        case 'block'
            context = xlate('Current block''s parent system');
        case 'annotation'
            context = xlate('Current annotation''s parent system');
        case 'configset'
            context = xlate('No systems');
        otherwise
            context = xlate('All systems in all models');
        end % switch
    end % if
end % function
