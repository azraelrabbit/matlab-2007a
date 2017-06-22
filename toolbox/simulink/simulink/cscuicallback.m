function cscuicallback(hDlg, widgetTag, tabIdx)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    hUI = getDialogSource(hDlg);
    % 7 9
    switch widgetTag
    case 'tMainTabs'
        % 10 12
        set(hUI, 'MainActiveTab', tabIdx);
        hDlg.refresh;
    case 'tcscSubTabs'
        % 14 16
        set(hUI, 'CSCActiveSubTab', tabIdx);
        % 17 19
    case 'subsysParamsddg'
        % 18 20
        set(hUI, 'ActiveTab', tabIdx);
        % 21 23
    case 'tabContainer'
        % 22 27
        % 23 27
        % 24 27
        % 25 27
        helperTag = horzcat(widgetTag, '_ActiveTabHelper');
        sigObjCache = getUserData(hDlg, helperTag);
        if not(isempty(sigObjCache))
            sigObjCache.ActiveTab = tabIdx;
        end % if
    otherwise
        % 32 34
        error(horzcat('Invalid widget tag in cscuicallback: "', widgetTag, '".'));
        % 34 36
    end % switch
