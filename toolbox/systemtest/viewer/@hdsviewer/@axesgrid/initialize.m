function initialize(this, hgaxes)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    nr = prod(this.Size([1.0 3.0]));
    nc = prod(this.Size([2.0 4.0]));
    % 13 15
    % 14 15
    this.Axes = ctrluis.plotarray(this.Size, hgaxes(:));
    this.Axes4d = getaxes(this.Axes);
    this.Axes2d = reshape(permute(this.Axes4d, [3.0 1.0 4.0 2.0]), horzcat(nr, nc));
    % 18 20
    % 19 20
    this.XLimMode = hgaxes(1.0).XLimMode;
    this.YLimMode = hgaxes(1.0).YLimMode;
    this.NextPlot = hgaxes(1.0).NextPlot;
    this.ColumnLabel = repmat({''}, horzcat(nc, 1.0));
    this.RowLabel = repmat({''}, horzcat(nr, 1.0));
    this.zLabel = '';
    % 26 28
    % 27 28
    set(this.Axes2d, 'Units', 'normalized', 'Box', 'on', 'XtickMode', 'auto', 'YtickMode', 'auto', 'XScale', hgaxes(1.0).XScale, 'YScale', hgaxes(1.0).YScale, 'Xlim', hgaxes(1.0).Xlim, 'Ylim', hgaxes(1.0).Ylim, 'NextPlot', this.NextPlot, 'UIContextMenu', this.UIContextMenu, 'XGrid', 'off', 'YGrid', 'off', struct(this.AxesStyle));
    % 29 36
    % 30 36
    % 31 36
    % 32 36
    % 33 36
    % 34 36
    % 35 36
    addlisteners(this)
    % 37 39
    % 38 39
    addbypass(this)
end % function
