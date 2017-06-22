function OnChkBoxChange(hThis, dlgSrc, widgetVal, tagVal)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if not(hThis.ResolveBuddyTags)
        hThis.ResolveBuddyTags = lResolveBuddyTags(hThis, dlgSrc);
    end % if
    % 9 11
    if isempty(hThis.MyTag)
        tmpTags = lFindWidgetTag(dlgSrc, hThis.ObjId);
        hThis.MyTag = tmpTags{1.0};
    end % if
    curVal = dlgSrc.getWidgetValue(hThis.MyTag);
    enableStatus = curVal;
    % 16 18
    nBuds = numel(hThis.BuddyItemsTags);
    for idx=1.0:nBuds
        tagName = hThis.BuddyItemsTags{idx};
        dlgSrc.setEnabled(tagName, enableStatus);
    end % for
    % 22 25
    % 23 25
    hThis.notifyListeners(dlgSrc, widgetVal, tagVal);
    % 25 27
function retVal = lResolveBuddyTags(hThis, hDlgSrc)
    % 27 35
    % 28 35
    % 29 35
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    retVal = false;
    hThis.BuddyItemsTags = {};
    nBuds = numel(hThis.BuddyItems);
    for idx=1.0:nBuds
        tagName = hThis.BuddyItems(idx).ObjId;
        lTags = lFindWidgetTag(hDlgSrc, tagName);
        hThis.BuddyItemsTags = cellhorzcat(hThis.BuddyItemsTags{:}, lTags{:});
    end % for
    retVal = true;
function widgetTag = lFindWidgetTag(hDlgSrc, tagName)
    % 44 51
    % 45 51
    % 46 51
    % 47 51
    % 48 51
    % 49 51
    hInteractiveMethod = DAStudio.imDialog.getIMWidgets(hDlgSrc);
    hToolObj = find(hInteractiveMethod);
    % 52 54
    if isempty(hToolObj)
        error('Failed to get DAStudio.Tool object handle.');
    end % if
    % 56 59
    % 57 59
    tagList = get(hToolObj(2.0:end), 'Tag');
    % 59 62
    % 60 62
    isFoundLst = strfind(tagList, tagName);
    % 62 65
    % 63 65
    noMatchState = cellfun('isempty', isFoundLst);
    % 65 68
    % 66 68
    widgetTag = tagList(find(not(noMatchState)));
