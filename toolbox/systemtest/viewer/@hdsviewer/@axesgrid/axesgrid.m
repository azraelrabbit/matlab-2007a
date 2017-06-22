function h = axesgrid(gridsize, hndl, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    h = hdsviewer.axesgrid;
    gridsize = horzcat(gridsize, ones(1.0, mtimes(2.0, eq(length(gridsize), 2.0))));
    h.Size = gridsize;
    % 12 15
    % 13 15
    if any(not(ishandle(hndl)))
        error('The second argument contains invalid handles.')
    else
        hndl = handle(hndl);
    end % if
    % 19 21
    if isa(hndl, 'hg.axes')
        Visibility = hndl(1.0).Visible;
        Position = hndl(1.0).Position;
        % 23 25
        set(hndl, 'Visible', 'off', 'ContentsVisible', 'off')
    else
        error('The second argument must be a figure handle or a vector of axes handles.')
    end % if
    GridState = hndl(1.0).XGrid;
    % 29 32
    % 30 32
    h.Parent = hndl(1.0).Parent;
    h.AxesStyle = ctrluis.axesstyle(hndl(1.0));
    h.UIContextMenu = uicontextmenu('Parent', ancestor(h.Parent, 'hg.figure'));
    h.Title = get(hndl(1.0).Title, 'String');
    h.XLabel = get(hndl(1.0).XLabel, 'String');
    h.YLabel = get(hndl(1.0).YLabel, 'String');
    hTitle = hndl(1.0).Title;
    hXLabel = hndl(1.0).XLabel;
    hYLabel = hndl(1.0).YLabel;
    h.TitleStyle = ctrluis.labelstyle(hTitle);
    h.XLabelStyle = ctrluis.labelstyle(hXLabel);
    h.YLabelStyle = ctrluis.labelstyle(hYLabel);
    if eq(gridsize(4.0), 1.0)
        h.XUnits = '';
    else
        h.XUnits = repmat({''}, horzcat(gridsize(4.0), 1.0));
    end % if
    if eq(gridsize(3.0), 1.0)
        h.YUnits = '';
    else
        h.YUnits = repmat({''}, horzcat(gridsize(3.0), 1.0));
    end % if
    h.XUnits = repmat({''}, horzcat(gridsize(4.0), 1.0));
    h.YUnits = repmat({''}, horzcat(gridsize(3.0), 1.0));
    h.XScale = hndl(1.0).XScale;
    h.YScale = hndl(1.0).YScale;
    h.ColumnVisible = repmat({'on'}, horzcat(mtimes(gridsize(2.0), gridsize(4.0)), 1.0));
    h.ColumnLabelStyle = ctrluis.labelstyle(hTitle);
    h.ColumnLabelStyle.Color = h.AxesStyle.XColor;
    h.ColumnLabelStyle.FontSize = h.AxesStyle.FontSize;
    h.ColumnLabelStyle.Location = 'top';
    h.RowVisible = repmat({'on'}, horzcat(mtimes(gridsize(1.0), gridsize(3.0)), 1.0));
    h.RowLabelStyle = ctrluis.labelstyle(hTitle);
    h.RowLabelStyle.Color = h.AxesStyle.YColor;
    h.RowLabelStyle.FontSize = h.AxesStyle.FontSize;
    h.RowLabelStyle.Location = 'left';
    h.Position = Position;
    h.LimitFcn = cellhorzcat(@updatelims, h);
    h.LabelFcn = cellhorzcat(@DefaultLabelFcn, h);
    % 70 73
    % 71 73
    set(ancestor(h.Parent, 'hg.figure'), 'DoubleBuffer', 'on')
    % 73 76
    % 74 76
    initialize(h, hndl)
    % 76 79
    % 77 79
    h.BackgroundAxes = axes('Parent', double(h.Parent), 'Visible', 'off', 'HandleVisibility', 'callback', 'Xlim', [0.0 1.0], 'Ylim', [0.0 1.0], 'XTick', [], 'YTick', [], 'XTickLabel', [], 'YTickLabel', [], 'Position', Position);
    % 79 82
    % 80 82
    Labels = get(h.BackgroundAxes, {'Title','XLabel','YLabel','ZLabel'});
    set(horzcat(Labels{:}), 'HorizontalAlignment', 'center', 'HitTest', 'off', 'Units', 'pixel')
    % 83 87
    % 84 87
    % 85 87
    bh = hggetbehavior(h.BackgroundAxes, 'print');
    bh.PrePrintCallback = cellhorzcat(@LocalPrintCleanup, h);
    bh.PostPrintCallback = cellhorzcat(@LocalPrintCleanup, h);
    % 89 95
    % 90 95
    % 91 95
    % 92 95
    % 93 95
    [Visibility, varargin] = utGetVisibleSettings(h, Visibility, varargin);
    h.set('Grid', GridState, varargin{:});
    % 96 99
    % 97 99
    h.Visible = Visibility;
    % 99 102
    % 100 102
    addlimitmgr(h)
end % function
function LocalPrintCleanup(src, data, h)
    % 104 109
    % 105 109
    % 106 109
    % 107 109
    if strcmpi(data, 'PrePrintCallback')
        h.PrintLayoutManager = 'on';
    else
        h.PrintLayoutManager = 'off';
    end % if
end % function
