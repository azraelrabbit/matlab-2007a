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
    retVal = true;
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    hKidLst = hThis.Items(1.0, 1.0);
    % 19 34
    % 20 34
    % 21 34
    % 22 34
    % 23 34
    % 24 34
    % 25 34
    % 26 34
    % 27 34
    % 28 34
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    hPrimitiveSelect = hKidLst.Items(1.0, 1.0).Items(1.0, 1.0);
    hPrimitiveSelect.SrcObject = hThis;
    hPrimitiveSelect.ObjectMethod = 'OnPrimSelectChange';
    % 36 38
    hStyleSelect = hKidLst.Items(1.0, 1.0).Items(2.0, 1.0);
    listener = @(source,dialog,value,tag)hThis.OnActStyleSelectChange(source,dialog,value);
    hStyleSelect.addListener(listener);
    % 40 42
    hThis.SelPrim = hPrimitiveSelect.Value;
    hThis.SelActStyle = hStyleSelect.Value;
    % 43 46
    % 44 46
    primPnl = [];
    [retVal, primPnl] = hKidLst.Items(1.0, 1.0).Render(hKidLst.Items(1.0, 1.0));
    % 47 49
    revPnl = [];
    [retVal, revPnl] = Render(hKidLst.Items(2.0, 1.0), revPnl);
    prismPnl = [];
    [retVal, prismPnl] = Render(hKidLst.Items(3.0, 1.0), prismPnl);
    % 52 54
    spherePnl = [];
    [retVal, spherePnl] = Render(hKidLst.Items(4.0, 1.0), spherePnl);
    unknownPnl = [];
    [retVal, unknownPnl] = Render(hKidLst.Items(5.0, 1.0), unknownPnl);
    forcePnl = [];
    [retVal, forcePnl] = Render(hKidLst.Items(6.0, 1.0), forcePnl);
    torqPnl = [];
    [retVal, torqPnl] = Render(hKidLst.Items(7.0, 1.0), torqPnl);
    % 61 63
    textItem.Type = 'text';
    textItem.Name = pm_message('mechanical:mech_dialogs:SphericalNotAllowed', pm_message('mechanical:mech_dialogs:JointActuatorName'));
    % 64 66
    textItem.Alignment = 5.0;
    spherePnl.Items = cellhorzcat(textItem);
    % 67 69
    textItem2.Type = 'text';
    textItem2.Name = pm_message('mechanical:mech_dialogs:BlockUnconnected', pm_message('mechanical:mech_dialogs:JointName'));
    % 70 72
    textItem2.Alignment = 5.0;
    unknownPnl.Items = cellhorzcat(textItem2);
    % 73 75
    selPrimName = hPrimitiveSelect.Value();
    isConnected = hPrimitiveSelect.IsConnected();
    selStyleName = hStyleSelect.Value();
    panelVisArray = [];
    % 78 80
    spacer.type = 'panel';
    % 80 82
    panelVisArray = hThis.ComputePanelVis(selPrimName, selStyleName, isConnected);
    % 82 92
    % 83 92
    % 84 92
    % 85 92
    % 86 92
    % 87 92
    % 88 92
    % 89 92
    % 90 92
    primPnl.RowSpan = [1.0 1.0];
    primPnl.ColSpan = [1.0 1.0];
    primPnl.Visible = panelVisArray(1.0);
    % 94 96
    revPnl.RowSpan = [2.0 2.0];
    revPnl.ColSpan = [1.0 1.0];
    revPnl.Visible = panelVisArray(2.0);
    % 98 100
    prismPnl.RowSpan = [2.0 2.0];
    prismPnl.ColSpan = [1.0 1.0];
    prismPnl.Visible = panelVisArray(3.0);
    % 102 104
    spherePnl.RowSpan = [2.0 2.0];
    spherePnl.ColSpan = [1.0 1.0];
    spherePnl.Visible = panelVisArray(4.0);
    % 106 108
    unknownPnl.RowSpan = [1.0 2.0];
    unknownPnl.ColSpan = [1.0 1.0];
    unknownPnl.Visible = panelVisArray(5.0);
    % 110 112
    forcePnl.RowSpan = [2.0 2.0];
    forcePnl.ColSpan = [1.0 1.0];
    forcePnl.Visible = panelVisArray(6.0);
    % 114 116
    torqPnl.RowSpan = [2.0 2.0];
    torqPnl.ColSpan = [1.0 1.0];
    torqPnl.Visible = panelVisArray(7.0);
    % 118 120
    mainGroup.Name = hThis.Items(1.0, 1.0).LabelText;
    mainGroup.Type = 'group';
    mainGroup.Tag = hThis.ObjId;
    mainGroup.LayoutGrid = [2.0 1.0];
    mainGroup.RowSpan = [1.0 1.0];
    mainGroup.ColSpan = [1.0 1.0];
    mainGroup.Items = [];
    mainGroup.Items = cellhorzcat(primPnl, prismPnl, revPnl, spherePnl, unknownPnl, forcePnl, torqPnl);
    mainGroup.ColStretch = 0.0;
    mainGroup.RowStretch = zeros(1.0, 2.0);
    schema = mainGroup;
end
