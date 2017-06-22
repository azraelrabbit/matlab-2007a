function setDefault(propName, propVal)
    % 1 24
    % 2 24
    % 3 24
    % 4 24
    % 5 24
    % 6 24
    % 7 24
    % 8 24
    % 9 24
    % 10 24
    % 11 24
    % 12 24
    % 13 24
    % 14 24
    % 15 24
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    import com.mathworks.services.Prefs;
    % 22 24
    propKey = sprintf('rptgenext.slwebview.default.%s', propName);
    switch propName
    case {'CompressFile','ViewFile'}
        com.mathworks.services.Prefs.setBooleanPref(propKey, propVal);
    case {'SearchScope','LookUnderMasks','FollowLinks','PackageFile'}
        com.mathworks.services.Prefs.setStringPref(propKey, propVal);
    otherwise
        error('rptgenext:slwebview:UnsupportedPreferenceProperty', 'Property "%s" not supported by preferences', propName)
        % 31 34
        % 32 34
    end % switch
