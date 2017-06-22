function val = getFullName(this)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    val = '';
    if not(isempty(this.getParent))
        val = this.getParent.name;
    end % if
end % function
