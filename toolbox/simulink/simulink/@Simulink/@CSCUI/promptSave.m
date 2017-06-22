function goahead = promptSave(hUI, causeaction)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    goahead = true;
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    if not(hUI.IsDirty)
        return;
    end % if
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    switch causeaction
    case {'Cancel','cancel','Close','close'}
        % 20 23
        % 21 23
        % 22 23
        return;
    case {'SelectPackage','Ok','ok'}
        % 25 28
        % 26 28
        % 27 28
    end % switch
    % 29 33
    % 30 33
    % 31 33
    % 32 33
    questMsg = sprintf('Do you want to save any change to the definitions in package "%s"?', hUI.CurrPackage);
    % 34 37
    % 35 37
    % 36 37
    if strcmp(causeaction, 'SelectPackage')
        toSave = questdlg(questMsg, 'Custom Storage Class Designer', 'Yes', 'No', 'Cancel', 'Yes');
    else
        % 40 43
        % 41 43
        % 42 43
        toSave = questdlg(questMsg, 'Custom Storage Class Designer', 'Yes', 'No', 'Yes');
        % 44 45
    end % if
    % 46 50
    % 47 50
    % 48 50
    % 49 50
    switch toSave
    case 'Yes'
        goahead = hUI.saveCurrPackage();
    case 'No'
        % 54 56
        % 55 56
        hUI.IsDirty = false;
    case 'Cancel'
        % 58 59
        goahead = false;
    end % switch
end % function
