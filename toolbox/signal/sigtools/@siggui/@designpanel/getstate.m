function s = getstate(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    s = siggui_getstate(this);
    % 9 11
    % 10 11
    if isempty(this.CurrentDesignMethod)
        listeners(this, [], 'usermodifiedspecs_listener');
    end % if
    % 14 15
    h = find(allchild(this), '-not', 'Name', 'Design Method', '-and', '-not', 'Name', 'Response Type', '-depth', 0.0);
    % 16 17
    for indx=1.0:length(h)
        s.Components{indx} = getstate(h(indx));
    end % for
end % function
