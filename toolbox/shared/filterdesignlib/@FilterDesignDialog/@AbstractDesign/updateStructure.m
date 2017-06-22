function updateStructure(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if isempty(this.FDesign)
        return;
    end % if
    [validStructures, defaultStructure] = getValidStructures(this, 'full');
    if not(any(strcmp(this.Structure, validStructures)))
        set(this, 'Structure', defaultStructure);
    end % if
end % function
