function OnDownButton(hThis, dlgSrc, objSrc, tagStr, widgetVal)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    nFrames = numel(hThis.WorkFrames);
    % 7 8
    focusFrame = plus(hThis.FocusItem(1.0), 1.0);
    if strcmpi(hThis.WorkFrames(focusFrame).Name, 'CG')
        errordlg(xlate('Not allowed to re-order the CG frame.'), xlate('Error'));
        return;
    end % if
    % 13 15
    % 14 15
    if eq(nFrames, focusFrame)
        return;
    end % if
    % 18 20
    % 19 20
    tmpObj = hThis.WorkFrames(plus(focusFrame, 1.0));
    hThis.WorkFrames(plus(focusFrame, 1.0)) = hThis.WorkFrames(focusFrame);
    hThis.WorkFrames(focusFrame) = tmpObj;
    % 23 24
    hThis.FocusItem(1.0) = plus(hThis.FocusItem(1.0), 1.0);
    % 25 26
    dlgSrc.enableApplyButton(true);
    dlgSrc.refresh();
end % function
