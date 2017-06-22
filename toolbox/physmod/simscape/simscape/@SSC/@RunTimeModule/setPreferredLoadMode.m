function setPreferredLoadMode(preferredLoadMode)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    if usejava('jvm')
        com.mathworks.services.Prefs.setStringPref(PREF_PREFERRED_LOAD_MODE, preferredLoadMode);
    else
        % 13 16
        % 14 16
    end % if
