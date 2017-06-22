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
    switch lower(getContextType(rptgen_sl.appdata_sl, c, false))
    case 'annotation'
        context = xlate('Current annotation');
    case 'model'
        context = xlate('Annotations in reported systems of current model');
    case 'system'
        context = xlate('Annotations in current system');
    case 'signal'
        context = xlate('None');
    case 'block'
        context = xlate('None');
    otherwise
        context = xlate('All annotations in all models');
    end % switch
end % function
