function propertyChanged(this, event)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    bd = this.getBlockDiagram;
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    if not(isempty(bd))
        set_param(bd.Handle, 'Dirty', 'on');
    end % if
end % function
