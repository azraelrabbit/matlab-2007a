function initialize(this, ax, gridsize)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    geometry = struct('HeightRatio', [], 'HorizontalGap', 16.0, 'VerticalGap', 46.0, 'LeftMargin', 12.0, 'TopMargin', 20.0);
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    this.AxesGrid = hdsviewer.axesgrid(gridsize, ax, 'Visible', 'off', 'Geometry', geometry, 'YLimSharing', 'all', 'XLimSharing', 'all', 'LimitFcn', cellhorzcat(@updatelims, this), 'Title', 'Projected 3d Plot', 'XLabel', '', 'YLabel', '', 'XUnit', '');
    % 15 26
    % 16 26
    % 17 26
    % 18 26
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    this.AxesGrid.TitleStyle.Interpreter = 'none';
    this.AxesGrid.XLabelStyle.Interpreter = 'none';
    this.AxesGrid.YLabelStyle.Interpreter = 'none';
    this.AxesGrid.ZLabelStyle.Interpreter = 'none';
    this.AxesGrid.RowLabelStyle.Interpreter = 'none';
    this.AxesGrid.ColumnLabelStyle.Interpreter = 'none';
    % 31 34
    % 32 34
    this.AxesGrid.Visible = this.Visible;
end % function
