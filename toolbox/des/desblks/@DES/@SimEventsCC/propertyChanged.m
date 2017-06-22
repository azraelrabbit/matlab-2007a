function propertyChanged(secc, event)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    bd = secc.getBlockDiagram;
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    if not(isempty(bd))
        set_param(bd.Handle, 'Dirty', 'on');
    end % if
end % function
