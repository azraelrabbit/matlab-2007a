function OnDelButton(hThis, dlgSrc)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    nFrames = numel(hThis.RefFrames);
    % 8 10
    % 9 10
    focusFrame = plus(hThis.FocusItem(1.0), 1.0);
    if eq(nFrames, 1.0)
        errordlg(xlate('Not allowed to delete all primitives from the Custom Joint.'), xlate('Error'));
        % 13 14
        return;
    end % if
    % 16 18
    % 17 18
    hThis.RefFrames(focusFrame) = [];
    % 19 21
    % 20 21
    hThis.FocusItem(1.0) = max(0.0, minus(hThis.FocusItem(1.0), 1.0));
    % 22 23
    dlgSrc.enableApplyButton(true);
    % 24 26
    % 25 26
    dlgSrc.refresh();
    dlgSrc.resetSize(false);
end % function
