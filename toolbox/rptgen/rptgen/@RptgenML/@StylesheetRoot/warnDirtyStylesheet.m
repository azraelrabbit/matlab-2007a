function continueAction = warnDirtyStylesheet(this, id)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    continueAction = true;
    ssDirty = findDirtyStylesheet(this, id);
    if not(isempty(ssDirty))
        optConvert = xlate('Convert anyway');
        optConvertSave = xlate('Save stylesheet and convert');
        optCancel = xlate('Cancel');
        btnSelection = questdlg(sprintf('Stylesheet "%s" is currently open and being edited.  To use these changes during conversion, you must first save the stylesheet.', ssDirty.DisplayName), xlate('Editing Stylesheet'), optConvert, optConvertSave, optCancel, optCancel);
        % 18 21
        % 19 21
        % 20 21
        switch btnSelection
        case optConvert
        case optConvertSave
            % 24 25
            ssDirty.doSave;
        otherwise
            continueAction = false;
        end % switch
    end % if
end % function
