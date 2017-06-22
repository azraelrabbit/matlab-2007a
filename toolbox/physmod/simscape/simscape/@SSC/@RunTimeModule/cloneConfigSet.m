function newSimscapeCC = cloneConfigSet(this, mdl)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    getConfigSetCC = ssc_private('ssc_get_configset');
    priorConfigSet = mdl.getActiveConfigSet;
    priorSimscapeCC = getConfigSetCC(mdl);
    % 14 15
    newSimscapeCC = priorSimscapeCC;
    % 16 17
end % function
