function GroupLegendInfo = createLegendInfo(this, varargin)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    GroupLegendInfo.type = 'line';
    GroupLegendInfo.props = cellhorzcat('xdata', [.1 .9], 'ydata', [.2 .2], 'LineStyle', '-', varargin{:});
end % function
