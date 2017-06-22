function initialize(this, ax, gridsize)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    geometry = struct('HeightRatio', [], 'HorizontalGap', 16.0, 'VerticalGap', 16.0, 'LeftMargin', 12.0, 'TopMargin', 20.0);
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    this.AxesGrid = ctrluis.axesgrid(gridsize, ax, 'Visible', 'off', 'Geometry', geometry, 'YLimSharing', 'all', 'XLimSharing', 'all', 'LimitFcn', cellhorzcat(@updatelims, this), 'Title', 'Time Series Plot', 'XLabel', '', 'YLabel', '', 'XUnit', '');
    % 17 28
    % 18 28
    % 19 28
    % 20 28
    % 21 28
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    this.AxesGrid.TitleStyle.Interpreter = 'none';
    this.AxesGrid.XLabelStyle.Interpreter = 'none';
    this.AxesGrid.YLabelStyle.Interpreter = 'none';
    this.AxesGrid.RowLabelStyle.Interpreter = 'none';
    this.AxesGrid.ColumnLabelStyle.Interpreter = 'none';
    % 32 35
    % 33 35
    this.AxesGrid.Visible = this.Visible;
end % function
