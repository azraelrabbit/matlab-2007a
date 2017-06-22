function viewHelp(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if not(isa(this.ComponentInstance, this.ClassName))
        this.ComponentInstance = this.makeComponent;
    end % if
    % 11 12
    viewHelp(this.ComponentInstance);
end % function
