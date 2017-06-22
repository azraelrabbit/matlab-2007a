function OnUpButton(hThis, dlgSrc, objSrc, tagStr, widgetVal)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    focusFrame = plus(hThis.FocusItem(1.0), 1.0);
    % 9 10
    if eq(focusFrame, 1.0)
        % 11 13
        % 12 13
        return;
    end % if
    % 15 16
    if strcmpi(hThis.WorkFrames(minus(focusFrame, 1.0)).Name, 'CG') || strcmpi(hThis.WorkFrames(focusFrame).Name, 'CG')
        % 17 18
        errordlg(xlate('Not allowed to re-order the CG frame.'), xlate('Error'));
        return;
    end % if
    % 21 23
    % 22 23
    tmpObj = hThis.WorkFrames(minus(focusFrame, 1.0));
    hThis.WorkFrames(minus(focusFrame, 1.0)) = hThis.WorkFrames(focusFrame);
    hThis.WorkFrames(focusFrame) = tmpObj;
    % 26 27
    hThis.FocusItem(1.0) = minus(hThis.FocusItem(1.0), 1.0);
    % 28 29
    dlgSrc.enableApplyButton(true);
    dlgSrc.refresh();
end % function
