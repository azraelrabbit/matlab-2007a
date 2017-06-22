function val = get_makertwsettings(modelName, settingName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    try
        h = get_param(modelName, 'MakeRTWSettingsObject');
        if isempty(h)
            DAStudio.error('RTW:buildProcess:loadObjectHandleError', 'MakeRTWSettingsObject');
            % 11 12
        end % if
        % 13 14
        val = eval(horzcat('h.', settingName));
    catch
        rethrow(lasterror);
    end % try
end % function
