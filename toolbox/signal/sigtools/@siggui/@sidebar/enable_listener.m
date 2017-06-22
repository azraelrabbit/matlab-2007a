function enable_listener(this, eventData)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    sigcontainer_enable_listener(this, eventData);
    % 9 10
    h = get(this, 'Handles');
    index = get(this, 'CurrentPanel');
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    if not(isempty(h.button)) && not(isequal(index, 0.0)) && strcmpi(this.Enable, 'On')
        set(h.button(index), 'Enable', 'Inactive');
    end % if
end % function
