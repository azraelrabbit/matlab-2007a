function cs = loop_getContextString(c)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    switch lower(getContextType(rptgen_sl.appdata_sl, c, false))
    case 'model'
        cs = 'Signals in reported systems of current model';
    case 'system'
        cs = 'Signals in current system';
    case 'signal'
        cs = 'Current signal';
    case 'block'
        cs = 'Signals connected to current block';
    case {'annotation','configset'}
        cs = 'No signals';
    otherwise
        cs = 'Signals in all models';
    end % switch
end % function
