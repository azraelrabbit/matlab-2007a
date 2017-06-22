function ColorMapDlg(mplayObj)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if not(is_RGB(mplayObj.datasourceObj.dataSource))
        mplayObj.colorMapObj.show(true);
    end % if
end % function
