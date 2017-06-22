function reset(this, Groups)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    nax = prod(size(Groups));
    dGroups = double(Groups);
    % 11 13
    viewHandles = ghandles(this);
    % 13 16
    % 14 16
    if gt(length(viewHandles), nax)
        gonehandles = viewHandles(plus(nax, 1.0):length(viewHandles));
        delete(gonehandles(ishandle(gonehandles)));
        viewHandles(plus(nax, 1.0):length(viewHandles)) = [];
        this.Lines = viewHandles;
    end % if
    for ct=plus(length(viewHandles), 1.0):nax
        this.Lines(plus(end, 1.0)) = handle(line('XData', [], 'YData', [], 'Parent', dGroups(ct), 'Visible', this.Visible, 'ButtonDownFcn', cellhorzcat(@localSelection, this)));
        % 23 26
        % 24 26
    end % for
    this.Lines = this.Lines(:);
    % 27 30
    % 28 30
    if isempty(this.SelectionMarker) || not(ishandle(this.SelectionMarker))
        this.SelectionMarker = line('Marker', 'square', 'linestyle', 'none', 'MarkerFaceColor', [1.0 0.0 0.0], 'MarkerSize', 12.0, 'Parent', dGroups(1.0), 'visible', 'off');
        % 31 34
        % 32 34
        hasbehavior(this.SelectionMarker, 'legend', false)
    end % if
end % function
function localSelection(es, ed, view)
    % 37 39
    view.select(es);
end % function
