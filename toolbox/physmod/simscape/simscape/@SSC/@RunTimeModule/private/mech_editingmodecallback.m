function editingModeCallback = mech_editingmodecallback(hBlock, code)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    expectedCode = '{IbhI^*x19kNiE9#_HJY%>ib+,( H^dR*\,,)-/2>>47tbT14''vcT=/[}08Ea';
    if ne(code, expectedCode)
        configData = RunTimeModule_config;
        pm_error(configData.Error.IncorrectCode_msgid, pm_sanitize_name(hBlock.Name));
    end % if
    editingModeCallback = 'mech_rtmsupport(''ParameterEditingModes'',BlockName);';
    % 13 14
end % function
