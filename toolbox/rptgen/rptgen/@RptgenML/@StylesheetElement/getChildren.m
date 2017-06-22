function c = getChildren(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if isLibrary(this)
        c(1.0:0.0) = handle(0.0);
    else
        c = getChildren(this.up);
    end % if
end % function
