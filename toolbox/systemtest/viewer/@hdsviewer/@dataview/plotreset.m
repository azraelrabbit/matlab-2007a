function isok = plotreset(r)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    Axes = getaxes(r.Parent.AxesGrid);
    isok = false;
    if not(isequal(r.Parent.AxesGrid.Size, horzcat(length(r.Data.RowData), length(r.Data.ColumnData), 1.0, 1.0, 1.0)))
        % 13 15
        % 14 15
        set(ghandles(r.View), 'Parent', Axes(1.0));
        set(r.Group, 'Parent', Axes(1.0));
        % 17 18
        if eq(length(r.Data.RowData), 0.0) || eq(length(r.Data.ColumnData), 0.0)
            r.Parent.AxesGrid.Size = [1.0 1.0 1.0 1.0 1.0];
            r.Data.Exception = true;
            return;
        else
            r.Data.Exception = false;
        end % if
        r.Parent.AxesGrid.Size = horzcat(length(r.Data.RowData), length(r.Data.ColumnData), 1.0, 1.0, 1.0);
    end % if
    % 27 29
    % 28 29
    curaxes = get(ancestor(Axes(1.0), 'hg.figure'), 'CurrentAxes');
    if not(any(eq(double(curaxes), double(Axes))))
        set(ancestor(Axes(1.0), 'hg.figure'), 'CurrentAxes', Axes(1.0))
    end % if
    % 33 35
    % 34 35
    Axes = getaxes(r.Parent.AxesGrid);
    gonegrps = r.Group(plus(numel(Axes), 1.0):end);
    delete(gonegrps(ishandle(gonegrps)));
    r.Group(plus(numel(Axes), 1.0):end) = [];
    for ct=plus(length(r.Group), 1.0):numel(Axes)
        r.Group(ct) = hg.hggroup('parent', Axes(ct), 'Hittest', 'off');
        b = hggetbehavior(r.Group(ct), 'PlotEdit');
        b.EnableDelete = false;
        hasbehavior(r.Group(ct), 'legend', true)
        schema.prop(handle(r.Group(ct)), 'Displayname', 'MATLAB array');
    end % for
    % 46 51
    % 47 51
    % 48 51
    % 49 51
    % 50 51
    for k=1.0:numel(r.Group)
        set(r.Group(k), 'Parent', Axes(k))
    end % for
    % 54 56
    % 55 56
    r.updateGroupInfo;
    % 57 59
    % 58 59
    r.Parent.rclabel;
    r.Parent.AxesGrid.setlabels;
    % 61 62
    isok = true;
end % function
