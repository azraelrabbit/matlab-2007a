function n = getName(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if not(isempty(this.ClassPointer))
        n = this.ClassPointer.Name;
    else
        n = 'Root';
    end % if
end % function
