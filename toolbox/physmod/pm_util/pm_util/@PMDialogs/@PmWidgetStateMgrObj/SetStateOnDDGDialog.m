function SetStateOnDDGDialog(hThis)
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
    if eq(hThis.GotTags, false)
        hThis.GotTags = hThis.GenerateTagLists();
    end % if
    % 14 16
    % 15 16
    switch hThis.actionType
    case 'Visible'
        hActionFcn = @lSetVisibility;
    case 'Enabled'
        hActionFcn = @lSetEnabled;
    otherwise
        error('PmWidgetStateMgrObj:SetStateOnDDGDialog', 'Unrecognized action type.');
    end % switch
    % 24 25
    activeTags = {};
    inactiveTags = {};
    % 27 30
    % 28 30
    % 29 30
    for idx=1.0:numel(hThis.StateList)
        stateItem = hThis.StateList{idx};
        if eq(idx, hThis.CurrentState)
            activeTags = stateItem.tagList;
        else
            inactiveTags = union(inactiveTags, stateItem.tagList);
        end % if
    end % for
    % 38 40
    % 39 40
    inactiveTags = setdiff(inactiveTags, activeTags);
    % 41 43
    % 42 43
    hActionFcn(hThis.hDialog, activeTags, true);
    hActionFcn(hThis.hDialog, inactiveTags, false);
    % 45 46
end % function
function lSetVisibility(hDlg, tags, value)
    % 48 49
    for idx=1.0:numel(tags)
        hDlg.setVisible(tags{idx}, value);
    end % for
end % function
function lSetEnabled(hDlg, tags, value)
    % 54 55
    for idx=1.0:numel(tags)
        hDlg.setEnable(tags{idx}, value);
    end % for
end % function
