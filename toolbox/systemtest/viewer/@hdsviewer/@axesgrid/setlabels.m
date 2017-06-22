function setlabels(this, varargin)
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
    backax = this.BackgroundAxes;
    set(vertcat(horzcat(backax.Title), horzcat(backax.XLabel), horzcat(backax.YLabel)), 'Visible', this.Visible);
    % 13 15
    % 14 15
    if strcmp(this.Visible, 'on')
        % 16 17
        LabelMap = feval(this.LabelFcn{:});
        % 18 20
        % 19 20
        set(backax.Title, 'String', this.Title, struct(this.TitleStyle))
        % 21 23
        % 22 23
        [VisAxes, indrow, indcol] = findvisible(this);
        [nr, nc] = size(VisAxes);
        if eq(nr, 0.0) || eq(nc, 0.0)
            return;
        end % if
        % 28 30
        % 29 30
        set(VisAxes, 'XTickLabel', [], 'YTickLabel', [])
        for ct=1.0:mtimes(nr, nc)
            set(horzcat(VisAxes(ct).Title, VisAxes(ct).XLabel, VisAxes(ct).YLabel), 'String', '', 'HitTest', 'off')
        end % for
        % 34 36
        % 35 36
        if strcmp(this.YNormalization, 'off')
            set(VisAxes(:, 1.0), 'YTickLabelMode', 'auto')
        end % if
        set(VisAxes(nr, :), 'XTickLabelMode', 'auto')
        % 40 43
        % 41 43
        % 42 43
        for k=1.0:length(VisAxes(:))
            set(VisAxes(k).YLabel, 'String', LabelMap.YLabel, struct(LabelMap.YLabelStyle))
            set(VisAxes(k).XLabel, 'String', LabelMap.XLabel, struct(LabelMap.XLabelStyle))
            set(VisAxes(k).ZLabel, 'String', LabelMap.ZLabel, struct(LabelMap.ZLabelStyle))
        end % for
        % 48 50
        % 49 50
        if any(strcmp(this.AxesGrouping, {'none'}))
            for r=1.0:nr
                for c=1.0:nc
                    title = sprintf('%s %s', LabelMap.ColumnLabel{indcol(c)}, LabelMap.RowLabel{indrow(r)});
                    % 54 55
                    set(VisAxes(r, c).Title, 'String', title, struct(LabelMap.ColumnLabelStyle));
                end % for
            end % for
        end % if
        % 59 60
    end % if
end % function
