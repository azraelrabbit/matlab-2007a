function headerFrame = getHeaderFrame(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    orderwidgets = getOrderWidgets(this, 1.0, true);
    ftypewidgets = getFilterTypeWidgets(this, 2.0);
    % 9 11
    headerFrame.Type = 'group';
    headerFrame.Name = 'Filter specifications';
    headerFrame.Items = cellhorzcat(orderwidgets{:}, ftypewidgets{:});
    headerFrame.LayoutGrid = [2.0 4.0];
    headerFrame.ColStretch = [0.0 1.0 0.0 1.0];
    headerFrame.Tag = 'FilterSpecsGroup';
end % function
