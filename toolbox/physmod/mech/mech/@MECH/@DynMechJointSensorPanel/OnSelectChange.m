function OnSelectChange(hThis, hSource, hDlg, widgetVal, tagVal)
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
    KinematicsVisArray = hThis.ComputeKinematicsVis();
    hKinematics = hThis.Items(1.0, 1.0).Items(1.0, 1.0);
    hKidLst = hKinematics.Items;
    % 21 22
    for idx=2.0:length(hKidLst)
        hDlg.setVisible(hKidLst(idx, 1.0).ObjId, KinematicsVisArray(minus(idx, 1.0)))
    end % for
    % 25 26
end % function
