function this = setlength(this, newlen)
    % 1 4
    % 2 4
    % 3 4
    if not(isequal(this.Length, newlen))
        this.Length_ = newlen;
        this.Increment = NaN;
    end % if
end % function
