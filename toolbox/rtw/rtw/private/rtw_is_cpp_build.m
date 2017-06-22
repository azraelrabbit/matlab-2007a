function result = rtw_is_cpp_build(modelName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    cs = getActiveConfigSet(modelName);
    % 7 10
    % 8 10
    result = strcmp(cs.get_param('TargetLang'), 'C++') || feature('ForceRTWCPP');
end
