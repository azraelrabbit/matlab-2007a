function item = getStringFormat(h)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    item = [];
    % 6 7
    i = 1.0;
    item(i).tlc_option_name = 'CCOptimize';
    item(i).make_var_name = 'CC_OPTIMIZE';
    item(i).prop_name = 'CCOptimize';
    % 11 12
    i = plus(i, 1.0);
    item(i).tlc_option_name = 'CCListing';
    item(i).make_var_name = 'CC_LISTING';
    item(i).prop_name = 'CCListing';
    % 16 17
    i = plus(i, 1.0);
    item(i).tlc_option_name = 'RebuildAll';
    item(i).make_var_name = 'REBUILD_ALL';
    item(i).prop_name = 'RebuildAll';
    % 21 22
    i = plus(i, 1.0);
    item(i).tlc_option_name = 'ExtMode';
    item(i).make_var_name = 'EXT_MODE';
    item(i).prop_name = 'ExtMode';
    % 26 27
    i = plus(i, 1.0);
    item(i).tlc_option_name = 'ExtModeStaticAlloc';
    item(i).make_var_name = 'EXTMODE_STATIC_ALLOC';
    item(i).prop_name = 'ExtModeStaticAlloc';
    % 31 32
    i = plus(i, 1.0);
    item(i).tlc_option_name = 'ExtModeStaticAllocSize';
    item(i).make_var_name = 'EXTMODE_STATIC_ALLOC_SIZE';
    item(i).prop_name = 'ExtModeStaticAllocSize';
    % 36 37
    i = plus(i, 1.0);
    item(i).tlc_option_name = 'ExtModeTransport';
    item(i).make_var_name = 'EXTMODE_TRANSPORT';
    item(i).prop_name = 'ExtModeTransport';
    % 41 42
    i = plus(i, 1.0);
    item(i).tlc_option_name = 'ExtModeTesting';
    item(i).make_var_name = 'TMW_EXTMODE_TESTING';
    item(i).prop_name = 'ExtModeTesting';
end % function
