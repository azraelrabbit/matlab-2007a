function reset(this, Groups)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    nax = prod(size(Groups));
    dGroups = double(Groups);
    % 12 13
    viewHandles = ghandles(this);
    % 14 16
    % 15 16
    if gt(length(viewHandles), nax)
        gonehandles = viewHandles(plus(nax, 1.0):length(viewHandles));
        delete(gonehandles(ishandle(gonehandles)));
        viewHandles(plus(nax, 1.0):length(viewHandles)) = [];
        this.Patches = viewHandles;
    end % if
    for ct=plus(length(viewHandles), 1.0):nax
        this.Patches(plus(end, 1.0)) = patch('XData', [], 'YData', [], 'ZData', [], 'Parent', dGroups(ct), 'Visible', this.Visible, 'FaceColor', [1.0 1.0 1.0], 'Hittest', 'off');
        % 24 26
        % 25 26
    end % for
    this.Patches = this.Patches(:);
    % 28 30
    % 29 30
    if isempty(this.SelectionMarker) || not(ishandle(this.SelectionMarker))
        this.SelectionMarker = patch('xdata', [], 'ydata', [], 'zdata', [], 'Parent', dGroups(1.0), 'visible', 'off');
        % 32 33
        hasbehavior(this.SelectionMarker, 'legend', false)
    end % if
end % function
