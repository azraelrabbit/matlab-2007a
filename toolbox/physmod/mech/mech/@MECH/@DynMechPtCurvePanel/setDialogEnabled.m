function setDialogEnabled(hThis, bEnable)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    hIMWidgets = DAStudio.imDialog.getIMWidgets(hThis.hDialog);
    % 17 19
    hToolObj = find(hIMWidgets);
    if isempty(hToolObj)
        error('Failed to get DAStudio.Tool object handle.');
    end % if
    % 22 25
    % 23 25
    tagList = get(hToolObj(2.0:end), 'Tag');
    % 25 27
    for idx=1.0:numel(tagList)
        hThis.hDialog.setEnabled(tagList{idx}, bEnable);
    end % for
