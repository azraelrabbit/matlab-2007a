function setDirty(this, isDirty)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if lt(nargin, 2.0) || isDirty
        this.Dirty = true;
    else
        % 10 13
        % 11 13
        % 12 13
        % 13 14
        this.Dirty = false;
    end % if
end % function
