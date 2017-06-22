function opData = clearModelOperationData(this, mdl)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    [opData, mdlIdx] = this.getModelOperationData(mdl);
    opData = initializeModelOperation;
    this.modelInfo(mdlIdx).modelOperation = opData;
end % function
