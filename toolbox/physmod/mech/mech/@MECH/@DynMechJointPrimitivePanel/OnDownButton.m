function OnDownButton(hThis, dlgSrc)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    nFrames = numel(hThis.RefFrames);
    % 8 9
    focusFrame = plus(hThis.FocusItem(1.0), 1.0);
    if eq(focusFrame, nFrames)
        errordlg(xlate('Not where to go down to.'), xlate('Error'));
        return;
    end % if
    % 14 16
    % 15 16
    if eq(nFrames, focusFrame)
        return;
    end % if
    % 19 21
    % 20 21
    tmpObj = hThis.RefFrames(plus(focusFrame, 1.0));
    hThis.RefFrames(plus(focusFrame, 1.0)) = hThis.RefFrames(focusFrame);
    hThis.RefFrames(focusFrame) = tmpObj;
    % 24 25
    hThis.FocusItem(1.0) = plus(hThis.FocusItem(1.0), 1.0);
    % 26 27
    dlgSrc.enableApplyButton(true);
    dlgSrc.refresh();
end % function
