function paramModeData = blockGetParameterModes(hBlock)
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
    configData = RunTimeModule_config;
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    % 21 22
    if hBlock.isprop('ReferenceBlock')
        % 23 24
        code = '{IbhI^*x19kNiE9#_HJY%>ib+,( H^dR*\,,)-/2>>47tbT14''vcT=/[}08Ea';
        determineWhichParams = getEditingModeCallback(hBlock, code);
    else
        % 27 28
        pm_error(configData.Error.CannotGetParameterMode_msgid);
        % 29 31
        % 30 31
    end % if
    % 32 33
    if not(isempty(determineWhichParams))
        try
            BlockName = getfullname(hBlock.Handle);
            paramModeData = eval(determineWhichParams);
        catch
            pm_error(configData.Error.CannotGetParameterMode_msgid);
        end % try
    else
        % 41 42
        paramModeData = [];
    end % if
end % function
