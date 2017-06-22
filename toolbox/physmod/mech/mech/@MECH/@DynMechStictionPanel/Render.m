function [retVal, schema] = Render(hThis, schema)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    retVal = true;
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    hKidLst = hThis.Items(1.0, 1.0);
    % 20 23
    % 21 23
    % 22 23
    hPrimitiveSelect = hKidLst.Items(1.0, 1.0);
    hPrimitiveSelect.SrcObject = hThis;
    hPrimitiveSelect.ObjectMethod = 'OnSelectChange';
    % 26 28
    % 27 28
    primSelect = [];
    [retVal, primSelect] = Render(hKidLst.Items(1.0, 1.0), primSelect);
    prismPnl = [];
    [retVal, prismPnl] = Render(hKidLst.Items(2.0, 1.0), prismPnl);
    revPnl = [];
    [retVal, revPnl] = Render(hKidLst.Items(3.0, 1.0), revPnl);
    spherePnl = [];
    [retVal, spherePnl] = Render(hKidLst.Items(4.0, 1.0), spherePnl);
    noConnPnl = [];
    [retVal, noConnPnl] = Render(hKidLst.Items(5.0, 1.0), noConnPnl);
    velThldPnl = [];
    [retVal, velThldPnl] = Render(hKidLst.Items(6.0, 1.0), velThldPnl);
    % 40 41
    selPrimName = hKidLst.Items(1.0, 1.0).Value();
    isConnected = hKidLst.Items(1.0, 1.0).IsConnected();
    panelVisArray = [];
    panelVisArray = hThis.ComputePanelVis(selPrimName, isConnected);
    % 45 46
    primSelect.RowSpan = [1.0 1.0];
    primSelect.ColSpan = [1.0 1.0];
    primSelect.Visible = panelVisArray(1.0);
    % 49 50
    prismPnl.RowSpan = [2.0 2.0];
    prismPnl.ColSpan = [1.0 1.0];
    prismPnl.Visible = panelVisArray(2.0);
    % 53 54
    revPnl.RowSpan = [2.0 2.0];
    revPnl.ColSpan = [1.0 1.0];
    revPnl.Visible = panelVisArray(3.0);
    % 57 59
    % 58 59
    sphereTxt.Type = 'text';
    sphereTxt.Name = pm_message('mechanical:mech_dialogs:SphericalNotAllowed', pm_message('mechanical:mech_dialogs:JointStictionActuatorName'));
    % 61 62
    sphereTxt.Alignment = 5.0;
    % 63 64
    spherePnl.RowSpan = [2.0 2.0];
    spherePnl.ColSpan = [1.0 1.0];
    spherePnl.Items = cellhorzcat(sphereTxt);
    spherePnl.Visible = panelVisArray(4.0);
    % 68 70
    % 69 70
    noConnTxt.Type = 'text';
    noConnTxt.Name = pm_message('mechanical:mech_dialogs:BlockUnconnected', pm_message('mechanical:mech_dialogs:JointName'));
    % 72 73
    noConnTxt.Alignment = 5.0;
    % 74 75
    noConnPnl.RowSpan = [1.0 3.0];
    noConnPnl.ColSpan = [1.0 1.0];
    noConnPnl.Items = cellhorzcat(noConnTxt);
    noConnPnl.Visible = panelVisArray(5.0);
    % 79 80
    velThldPnl.RowSpan = [3.0 3.0];
    velThldPnl.ColSpan = [1.0 1.0];
    velThldPnl.Visible = panelVisArray(6.0);
    % 83 84
    mainGroup.Name = pm_message('mechanical:mech_dialogs:TitleActuation');
    mainGroup.Type = 'group';
    mainGroup.Tag = hThis.ObjId;
    mainGroup.LayoutGrid = [3.0 1.0];
    mainGroup.RowSpan = [1.0 1.0];
    mainGroup.ColSpan = [1.0 1.0];
    mainGroup.Items = [];
    mainGroup.Items = cellhorzcat(primSelect, prismPnl, revPnl, spherePnl, noConnPnl, velThldPnl);
    mainGroup.ColStretch = 0.0;
    % 93 94
    schema = mainGroup;
end % function
