function LabelMap = DefaultLabelFcn(this)
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
    LabelMap = struct('XLabel', this.xLabel, 'XLabelStyle', this.XLabelStyle, 'YLabel', this.yLabel, 'YLabelStyle', this.YLabelStyle, 'ColumnLabel', cellhorzcat(this.ColumnLabel), 'ColumnLabelStyle', this.ColumnLabelStyle, 'RowLabel', cellhorzcat(this.RowLabel), 'RowLabelStyle', this.RowLabelStyle, 'ZLabel', this.zLabel, 'ZLabelStyle', this.RowLabelStyle);
    % 14 23
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    % 22 23
end % function
