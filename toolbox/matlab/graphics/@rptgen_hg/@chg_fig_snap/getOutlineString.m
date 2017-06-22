function s = getOutlineString(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    s = this.getName;
    if not(isempty(this.Title))
        s = horzcat(s, ' - ', this.Title);
    end % if
end % function
