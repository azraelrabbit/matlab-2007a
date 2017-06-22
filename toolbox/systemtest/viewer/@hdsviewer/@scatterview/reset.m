function reset(this, Groups)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    dGroups = double(Groups);
    nax = prod(size(Groups));
    visibility = this.Visible;
    viewHandles = ghandles(this);
    % 13 17
    % 14 17
    % 15 17
    if gt(length(viewHandles), nax)
        gonehandles = viewHandles(plus(nax, 1.0):length(viewHandles));
        delete(gonehandles(ishandle(gonehandles)));
        viewHandles(plus(nax, 1.0):length(viewHandles)) = [];
        this.Scatters = viewHandles;
    end % if
    theseScatters = zeros(minus(nax, length(viewHandles)), 1.0);
    for ct=plus(length(viewHandles), 1.0):nax
        theseScatters(minus(ct, length(viewHandles))) = line('XData', [], 'YData', [], 'Parent', dGroups(ct), 'Visible', visibility, 'ButtonDownFcn', cellhorzcat(@localSelection, this), 'Marker', this.DefaultMarker, 'LineStyle', 'none');
        % 25 28
        % 26 28
    end % for
    this.Scatters = vertcat(this.Scatters(:), handle(theseScatters(:)));
    % 29 32
    % 30 32
    if isempty(this.SelectionMarker) || not(ishandle(this.SelectionMarker))
        this.SelectionMarker = line('Marker', 'square', 'linestyle', 'none', 'MarkerFaceColor', [1.0 0.0 0.0], 'MarkerSize', 12.0, 'visible', 'off', 'Parent', dGroups(1.0));
        % 33 36
        % 34 36
        hasbehavior(this.SelectionMarker, 'legend', false)
    end % if
end % function
function localSelection(es, ed, view)
    % 39 42
    % 40 42
    view.select(es);
end % function
