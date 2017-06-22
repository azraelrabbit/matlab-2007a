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
    % 14 16
    childItems = {};
    [retVal, childItems] = renderChildren(hThis, childItems);
    % 17 21
    % 18 21
    % 19 21
    nPanels = numel(childItems);
    % 21 23
    if not(strcmp(hThis.Style, 'TabContainer'))
        for idx=1.0:nPanels
            childItems{idx}.RowSpan = horzcat(idx, idx);
        end % for
    end % if
    % 27 29
    if eq(nPanels, 0.0)
        nPanels = 1.0;
    end % if
    % 31 33
    RowStretchVect = zeros(1.0, nPanels);
    % 33 35
    grpPanel.Name = hThis.Label;
    grpPanel.Tag = hThis.ObjId;
    % 36 38
    switch hThis.Style
    case 'HorzLine'
        grpPanel.Type = 'group';
        grpPanel.Flat = true;
        grpPanel.RowSpan = [1.0 1.0];
        grpPanel.ColSpan = [1.0 1.0];
        grpPanel.LayoutGrid = [1.0 1.0];
        grpPanel.RowStretch = 0.0;
    case {'Box','Flat'}
        % 46 48
        grpPanel.Type = 'group';
        grpPanel.RowSpan = [1.0 1.0];
        grpPanel.ColSpan = [1.0 1.0];
        grpPanel.Flat = strcmpi(hThis.Style, 'Flat');
        grpPanel.LayoutGrid = horzcat(plus(nPanels, 1.0), 1.0);
        grpPanel.Items = childItems;
        grpPanel.RowStretch = zeros(1.0, nPanels);
        grpPanel.RowStretch(plus(end, 1.0)) = 1.0;
    case 'NoBoxWithTitle'
        grpPanel.Type = 'panel';
        % 57 59
        labelTxt.Name = hThis.Label;
        labelTxt.Type = 'text';
        labelTxt.RowSpan = [2.0 2.0];
        labelTxt.ColSpan = [1.0 1.0];
        % 62 64
        newKidList{1.0} = labelTxt;
        % 64 66
        spacer.Type = 'panel';
        spacer.RowSpan = [1.0 1.0];
        spacer.ColSpan = [1.0 1.0];
        spacer.LayoutGrid = [1.0 1.0];
        % 69 71
        newKidList{2.0} = spacer;
        newKidList{3.0} = spacer;
        newKidList{3.0}.RowSpan = [3.0 3.0];
        % 73 76
        % 74 76
        for idx=4.0:plus(nPanels, 3.0)
            newKidList{idx} = childItems{minus(idx, 3.0)};
            newKidList{idx}.RowSpan = horzcat(idx, idx);
            newKidList{idx}.ColSpan = [1.0 1.0];
        end % for
        % 80 82
        grpPanel.RowSpan = [1.0 1.0];
        grpPanel.ColSpan = [1.0 1.0];
        grpPanel.LayoutGrid = horzcat(plus(nPanels, 3.0), 1.0);
        grpPanel.Items = newKidList;
        grpPanel.RowStretch = zeros(plus(nPanels, 3.0));
    case 'NoBoxWithTitleAndLine'
    case 'NoBoxWithTitleAndSpace'
    case {'NoBoxNoTitle','Spacer'}
        % 89 91
        grpPanel.Type = 'panel';
        grpPanel.RowSpan = [1.0 1.0];
        grpPanel.ColSpan = [1.0 1.0];
        grpPanel.LayoutGrid = horzcat(plus(nPanels, 1.0), 1.0);
        grpPanel.Items = childItems;
        grpPanel.RowStretch = zeros(1.0, nPanels);
        grpPanel.RowStretch(plus(end, 1.0)) = 1.0;
    case 'TabPage'
        grpPanel.Name = hThis.Label;
        grpPanel.Items = childItems;
    case 'TabContainer'
        grpPanel.Type = 'tab';
        grpPanel.RowSpan = [1.0 1.0];
        grpPanel.ColSpan = [1.0 1.0];
        grpPanel.LayoutGrid = horzcat(nPanels, 1.0);
        grpPanel.Tabs = childItems;
    case 'VerticalAlignment'
        [layoutGrid, rowStretch, colStretch, children] = l_explodeChildren(childItems);
        grpPanel.Type = 'group';
        grpPanel.RowSpan = [1.0 1.0];
        grpPanel.ColSpan = [1.0 1.0];
        grpPanel.Flat = strcmpi(hThis.Style, 'Flat');
        grpPanel.LayoutGrid = layoutGrid;
        grpPanel.Items = children;
        grpPanel.RowStretch = rowStretch;
        grpPanel.ColStretch = colStretch;
    otherwise
        grpPanel.Type = 'group';
        grpPanel.RowSpan = [1.0 1.0];
        grpPanel.ColSpan = [1.0 1.0];
        grpPanel.LayoutGrid = horzcat(nPanels, 1.0);
        grpPanel.Items = childItems;
        grpPanel.RowStretch = zeros(1.0, nPanels);
    end % switch
    % 124 127
    % 125 127
    if not(strcmpi(hThis.StdLayoutCfg, 'Unset'))
        grpPanel = hThis.CleanAndLayoutDDGSchema(grpPanel, hThis.StdLayoutCfg);
    end % if
    % 129 131
    schema = grpPanel;
    % 131 133
end % function
function [layoutGrid, rowstretch, colstretch, grandchildren] = l_explodeChildren(childItems)
    % 134 141
    % 135 141
    % 136 141
    % 137 141
    % 138 141
    % 139 141
    nPanels = numel(childItems);
    firstChild = childItems{1.0};
    panelLayoutGrid = firstChild.LayoutGrid;
    panelColStretch = firstChild.ColStretch;
    % 144 146
    grandchildren = {};
    for i=1.0:nPanels
        for j=1.0:length(childItems{i}.Items)
            grandChild = childItems{i}.Items{j};
            grandChild.RowSpan = horzcat(i, i);
            grandchildren = horzcat(grandchildren, grandChild);
        end % for
    end % for
    rowstretch = zeros(1.0, nPanels);
    colstretch = panelColStretch;
    layoutGrid = horzcat(nPanels, panelLayoutGrid(2.0));
    % 156 158
end % function
