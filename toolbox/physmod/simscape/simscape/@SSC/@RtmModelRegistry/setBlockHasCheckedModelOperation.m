function setBlockHasCheckedModelOperation(this, mdl, opName, block)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    [opData, mdlIdx] = this.getModelOperationData(mdl);
    opData.opName = opName;
    opData.blocksPerformingOperation = block;
    % 12 13
    this.modelInfo(mdlIdx).modelOperation = opData;
end % function
