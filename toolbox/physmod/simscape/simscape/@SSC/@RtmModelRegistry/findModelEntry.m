function idx = findModelEntry(this, mdl)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    idx = find(eq(horzcat(this.modelInfo.model), mdl));
end % function
