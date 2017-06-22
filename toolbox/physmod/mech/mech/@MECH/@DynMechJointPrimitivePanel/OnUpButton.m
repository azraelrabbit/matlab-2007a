function OnUpButton(hThis, dlgSrc)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    focusFrame = plus(hThis.FocusItem(1.0), 1.0);
    % 9 10
    if eq(hThis.FocusItem(1.0), 0.0)
        errordlg(xlate('No where to go up to.'), xlate('Error'));
        return;
    end % if
    % 14 16
    % 15 16
    tmpObj = hThis.RefFrames(minus(focusFrame, 1.0));
    hThis.RefFrames(minus(focusFrame, 1.0)) = hThis.RefFrames(focusFrame);
    hThis.RefFrames(focusFrame) = tmpObj;
    % 19 20
    hThis.FocusItem(1.0) = minus(hThis.FocusItem(1.0), 1.0);
    % 21 22
    dlgSrc.enableApplyButton(true);
    dlgSrc.refresh();
end % function
