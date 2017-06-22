function nameDefn(hUI, val)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    whichDefns = plus(hUI.mainActiveTab, 1.0);
    currIndex = hUI.Index(whichDefns);
    currDefn = hUI.AllDefns{whichDefns}(plus(currIndex, 1.0));
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    if isempty(val)
        errordlg('The definition name must not be empty.', 'Custom Storage Class Designer', 'non-modal');
        % 14 16
        return
    end
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    if strcmp(val, 'Default')
        errordlg('"Default" is a reserved word. Please choose another name.', 'Custom Storage Class Designer', 'non-modal');
        % 23 25
        return
    else
        if strcmp(val, 'Instance specific')
            errordlg('"Instance specific" is a reserved word. Please choose another name.', 'Custom Storage Class Designer', 'non-modal');
            % 28 30
            return
        end
    end
    % 32 36
    % 33 36
    % 34 36
    for i=1.0:length(hUI.AllDefns{whichDefns})
        if eq(i, plus(currIndex, 1.0))
            continue;
        end
        % 39 41
        tmpName = hUI.AllDefns{whichDefns}(i).Name;
        % 41 43
        if strcmp(val, tmpName)
            errordlg('The definition name must be unique within the list.', 'Custom Storage Class Designer', 'non-modal');
            % 44 46
            return
        end
    end % for
    % 48 51
    % 49 51
    set(currDefn, 'Name', val);
    % 51 54
    % 52 54
    hUI.IsDirty = true;
end
