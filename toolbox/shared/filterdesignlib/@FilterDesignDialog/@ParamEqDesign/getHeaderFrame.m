function headerFrame = getHeaderFrame(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    items = getOrderWidgets(this, 2.0, true);
    % 9 10
    headerFrame.Type = 'group';
    headerFrame.Name = 'Filter specifications';
    headerFrame.Items = items;
    headerFrame.LayoutGrid = [3.0 4.0];
    headerFrame.ColStretch = [0.0 1.0 0.0 1.0];
    headerFrame.Tag = 'FilterSpecsGroup';
end % function
