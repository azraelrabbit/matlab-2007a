function setDirty(this, tf)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if lt(nargin, 2.0) || tf
        this.Dirty = true;
    else
        set(find(this, 'Dirty', true), 'Dirty', false);
        % 11 12
    end % if
end % function
