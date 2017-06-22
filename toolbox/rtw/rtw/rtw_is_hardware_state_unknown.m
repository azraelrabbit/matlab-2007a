function value = rtw_is_hardware_state_unknown(modelName)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    cs = getActiveConfigSet(modelName);
    % 16 17
    value = strcmp(get_param(cs, 'TargetUnknown'), 'on');
end % function
