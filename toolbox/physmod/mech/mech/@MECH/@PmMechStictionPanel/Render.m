function [retVal, schema] = Render(hThis, schema)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    retVal = true;
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    hKidLst = hThis.Items(1.0, 1.0);
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    % 23 24
    hPrimitiveSelect = hKidLst.Items(1.0, 1.0);
    hPrimitiveSelect.SrcObject = hThis;
    hPrimitiveSelect.ObjectMethod = 'OnSelectChange';
    % 27 29
    % 28 29
    primSelect = [];
    [retVal, primSelect] = hKidLst.Items(1.0, 1.0).Render(primSelect);
    prismPnl = [];
    [retVal, prismPnl] = Render(hKidLst.Items(2.0, 1.0), prismPnl);
    revPnl = [];
    [retVal, revPnl] = Render(hKidLst.Items(3.0, 1.0), revPnl);
    spherePnl = [];
    [retVal, spherePnl] = Render(hKidLst.Items(4.0, 1.0), spherePnl);
    velThldPnl = [];
    [retVal, velThldPnl] = Render(hKidLst.Items(5.0, 1.0), velThldPnl);
    % 39 40
    selPrimName = hKidLst.Items(1.0, 1.0).Value();
    panelVisArray = [];
    % 42 43
    panelVisArray = l_computePanelVis(selPrimName);
    % 44 45
    primSelect.RowSpan = [1.0 1.0];
    primSelect.ColSpan = [1.0 1.0];
    % 47 48
    prismPnl.RowSpan = [2.0 2.0];
    prismPnl.ColSpan = [1.0 1.0];
    prismPnl.Visible = panelVisArray(1.0);
    % 51 52
    revPnl.RowSpan = [3.0 3.0];
    revPnl.ColSpan = [1.0 1.0];
    revPnl.Visible = panelVisArray(2.0);
    % 55 56
    spherePnl.RowSpan = [4.0 4.0];
    spherePnl.ColSpan = [1.0 1.0];
    spherePnl.Visible = panelVisArray(3.0);
    % 59 60
    velThldPnl.RowSpan = [5.0 5.0];
    velThldPnl.ColSpan = [1.0 1.0];
    % 62 63
    mainGroup.Name = xlate('Parameters');
    mainGroup.Type = 'group';
    mainGroup.Tag = hThis.ObjId;
    mainGroup.LayoutGrid = [5.0 1.0];
    mainGroup.RowSpan = [1.0 1.0];
    mainGroup.ColSpan = [1.0 1.0];
    mainGroup.Items = [];
    mainGroup.Items = cellhorzcat(primSelect, prismPnl, revPnl, spherePnl, velThldPnl);
    mainGroup.ColStretch = 0.0;
    % 72 73
    schema = mainGroup;
end % function
function panelVisArray = l_computePanelVis(primName)
    % 76 77
    switch primName(1.0)
    case 'S'
        panelVisArray = [0.0 0.0 1.0];
    case 'R'
        panelVisArray = [0.0 1.0 0.0];
    case 'P'
        panelVisArray = [1.0 0.0 0.0];
    otherwise
        panelVisArray = [0.0 0.0 1.0];
    end % switch
end % function
