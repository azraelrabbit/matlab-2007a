function setExaminingModel(this, mdl, isExamining)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    idx = this.createModelEntry(mdl);
    % 7 8
    this.modelInfo(idx).modelData.examining = isExamining;
end % function
