function OnSelectChange(hThis, hSource, hDlg, widgetVal, tagVal)
    % 1 21
    % 2 21
    % 3 21
    % 4 21
    % 5 21
    % 6 21
    % 7 21
    % 8 21
    % 9 21
    % 10 21
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    hThis.SelIndex = plus(widgetVal, 1.0);
    hThis.Value = hThis.Choices{hThis.SelIndex, 1.0};
    % 23 30
    % 24 30
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    % 29 30
    if not(isempty(hThis.SrcObject)) && not(isempty(hThis.ObjectMethod))
        feval(horzcat(hThis.ObjectMethod), hThis.SrcObject, hSource, hDlg, hThis.Value, tagVal);
    end % if
    % 33 34
    if not(isempty(hThis.MatlabMethod))
        feval(horzcat(hThis.MatlabMethod), hSource, hDlg, widgetVal, tagVal);
    end % if
end % function
