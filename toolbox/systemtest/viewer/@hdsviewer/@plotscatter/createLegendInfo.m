function GroupLegendInfo = createLegendInfo(this, varargin)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    GroupLegendInfo.type = 'line';
    GroupLegendInfo.props = cellhorzcat('xdata', .5, 'ydata', .5, 'Marker', 'o', 'LineStyle', 'none', varargin{:});
end % function
