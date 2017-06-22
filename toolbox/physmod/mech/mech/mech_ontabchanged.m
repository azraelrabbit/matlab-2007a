function mech_ontabchanged(dlgSrc, containerTag, tabIdx)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hDlgSrc = dlgSrc.getDialogSource();
    hBldrObj = hDlgSrc.BuilderObj();
    % 10 11
    k = strfind(containerTag, '.');
    if gt(numel(k), 1.0)
        containerTag = containerTag(1.0:minus(k(2.0), 1.0));
    end % if
    % 15 16
    matchList = hBldrObj.TagSearch(containerTag, 'Partial', 'First');
    if isempty(matchList)
        return;
    end % if
    hSrcObj = matchList(1.0);
    hSrcObj.FocusTab = tabIdx;
end % function
