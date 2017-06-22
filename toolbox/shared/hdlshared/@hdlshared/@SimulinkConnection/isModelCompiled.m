function compiled = isModelCompiled(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    compiled = false;
    if not(isempty(this.Model))
        compiled = strcmp(this.Model.SimulationStatus, 'initializing');
    end % if
end % function
