function OnEditApply(hThis, newData)
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
    tagList = lGetTags(hThis);
    xTag = lFindTag(tagList, 'Xbreaks.Edit');
    yTag = lFindTag(tagList, 'Ybreaks.Edit');
    endCondTag = lFindTag(tagList, 'EndConditions.Combo');
    % 16 19
    % 17 19
    hThis.hDialog.setWidgetValue(xTag, horzcat('[', num2str(newData.Xbreaks), ']'));
    hThis.hDialog.setWidgetValue(yTag, horzcat('[', num2str(newData.Ybreaks), ']'));
    hThis.hDialog.setWidgetValue(endCondTag, minus(newData.ECidx, 1.0));
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    xValsEdit = hThis.Items(1.0).Items(1.0).Items(1.0);
    yValsEdit = hThis.Items(1.0).Items(1.0).Items(2.0);
    endConditionCombo = hThis.Items(1.0).Items(3.0);
    xValsEdit.Value = horzcat('[', num2str(newData.Xbreaks), ']');
    yValsEdit.Value = horzcat('[', num2str(newData.Ybreaks), ']');
    endConditionCombo.Value = newData.ECnames{newData.ECidx};
function tagList = lGetTags(hThis)
    % 32 37
    % 33 37
    % 34 37
    % 35 37
    hIMWidgets = DAStudio.imDialog.getIMWidgets(hThis.hDialog);
    % 37 39
    hToolObj = find(hIMWidgets);
    if isempty(hToolObj)
        error('Failed to get DAStudio.Tool object handle.');
    end % if
    % 42 45
    % 43 45
    tagList = get(hToolObj(2.0:end), 'Tag');
function widgetTag = lFindTag(tagList, partialStr)
    % 46 51
    % 47 51
    % 48 51
    % 49 51
    isFoundLst = strfind(tagList, partialStr);
    % 51 54
    % 52 54
    noMatchState = cellfun('isempty', isFoundLst);
    % 54 57
    % 55 57
    widgetTag = tagList{find(not(noMatchState))};
