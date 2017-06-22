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
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    % 25 26
    kinPnl = [];
    [retVal, kinPnl] = local_renderKinematics(hThis, kinPnl);
    % 28 29
    reactPnl = [];
    [retVal, reactPnl] = Render(hKidLst.Items(2.0, 1.0), reactPnl);
    % 31 32
    muxPnl = [];
    [retVal, muxPnl] = Render(hKidLst.Items(3.0, 1.0), muxPnl);
    % 34 35
    panelVisArray = hThis.ComputePanelVis();
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    % 40 41
    kinPnl.RowSpan = [1.0 1.0];
    kinPnl.ColSpan = [1.0 1.0];
    kinPnl.Visible = panelVisArray(1.0);
    % 44 45
    reactPnl.RowSpan = [2.0 2.0];
    reactPnl.ColSpan = [1.0 1.0];
    reactPnl.Visible = panelVisArray(1.0);
    % 48 49
    muxPnl.RowSpan = [3.0 3.0];
    muxPnl.ColSpan = [1.0 1.0];
    muxPnl.Visible = panelVisArray(1.0);
    % 52 54
    % 53 54
    noConnTxt.Type = 'text';
    noConnTxt.Name = pm_message('mechanical:mech_dialogs:BlockUnconnected', 'Joint');
    % 56 57
    noConnTxt.Alignment = 5.0;
    % 58 59
    textPnl.Type = 'panel';
    textPnl.LayoutGrid = [1.0 1.0];
    textPnl.RowSpan = [2.0 2.0];
    textPnl.ColSpan = [1.0 1.0];
    textPnl.Items = cellhorzcat(noConnTxt);
    textPnl.Visible = panelVisArray(2.0);
    % 65 66
    mainGroup.Name = pm_message('mechanical:mech_dialogs:TitleMeasurements');
    mainGroup.Type = 'group';
    mainGroup.Tag = hThis.ObjId;
    mainGroup.LayoutGrid = [4.0 1.0];
    mainGroup.RowSpan = [1.0 1.0];
    mainGroup.ColSpan = [1.0 1.0];
    mainGroup.Items = [];
    mainGroup.Items = cellhorzcat(kinPnl, reactPnl, muxPnl, textPnl);
    mainGroup.ColStretch = 0.0;
    mainGroup.RowStretch = zeros(1.0, 4.0);
    schema = mainGroup;
end % function
function [retVal, schema] = local_renderKinematics(hThis, schema)
    % 79 90
    % 80 90
    % 81 90
    % 82 90
    % 83 90
    % 84 90
    % 85 90
    % 86 90
    % 87 90
    % 88 90
    % 89 90
    hKinematics = hThis.Items(1.0, 1.0).Items(1.0, 1.0);
    retVal = true;
    % 92 101
    % 93 101
    % 94 101
    % 95 101
    % 96 101
    % 97 101
    % 98 101
    % 99 101
    % 100 101
    hPrimitiveSelect = hKinematics.Items(1.0, 1.0);
    hPrimitiveSelect.SrcObject = hThis;
    hPrimitiveSelect.ObjectMethod = 'OnSelectChange';
    % 104 105
    primSelect = [];
    [retVal, primSelect] = Render(hKinematics.Items(1.0, 1.0), primSelect);
    % 107 108
    revPnl = [];
    [retVal, revPnl] = Render(hKinematics.Items(2.0, 1.0), revPnl);
    % 110 111
    prismPnl = [];
    [retVal, prismPnl] = Render(hKinematics.Items(3.0, 1.0), prismPnl);
    % 113 114
    sphPnl = [];
    [retVal, sphPnl] = Render(hKinematics.Items(4.0, 1.0), sphPnl);
    % 116 117
    kinematicsVisArray = hThis.ComputeKinematicsVis();
    % 118 124
    % 119 124
    % 120 124
    % 121 124
    % 122 124
    % 123 124
    primSelect.RowSpan = [1.0 1.0];
    primSelect.ColSpan = [1.0 1.0];
    % 126 127
    revPnl.RowSpan = [2.0 2.0];
    revPnl.ColSpan = [1.0 1.0];
    revPnl.Visible = kinematicsVisArray(1.0);
    % 130 131
    prismPnl.RowSpan = [2.0 2.0];
    prismPnl.ColSpan = [1.0 1.0];
    prismPnl.Visible = kinematicsVisArray(2.0);
    % 134 135
    sphPnl.RowSpan = [2.0 2.0];
    sphPnl.ColSpan = [1.0 1.0];
    sphPnl.Visible = kinematicsVisArray(3.0);
    % 138 141
    % 139 141
    % 140 141
    mainGroup = [];
    [retVal, mainGroup] = Render(hKinematics, mainGroup);
    % 143 144
    mainGroup.Items = cellhorzcat(primSelect, revPnl, prismPnl, sphPnl);
    % 145 146
    schema = mainGroup;
end % function
