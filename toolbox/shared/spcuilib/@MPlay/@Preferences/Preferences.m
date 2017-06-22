function h = Preferences(mplayObj)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    persistent prefsObj;
    if isempty(prefsObj)
        prefsObj = MPlay.Preferences;
        % 11 14
        % 12 14
        prefsObj.titleStr = 'MPlay Preferences';
        prefsObj.fullTitleStr = prefsObj.titleStr;
        % 15 19
        % 16 19
        % 17 19
        prefsObj.load;
    end
    h = prefsObj;
end
