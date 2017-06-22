function OnEditClick(hThis, hSource, hDlg, tagVal)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    hThis.hDialog = hDlg;
    % 19 21
    % 20 21
    hThis.setDialogEnabled(false);
    % 22 23
    xValsEdit = hSource.Items(1.0).Items(1.0).Items(1.0);
    yValsEdit = hSource.Items(1.0).Items(1.0).Items(2.0);
    unitCombo = hSource.Items(1.0).Items(2.0);
    endConditionCombo = hSource.Items(1.0).Items(3.0);
    fallOffChk = hSource.Items(1.0).Items(4.0);
    % 28 29
    javaHandle = [];
    hBlk = pm_getsl_dblhandle(hThis.BlockHandle);
    blkName = get_param(hBlk, 'Name');
    Xin = xValsEdit.Value;
    Yin = yValsEdit.Value;
    % 34 35
    ECnames = {'Natural';'Not-a-knot';'Periodic'};
    ECin = find(strcmpi(endConditionCombo.Value, ECnames));
    Units = unitCombo.Value;
    hDynDlgObj = hSource;
    try
        [status, handleFig] = mech_editSpline2d(javaHandle, blkName, Xin, Yin, ECin, Units, hDynDlgObj);
    catch
        % 42 43
        hThis.OnEditClose();
    end % try
end % function
