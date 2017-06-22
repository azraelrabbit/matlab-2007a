function item = getStringFormat(h)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    item = [];
    idx = 1.0;
    % 8 9
    item(idx).tlc_option_name = 'GenerateErtSFunction';
    item(idx).make_var_name = 'GENERATE_ERT_S_FUNCTION';
    item(idx).prop_name = 'GenerateErtSFunction';
    idx = plus(idx, 1.0);
    % 13 14
    item(idx).tlc_option_name = 'GenerateASAP2';
    item(idx).make_var_name = 'GENERATE_ASAP2';
    item(idx).prop_name = 'GenerateASAP2';
    idx = plus(idx, 1.0);
    % 18 19
    item(idx).tlc_option_name = 'ExtMode';
    item(idx).make_var_name = 'EXT_MODE';
    item(idx).prop_name = 'ExtMode';
    idx = plus(idx, 1.0);
    % 23 24
    item(idx).tlc_option_name = 'ExtModeStaticAlloc';
    item(idx).make_var_name = 'EXTMODE_STATIC_ALLOC';
    item(idx).prop_name = 'ExtModeStaticAlloc';
    idx = plus(idx, 1.0);
    % 28 29
    item(idx).tlc_option_name = 'ExtModeStaticAllocSize';
    item(idx).make_var_name = 'EXTMODE_STATIC_ALLOC_SIZE';
    item(idx).prop_name = 'ExtModeStaticAllocSize';
    idx = plus(idx, 1.0);
    % 33 34
    item(idx).tlc_option_name = 'ExtModeTransport';
    item(idx).make_var_name = 'EXTMODE_TRANSPORT';
    item(idx).prop_name = 'ExtModeTransport';
    idx = plus(idx, 1.0);
    % 38 39
    item(idx).tlc_option_name = 'ExtModeTesting';
    item(idx).make_var_name = 'TMW_EXTMODE_TESTING';
    item(idx).prop_name = 'ExtModeTesting';
    idx = plus(idx, 1.0);
    % 43 44
    item(idx).tlc_option_name = 'InlinedParameterPlacement';
    item(idx).make_var_name = [];
    item(idx).prop_name = 'InlinedParameterPlacement';
    idx = plus(idx, 1.0);
    % 48 49
    item(idx).tlc_option_name = 'TargetOS';
    item(idx).make_var_name = [];
    item(idx).prop_name = 'TargetOS';
    idx = plus(idx, 1.0);
    % 53 54
    item(idx).tlc_option_name = 'MultiInstanceErrorCode';
    item(idx).make_var_name = [];
    item(idx).prop_name = 'MultiInstanceErrorCode';
    idx = plus(idx, 1.0);
    % 58 59
    item(idx).tlc_option_name = 'RateGroupingCode';
    item(idx).make_var_name = [];
    item(idx).prop_name = 'RateGroupingCode';
    idx = plus(idx, 1.0);
    % 63 64
    item(idx).tlc_option_name = 'RTWCAPISignals';
    item(idx).make_var_name = [];
    item(idx).prop_name = 'RTWCAPISignals';
    idx = plus(idx, 1.0);
    % 68 69
    item(idx).tlc_option_name = 'RTWCAPIParams';
    item(idx).make_var_name = [];
    item(idx).prop_name = 'RTWCAPIParams';
    idx = plus(idx, 1.0);
    % 73 74
    item(idx).tlc_option_name = 'RootIOStructures';
    item(idx).make_var_name = [];
    item(idx).prop_name = 'RootIOFormat';
    item(idx).tlc_enum_in_num = true;
    idx = plus(idx, 1.0);
    % 79 80
    item(idx).tlc_option_name = 'ERTCustomFileTemplate';
    item(idx).make_var_name = [];
    item(idx).prop_name = 'ERTCustomFileTemplate';
    idx = plus(idx, 1.0);
end % function
