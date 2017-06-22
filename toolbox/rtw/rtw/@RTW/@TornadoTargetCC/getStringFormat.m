function item = getStringFormat(h)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    item = [];
    % 6 7
    i = 1.0;
    item(i).tlc_option_name = 'MatFileLogging';
    item(i).make_var_name = 'MAT_FILE';
    item(i).prop_name = 'MatFileLogging';
    % 11 12
    i = plus(i, 1.0);
    item(i).tlc_option_name = 'LogVarNameModifier';
    item(i).make_var_name = '';
    item(i).prop_name = 'LogVarNameModifier';
    % 16 17
    i = plus(i, 1.0);
    item(i).tlc_option_name = 'CodeFormat';
    item(i).make_var_name = '';
    item(i).prop_name = 'CodeFormat';
    % 21 22
    i = plus(i, 1.0);
    item(i).tlc_option_name = 'StethoScope';
    item(i).make_var_name = 'STETHOSCOPE';
    item(i).prop_name = 'StethoScope';
    % 26 27
    i = plus(i, 1.0);
    item(i).tlc_option_name = 'DownloadToVxWorks';
    item(i).make_var_name = 'DOWNLOAD';
    item(i).prop_name = 'DownloadToVxWorks';
    % 31 32
    i = plus(i, 1.0);
    item(i).tlc_option_name = 'BasePriority';
    item(i).make_var_name = 'BASE_PRIORITY';
    item(i).prop_name = 'BasePriority';
    % 36 37
    i = plus(i, 1.0);
    item(i).tlc_option_name = 'TaskStackSize';
    item(i).make_var_name = 'STACK_SIZE';
    item(i).prop_name = 'TaskStackSize';
    % 41 42
    i = plus(i, 1.0);
    item(i).tlc_option_name = 'ExtMode';
    item(i).make_var_name = 'EXT_MODE';
    item(i).prop_name = 'ExtMode';
    % 46 47
    i = plus(i, 1.0);
    item(i).tlc_option_name = 'ExtModeStaticAlloc';
    item(i).make_var_name = 'EXTMODE_STATIC_ALLOC';
    item(i).prop_name = 'ExtModeStaticAlloc';
    % 51 52
    i = plus(i, 1.0);
    item(i).tlc_option_name = 'ExtModeStaticAllocSize';
    item(i).make_var_name = 'EXTMODE_STATIC_ALLOC_SIZE';
    item(i).prop_name = 'ExtModeStaticAllocSize';
    % 56 57
    i = plus(i, 1.0);
    item(i).tlc_option_name = 'ExtModeTransport';
    item(i).make_var_name = 'EXTMODE_TRANSPORT';
    item(i).prop_name = 'ExtModeTransport';
    % 61 62
    i = plus(i, 1.0);
    item(i).tlc_option_name = 'ExtModeTesting';
    item(i).make_var_name = 'TMW_EXTMODE_TESTING';
    item(i).prop_name = 'ExtModeTesting';
    % 66 68
    % 67 68
    i = plus(i, 1.0);
    item(i).tlc_option_name = 'RTWCAPIParams';
    item(i).make_var_name = 'RTWCAPIPARAMS';
    item(i).prop_name = 'RTWCAPIParams';
    % 72 73
    i = plus(i, 1.0);
    item(i).tlc_option_name = 'RTWCAPISignals';
    item(i).make_var_name = 'RTWCAPISIGNALS';
    item(i).prop_name = 'RTWCAPISignals';
end % function
