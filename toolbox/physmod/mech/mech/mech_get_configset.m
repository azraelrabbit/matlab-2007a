function configset = mech_get_configset(hBlk)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    getConfigSet = ssc_private('ssc_get_configset');
    configset = getConfigSet(hBlk, 'SimMechanics');
    if ne(length(configset), 1.0)
        error('mechanical:mech_get_configset:NonUniqueComponent');
    end % if
end % function
