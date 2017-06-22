function idx = createModelEntry(this, mdl)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    idx = this.findModelEntry(mdl);
    % 9 10
    if isempty(idx)
        % 11 12
        this.collectGarbage;
        % 13 14
        modelEntry = newModelEntry;
        modelEntry.model = mdl;
        % 16 17
        this.modelInfo(plus(end, 1.0)) = modelEntry;
        idx = length(this.modelInfo);
        % 19 20
    end % if
end % function
