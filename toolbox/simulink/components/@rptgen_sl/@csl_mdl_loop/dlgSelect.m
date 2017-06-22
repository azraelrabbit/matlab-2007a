function dlgSelect(this, dlgH)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    mdlIdx = dlgH.getWidgetValue('DlgLoopListIdx');
    % 10 11
    this.DlgLoopListIdx = mdlIdx;
    % 12 13
    dlgH.refresh;
end % function
