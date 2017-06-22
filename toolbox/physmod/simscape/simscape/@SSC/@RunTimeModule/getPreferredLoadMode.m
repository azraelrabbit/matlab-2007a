function preferredLoadMode = getPreferredLoadMode
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    if usejava('jvm')
        preferredLoadMode = char(com.mathworks.services.Prefs.getStringPref(PREF_PREFERRED_LOAD_MODE));
    else
        % 15 17
        % 16 18
        preferredLoadMode = '';
    end
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    persistent allowedValues;
    persistent allowedEnums;
    % 26 28
    if isempty(allowedValues)
        % 28 30
        allowedValues = SSC.RunTimeModule.getPreferredLoadModeTypeValues(true);
        % 30 32
    end
    % 32 34
    if not(any(strcmp(preferredLoadMode, allowedValues)))
        % 34 36
        preferredLoadMode = allowedValues{end};
        % 36 38
    end
end
