function draw(this)
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
    if strcmp(this.Visible, 'off')
        return;
    end % if
    % 14 16
    % 15 16
    f = ancestor(this.Parent.AxesGrid.Parent, 'figure');
    d = datacursormode(f);
    d.removeAllDataCursors;
    % 19 21
    % 20 21
    if not(isempty(this.DataFcn))
        this.Data.Exception = false;
        feval(this.DataFcn{:});
    end % if
    if this.Data.Exception
        this.Data.clear
    else
        % 28 29
        if this.plotreset
            % 30 31
            this.localize;
        end % if
    end % if
    % 34 36
    % 35 36
    VisibleView = strcmp(get(this.View, 'Visible'), 'on');
    for ct=ctranspose(find(VisibleView))
        this.View(ct).draw(this.Data(ct));
    end % for
end % function
