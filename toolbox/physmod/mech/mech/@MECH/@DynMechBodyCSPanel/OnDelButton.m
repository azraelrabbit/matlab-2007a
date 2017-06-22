function OnDelButton(hThis, dlgSrc, objSrc, tagStr, widgetVal)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    nFrames = numel(hThis.WorkFrames);
    % 8 9
    focusFrame = plus(hThis.FocusItem(1.0), 1.0);
    if strcmpi(hThis.WorkFrames(focusFrame).Name, 'CG')
        errordlg(xlate('Not allowed to delete the CG.'), xlate('Error'));
        return;
    end % if
    % 14 16
    % 15 16
    hThis.WorkFrames(focusFrame) = [];
    % 17 19
    % 18 19
    if gt(nFrames, 2.0)
        hThis.FocusItem(1.0) = max(minus(hThis.FocusItem(1.0), 1.0), 1.0);
    else
        hThis.FocusItem(1.0) = 0.0;
    end % if
    % 24 26
    % 25 26
    dlgSrc.enableApplyButton(true);
    dlgSrc.refresh();
    dlgSrc.resetSize(false);
end % function
