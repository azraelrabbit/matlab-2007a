function needIt = blockIndicatesNeedForModelOperation(this, mdl, block)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    opData = this.getModelOperationData(mdl);
    % 15 17
    needIt = isempty(opData.blocksPerformingOperation) || eq(block, opData.blocksPerformingOperation);
    % 17 19
end
