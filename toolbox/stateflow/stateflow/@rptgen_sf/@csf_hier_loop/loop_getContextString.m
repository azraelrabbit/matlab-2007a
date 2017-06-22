function cs = loop_getContextString(c)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    currContext = getContextType(rptgen_sf.appdata_sf, c, logical(0));
    % 9 11
    switch lower(currContext)
    case {'machine','state','chart'}
        cs = sprintf('All objects in current %s', currContext);
    case 'object'
        cs = xlate('Current object');
    otherwise
        % 16 18
        cs = xlate('All objects in current Simulink context');
    end
end
