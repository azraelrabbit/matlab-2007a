function update_dataTypeDst(infoObj, eventData, mplayObj)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    hDlg = infoObj.dialog;
    if not(isempty(hDlg))
        local_eventData.Source = mplayObj;
        infoObj.update(local_eventData);
        refresh(hDlg);
    end % if
end % function
